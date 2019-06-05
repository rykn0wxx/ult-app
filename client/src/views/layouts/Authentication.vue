<template>
  <div class="layouts-authentication flex">
    <md-content class="auth-wrapper flex layout-row layout-align-gt-sm-end-stretch layout-align-center-start" :md-scroll-y="true">
      <RouterView class="auth-card" :class="{'auth-card__sm': !isMediaSm}" />
    </md-content>
  </div>
</template>

<script>
export default {
  name: 'LayoutsAuthentication',
  computed: {
    isMediaSm: function () {
      return this.$mq['gt-sm']
    }
  }
}
</script>

<style lang="scss" scoped>
.layouts-authentication {
  position: relative;
  height: 100%;
  .auth-wrapper {
    display: flex;
  }
  .auth-card {
    overflow: auto;
    min-width: 400px;
    width: 400px;
    min-height: 100%;
    box-shadow: 0 2px 4px -1px rgba(0,0,0,.2), 0 4px 5px 0 rgba(0,0,0,.14), 0 1px 10px 0 rgba(0,0,0,.12);
    &__sm {
      min-width: 400px;
      width: 90% !important;
      margin-bottom: 20px;
      margin-top: 20px;
      max-height: 500px;
      box-sizing: border-box;
    }
  }
  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    height: 100vh;
    width: 100%;
    background: url('../../assets/splash2.jpg'), #373740;
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    background-blend-mode: lighten;
    filter: contrast(0.7) brightness(0.9) blur(1px);
  }
}
</style>
