<template>
    <div>
        <div v-if="!currentConnection?.signer">
            <div v-if="networkError">
                {{ networkError }}
                <button @click="dismissNet()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <p>Please connect your wallet</p>
            <button @click="connectWallet">
                Connect Wallet
            </button>
        </div>
        <div v-else="currentConnection?.signer">
           <p>
                Your adress {{ currentConnection.signer.address }}
           </p> 
           <button @click="deposit()">deposit</button>
           <button @click="drawWinner()">draw winner</button>
        </div>
        <div v-if="transactionError">
            {{ getRpcErrorMessage(transactionError) }}
            <button @click="dismissTx()">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div v-if="txBeingSent">
            Waiting for transaction <strong>{{txBeingSent}}</strong> 
        </div>
        <div v-if="currentBalance">
            Your balance: {{ ethers.formatEther(currentBalance) }} ETH
        </div>
    </div>
</template>

<script setup>
// const props = defineProps({
//     dismiss: {
//         type: Function,
//         required: true
//     },
//     networkError: {
//         type: String,
//         default: undefined,
//         required: true
//     },
//     connectWallet: {
//         type: Promise,
//         required: true
//     },
//     transactionError: {
//         type: String,
//         // required: true
//     }
// });
import { ethers } from 'ethers';
import { Web3 } from 'web3';
import { abi } from '../../out/Ludka.sol/Ludka.json';
import axios from 'axios'; 

const NETWORK_ID = '0xa0c71fd';
const CONTRACT_ADDRESS = '0x2A50a2Fa188805CDE50c9369e0Ae682FF24c0c85';
// const CONTRACT_ADDRESS = '0x0355b7b8cb128fa5692729ab3aaa199c1753f726';
const isMetamaskSupported = ref(false);
const account = ref(null);
const networkError = ref(undefined);
const transactionError = ref(undefined);
const txBeingSent = ref(undefined);
const currentBalance = ref(undefined);
// const random = ref ({
//     number: null,
//     commitment: null
// })

// const web3 = new Web3('https://sepolia.blast.io');
const web3 = new Web3('http://localhost:8545');


let randomNumber = null;
let commitment = null;

// const randomHex = () => {
//     return ethers.keccak256(web3.utils.randomHex(32));
// }
const pythProvider = '0x6CC14824Ea2918f5De5C2f75A9Da968ad4BD6344';
const pythProviderUri = 'https://fortuna-staging.dourolabs.app/v1/chains/blast-testnet';

// console.log(abi)

// ???
const currentConnection = ref({ 
    provider: undefined,
    signer: undefined
})  
let provider = undefined;
let signer = undefined;

onMounted(() => {
    isMetamaskSupported.value = typeof window.ethereum !== "undefined";
});

watch([currentConnection, txBeingSent], 
    async () => {
        if (provider && signer) {
            currentBalance.value = await provider.getBalance(
                signer.address
            )
        }
    }
);

async function connectWallet() {
    if (!isMetamaskSupported.value) {
        networkError.value = "Please install Metamask!";
        return
    }

    if(!(await checkNetwork())) {
        return
    }

    const [selectedAcc] = await window.ethereum.request(
        { method: "eth_requestAccounts" }
    )
    account.value = selectedAcc;

    await initialize(ethers.getAddress(selectedAcc));
    
    // await test();

    window.ethereum.on(
        "accountsChanged",
        async ([newAcc]) => {
            if (newAcc === undefined) {
                return resetState();
            }

            await initialize(ethers.getAddress(newAcc))
        }
    );

    window.ethereum.on("chainChanged", ([networkId]) => {
        resetState();
    }); 
};


const checkNetwork = async () => {
    const chosenChainId = await window.ethereum.request({
        method: "eth_chainId",
    })
    
    if (chosenChainId === NETWORK_ID) {
        return true;
    }

    networkError.value = "Please connect to Foundry network (localhost:8545)!"
    return false;
};

const initialize = async (selectedAcc) => {
    provider = new ethers.BrowserProvider(window.ethereum);
    signer = await provider.getSigner(selectedAcc);

    randomNumber = Web3.utils.randomHex(32);
    commitment = ethers.keccak256(randomNumber);
    // console.log('number ', randomNumber);
    // console.log('commitment ', commitment);

    currentConnection.value = {
        provider,
        signer
    }
};

const resetState = () => {
    networkError.value = undefined;
    transactionError.value = undefined,
    txBeingSent.value = undefined,
    currentBalance.value = undefined,
    currentConnection.value = {
        provider: undefined,
        signer: undefined
    }
};

const dismissNet = () => {
    networkError.value = undefined;
};

const dismissTx = () => {
    transactionError.value = undefined;
};

// const getRpcErrorMessage = (error) => {
//     console.log(error);
//     if (error.data) {
//         return error.data.message;
//     }

//     return error.message;
// };

// const providerContract = new ethers.Contract(CONTRACT_ADDRESS, abi, currentConnection.value.provider)
// console.log(contract)
// console.log(currentConnection.value.)

const deposit = async () => {
    try {
        const random = commitment;
        txBeingSent.value = random;
        const signerContract = new ethers.Contract(CONTRACT_ADDRESS, JSON.stringify(abi), signer);
        const deposit = await signerContract.deposit(
            3,
            // random,
            // ethers.ZeroHash,
            // ethers.ZeroHash,
            { value: ethers.parseEther('0.000000002') }
        ) 
        // const signerContract = new ethers.Contract(CONTRACT_ADDRESS, abi, currentConnection.value.signer)
        // const deposit = await signerContract.deposit(1, [], ethers.keccak256(web3.utils.randomHex(32)), 0, ethers.ZeroHash, ethers.ZeroHash, {value: ethers.parseEther('0.0002')}) 
        await deposit.wait()
    } catch (error) {
        if (error.reason === 'rejected') {
            return
        }
        console.error(error)
    } finally {
        txBeingSent.value = undefined;
    }
};

const drawWinner = async () => {
    const contract = new web3.eth.Contract(abi, CONTRACT_ADDRESS);
    const providerRandomNumber = await axios.get(`${pythProviderUri}/revelations/3879`);
    try {
        // const providerContract = new ethers.Contract(CONTRACT_ADDRESS, abi, currentConnection.value.provider)
        const signerContract = new ethers.Contract(CONTRACT_ADDRESS, abi, signer);
        const draw = await signerContract.drawWinner(
            randomNumber,
            '0x' + providerRandomNumber.data.value.data,
        );
        await draw.wait();
        // const draw = await contract.methods.drawWinner(randomNumber, '0x' + providerRandomNumber.data.value.data).call({ from: '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266' });
    } catch (error) {
        console.error(error)
    } finally {
        txBeingSent.value = undefined;
    }
};

</script>

<style lang="scss" scoped>

</style>