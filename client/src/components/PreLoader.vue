<template>
  <div class="pre-loader" :class="{ done: isDone }" v-if="isLoading">
    <div></div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  name: 'PreLoader',
  data () {
    return {
      isDone: false
    }
  },
  methods: {
    ...mapActions([
      'setLoading'
    ])
  },
  mounted: function () {
    setTimeout(() => {
      this.isDone = true
    }, 2000)
  },
  watch: {
    isDone: function (val) {
      if (val) {
        setTimeout(() => {
          this.setLoading(false)
        }, 1000)
      }
    }
  },
  computed: {
    ...mapGetters([
      'isLoading'
    ])
  }
}
</script>

<style lang="scss" scoped>
@import '../sass/variables';
.pre-loader {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1000;
  background: #000000;
  backface-visibility: hidden;
  & > div {
    display: block;
    position: relative;
    left: 50%;
    top: 50%;
    width: 150px;
    height: 150px;
    margin: -75px 0 0 -75px;
    border-radius: 50%;
    border: 3px solid transparent;
    border-top-color: $accent-orange;
    backface-visibility: hidden;
    transform: translate3d(0, 0, 0);
    backface-visibility: hidden;
    animation: spin 2s linear infinite;
    &::before {
      content: '';
      position: absolute;
      top: 5px;
      left: 5px;
      right: 5px;
      bottom: 5px;
      border-radius: 50%;
      border: 3px solid transparent;
      border-top-color: $accent-blue;
      animation: spin 3s linear infinite;
    }
    &::after {
      content: '';
      position: absolute;
      top: 15px;
      left: 15px;
      right: 15px;
      bottom: 15px;
      border-radius: 50%;
      border: 3px solid transparent;
      border-top-color: $accent-yellow;
      animation: spin 1.5s linear infinite;
    }
  }
  &.done {
    animation-name: fadeOut;
    animation-duration: 1s;
    animation-fill-mode: both;
  }
}
@keyframes fadeOut {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}
@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>
