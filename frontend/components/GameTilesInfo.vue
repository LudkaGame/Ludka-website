<template>
    <div class="app-info">
        <div class="app-info__round">Round 322</div>
        <div class="app-info__timer">loader...</div>
        <div
        v-for="(element, index) in infoAreas"
        :key="index"
        :class="`app-info__${element.class}`">
            <div class="app-info__value">{{element.value}}</div>
            <div class="app-info__area">{{element.area}}</div>
        </div>
        <!-- <div class="app-info__round">Round 322</div>
        <div class="app-info__timer">useless loader</div>
        <div class="app-info__pool">
            <div class="app-info__value">10 sol</div>
            <div class="app-info__area">Prize pool</div>
        </div>
        <div class="app-info__players">players 14/18</div>
        <div class="app-info__entries">2 stavki</div>
        <div class="app-info__chanse">-10</div> -->
    </div>
</template>

<script setup>
const infoAreas = ref([
    // {
    //     class: 'round',
    //     area: 'Round',
    //     value: 322,
    // },
    // {
    //     class: 'timer',
    //     area: 'loader...'
    // },
    {
        class: 'pool',
        area: 'Prize pool',
        value: 0,
    },
    {
        class: 'players',
        area: 'Players',
        value: 14,
    },
    {
        class: 'entries',
        area: 'Your entries',
        value: 0,
    },
    {
        class: 'fortune',
        area: 'Your fortune',
        value: 1337,
    }
])
</script>

<style lang="scss" scoped>
.app {
    &-info {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-template-areas: 
        "round timer"
        "pool players"
        "entries fortune";
        row-gap: 12px;


        &__round {  grid-area: round;   }
        &__timer {  grid-area: timer;   }
        &__pool {  grid-area: pool;   }
        &__players {  grid-area: players;   }
        &__entries {  grid-area: entries;   }
        &__fortune {  grid-area: fortune;   }
    
        &__pool, 
        &__players,
        &__entries,
        &__fortune {
            display: flex;
            flex-direction: column;
        }
    
        &__value {
            font-size: 1.25rem;
            line-height: 2rem;
        }
    
        &__area {
            font-size: 0.8rem;
            line-height: 1rem;
            color: rgba(#83c5be, 0.8);
        }
    }
}
</style>