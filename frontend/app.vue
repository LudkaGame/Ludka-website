<template>
  <NuxtLayout>
    <!-- <NuxtWelcome /> -->
    <RouterView/>
  </NuxtLayout>
</template>

<script setup>

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