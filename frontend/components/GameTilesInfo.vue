<template>
    <div class="app-info">
        <div class="app-info__round">Round 322</div>
        <div class="app-info__timer">useless loader</div>
        <div class="app-info__pool">
            <div>10 sol</div>
            <div>Prize pool</div>
        </div>
        <div class="app-info__players">players 14/18</div>
        <div class="app-info__entries">2 stavki</div>
        <div class="app-info__chanse">-10</div>
    </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>
.app {
    &-info {
        padding: 16px 12px;
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-template-areas: 
        "round timer"
        "pool players"
        "entries chanse";
        row-gap: 12px;
    }
    
    &__round {  grid-area: round;   }
    &__timer {  grid-area: timer;   }
    &__pool {  grid-area: pool;   }
    &__players {  grid-area: players;   }
    &__entries {  grid-area: entries;   }
    &__chanse {  grid-area: chanse;   }

    &__pool, 
    &__players,
    &__entries,
    &__chanse {
        display: flex;
        flex-direction: column;
    }
}
</style>