<template>
    <footer class="app-footer">
        <div class="container is-flex is-align-items-center is-justify-content-space-between">
            <div>some label</div>
            <div>links</div>
        </div>
    </footer>
</template>

<script setup>

</script>

<style scoped lang="scss">
.app {
    &-footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        z-index: 1;
        display: flex;
        align-items: center;
        padding: 80px 10% 100px;

        .container {
            height: 100%;
            margin: 0;
        }
    }
}
</style>