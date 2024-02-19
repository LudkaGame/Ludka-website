<template>
    <div class="tiles-container">
        <div class="tiles-container__chain">qq</div>
        <div class="tiles-container__enter"></div>
        <div class="tiles-container__game">
            <w3m-button />
        </div>
        <div class="tiles-container__info">
            <GameTilesInfo />
        </div>
        <div class="tiles-container__players"></div>

        <svg>
            <filter id='noiseFilter'>
              <feTurbulence 
                type='fractalNoise' 
                baseFrequency='0.6'
                numOctaves="3"
                stitchTiles='stitch'/>
               <feColorMatrix in="colorNoise" type="matrix" values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0" />
                  <feComposite operator="in" in2="SourceGraphic" result="monoNoise"/>
                  <feBlend in="SourceGraphic" in2="monoNoise" mode="screen" />
            </filter>    
        </svg>

    </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>
.tiles {
    &-container {
        display: grid;
        grid-template-rows: 1fr 2fr;
        grid-template-columns: 1fr 3fr 1fr;
        gap: 10px;
        grid-template-areas: 
        "chain game info"
        "enter game players";

        & > div {
            position: relative;
            box-sizing: border-box;
            padding: 16px 12px;
            background: rgba(3, 21, 19, 0.5);
            border-radius: 18px;
            border: 1px solid rgba(#40e0d0, 0.3);
            overflow: hidden;
            height: 100%;
            width: 100%;
            backdrop-filter: blur(10px) url(#noiseFilter) contrast(150%) brightness(20%);
        }

        &__chain {  grid-area: chain;   }
        &__enter {  grid-area: enter;   }
        &__game {  grid-area: game;   }
        &__info {  grid-area: info;   }
        &__players {  grid-area: players;   }
    }
}
</style>