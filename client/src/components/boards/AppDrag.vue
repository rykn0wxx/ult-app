<script>
export default {
  name: 'AppDrag',
  props: [
    'column',
    'columnIndex',
    'board'
  ],
  methods: {
    onDrag (e) {
      // eslint-disable-next-line
      if (e.target !== e.currentTarget) return
    },
    dragPrevent (e) {
      e.preventDefault()
    }
  },
  render (createElement) {
    const elemOpts = {
      class: 'app-drag',
      attrs: {
        draggable: true
      },
      on: {
        dragstart: this.onDrag,
        dragover: this.dragPrevent,
        dragenter: this.dragPrevent
      }
    }
    return createElement('div', elemOpts, this.$slots.default)
  }
}
</script>

<style lang="scss" scoped>

</style>
