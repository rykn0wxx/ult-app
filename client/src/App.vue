<template>
  <RouterView class="app" v-cloak />
</template>

<script>
export default {
  name: 'App',
  metaInfo () {
    return {
      title: 'Dashboard by mudhead'
    }
  }
}
</script>

<style lang="scss" scoped>
.app {
  @apply relative min-h-full h-full w-full overflow-hidden bg-theme-dark04 text-primary-base1 antialiased;
}
</style>
