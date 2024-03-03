<template>
  <NuxtLayout>
    <!-- <NuxtWelcome /> -->
    <RouterView/>
  </NuxtLayout>
</template>

<script setup>
//  import { createWeb3Modal, defaultConfig } from '@web3modal/ethers/vue'

// // 1. Get projectId at https://cloud.walletconnect.com
// const projectId = 'eb01c9794c2c1f65cc2d6c39506409e7'

// // 2. Set chains
// const mainnet = {
//   chainId: 1,
//   name: 'Ethereum',
//   currency: 'ETH',
//   explorerUrl: 'https://etherscan.io',
//   rpcUrl: 'https://cloudflare-eth.com'
// }

// // 3. Create modal
// const metadata = {
//   name: 'My Website',
//   description: 'My Website description',
//   url: 'https://mywebsite.com', // origin must match your domain & subdomain
//   icons: ['https://avatars.mywebsite.com/']
// }

// createWeb3Modal({
//   ethersConfig: defaultConfig({
//     metadata,
//     defaultChainId: 1,
//     enableEIP6963: true,
//     enableInjected: true,
//     enableCoinbase: true,
//   }),
//   chains: [mainnet],
//   projectId,
// })
</script>

<style lang="scss">
@font-face {
  font-family: "Recoleta";
  src: url('@/assets/fonts/Recoleta-Regular.woff2') format("truetype");
}

$family-primary: 'Recoleta';

@import "bulma/bulma";

html,
body {
  margin: 0;
  padding: 0;
  height: 100vh;
  background: #121212;
  width: 100vw;
  position: relative;
  color: white;
}
</style>