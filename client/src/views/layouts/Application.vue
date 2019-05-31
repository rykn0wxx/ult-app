<template>
  <div class="layouts-application layout-row flex">
    <MdSidenav class="md-sidenav-shadow hide-print md-closed md-locked-open" tabindex="-1" v-if="toShow" />
    <div class="layout-column flex" tabindex="-1" role="main">
      <MdToolbar />
      <md-content class="layout-column flex" :md-scroll-y="true">
        <MdView />
      </md-content>
    </div>
    <PreLoader />
  </div>
</template>

<script>
import PreLoader from '@/components/PreLoader.vue'

export default {
  name: 'LayoutsApplication',
  components: {
    PreLoader
  },
  data () {
    return {
      toShow: false
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../../sass/variables';
.md-sidenav-shadow {
  box-shadow: $whiteframe-shadow-4dp;
}
</style>
