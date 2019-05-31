<script>
export default {
  name: 'AppDrop',
  props: [
    'column',
    'columnIndex',
    'board'
  ],
  methods: {
    dropStop (e) {
      e.stopPropagation()
      this.$emit('drop')
    },
    dragPrevent (e) {
      e.preventDefault()
    }
  },
  render (createElement) {
    const elemOpts = {
      class: 'app-drop',
      on: {
        drop: this.dropStop,
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
