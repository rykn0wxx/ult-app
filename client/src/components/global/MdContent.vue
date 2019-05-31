<script>
export default {
  name: 'MdContent',
  props: {
    mdScrollY: {
      type: Boolean,
      required: false
    },
    mdScrollX: {
      type: Boolean,
      required: false
    }
  },
  render (createElement) {
    const elemOpts = {
      class: 'md-content'
    }
    if (this.mdScrollY) elemOpts.class += ' md-scroll-y'
    if (this.mdScrollX) elemOpts.class += ' md-scroll-x'
    return createElement('div', elemOpts, this.$slots.default)
  }
}
</script>

<style lang="scss" scoped>
.md-content {
  display: block;
  position: relative;
  overflow: auto;
  -webkit-overflow-scrolling: touch;
  &.md-scroll-y {
    overflow-y: auto;
    overflow-x: hidden;
  }
  &.md-scroll-x {
    overflow-x: auto;
    overflow-y: hidden;
  }
  @media print {
    overflow: visible !important;
  }
}
</style>
