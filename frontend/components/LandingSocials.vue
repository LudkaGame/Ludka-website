<template>
    <div class="app-socials">
        <p class="app-socials__join">
            Join our socials:
        </p>
        <div class="app-socials__links">
            <NuxtLink v-for="(social, index) in socials" 
                :key="index" 
                :to="social.href" 
                target="_blank" 
                class="app-socials__links-item"
            >
                <img :src="social.img" :alt="social.alt" />
            </NuxtLink>
        </div>
    </div>
</template>

<script setup>
const socials = ref([
  {
    label: 'Twitter',
    img: '/images/twitter.svg',
    alt: 'twitter',
    href: 'https://twitter.com/ludka_xyz'
  }
])
</script>

<style lang="scss" scoped>
.app {
    &-socials {
        margin-top: 80px;
        display: flex;
        align-items: center;
        gap: 16px;

        &__join {
            font-size: 1.5rem;
        }
        &__links {
            display: flex;
            gap: 3vw;
            justify-content: center;
    
            &-item {
                display: flex;
                align-items: center;
                gap: 7px;
                height: 24px;
    
                & img {
                height: 28px;
                fill: #83c5be;
                }
            }
        }
    }
}
</style>