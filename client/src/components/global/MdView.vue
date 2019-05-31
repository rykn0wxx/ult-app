<template>
  <div class="md-view layout-padding flex-noshrink">
    <transition name="fade-right">
      <RouterView />
    </transition>
  </div>
</template>

<script>
export default {
  name: 'MdView'
}
</script>

<style lang="scss" scoped>
.fade-right {
  &-enter-active {
    animation-duration: 1s;
    animation-fill-mode: both;
    animation-name: fadeInRight;
    animation-delay: 0.5s;
  }
  &-leave-active {
    animation-duration: 0.5s;
    animation-fill-mode: both;
    animation-name: fadeOutLeft;
  }
}
@keyframes fadeOutLeft {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
    transform: translate3d(-100%, 0, 0);
  }
}
@keyframes fadeInRight {
  from {
    opacity: 0;
    transform: translate3d(100%, 0, 0);
  }
  to {
    opacity: 1;
    transform: translate3d(0, 0, 0);
  }
}
</style>
