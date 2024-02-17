<template>
    <div class="app-welcome">
        <div class="app-welcome__container">
            <h1 class="app-welcome__title">
                Test your luck and try to grab some loot with <span class="app-welcome__title-green">Ludka</span>!
            </h1>
            <h2 class="app-welcome__subtitle">
                Cast yer loot into the bountiful communal chest and test yer luck on the high seas of fortune.
            </h2>
        </div>
    </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>
.app {
    &-welcome {
        margin-top: 100px;
        width: 100%;
        position: relative;
        
        &__container {
            padding: 20px;
            display: flex;
            flex-direction: column;
            border-radius: 16px;
            background-color: rgba(#121212, 0.6);
            gap: 2rem;
            width: 50%;
        }

        &__title {
            font-size: 4rem;
            line-height: 4rem;
            max-width: 40rem;
            width: 100%;

            &-green {
                color: rgba(#45FCBA, 1);
            }
        }

        &__subtitle {
            font-size: 1.25rem;
            color: rgba(#83c5be, 1);
            max-width: 28rem;
        }

        &__image {
            position: absolute;
            height: auto;
            width: 500px;
            right: 0;
            top: 0;
            box-shadow: inset ;
        }
    }
}

@media screen and (max-width: 950px) {
    .app-welcome {
        &__container {
            width: 100%;
            text-align: center;
        }

        &__title,
        &__subtitle {
            max-width: none;
        }
    }
}

@media screen and (max-width: 600px) {
    .app-welcome {
        &__title {
            font-size: 30px;
            line-height: 34px;
        }
        &__subtitle {
            font-size: 1.2rem;
        }
    }
}
</style>