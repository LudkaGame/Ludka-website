<template>
    <header class="app-header">
        <div class="logo-container">
            <img 
            src="@/assets/logo.webp" 
            alt="ludka logo" 
            class="logo-container__image">
            <h1 class="title">
                Ludka
            </h1>
        </div>
        <w3m-button />
    </header>
</template>

<script setup>
</script>

<style lang="scss" scoped>
.app {
    &-tabs {
        display: flex;
        gap: 20px;
        flex-direction: row-reverse;
    }
    &-header {
        position: sticky;
        z-index: 5;
        padding: 0 10%;
        top: -100px;
        width: 100%;
        height: 80px;
        display: flex;
        justify-content: space-between;
        align-items: center;


        .container {
            height: 100%;
            width: 100%;
            margin: 0;            
        }

    }
}

.logo {
    &-container {
        display: flex;
        flex-direction: row;
        justify-content: center;
        gap: 10px;

        &__image {
            width: 40px;
            height: 40px;
            border-radius: 20px;
        }

        .title {
            color: white;
            font-family: 'Recoleta';
            line-height: inherit;
        }
    }
}
</style>