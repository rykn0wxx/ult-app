<template>
  <RouterView class="app relative min-h-full h-full w-full overflow-hidden bg-theme-dark04 text-primary-base1 antialiased" v-cloak />
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
</style>
