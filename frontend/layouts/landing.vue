<template>
    <div class="app-wrapper">
        <TheHeader/>
        <div class="app-wrapper__padding">
            <div class="app-content">
                <slot/>
            </div>
        </div>
        <div class="app-pattern" />
    </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>
.app {
    &-wrapper {
        position: relative;
        min-height: 100vh;
        
        &__padding {
            position: relative;
            z-index: 1;
            margin: 0 10%;
        }
    }

    &-pattern {
        position: absolute;
        top: 80px;
        width: 100%;
        bottom: 0;
        background: url('/images/best_pattern.webp');
        box-shadow: inset 0 0 30px 30px #121212;
        background-size: 130%;
        opacity: 0.5;
    }
}
</style>