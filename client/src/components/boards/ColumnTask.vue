<template>
  <app-drop>
    <app-drag class="task flex items-center flex-wrap shadow mb-2 py-2 px-2 rounded bg-white text-grey-darkest no-underline" @click="goToTask(task)">
      <span class="w-full flex-no-shrink font-bold">
        {{ task.name }}
      </span>
    </app-drag>
  </app-drop>
</template>

<script>
import AppDrop from '@/components/boards/AppDrop'
import AppDrag from '@/components/boards/AppDrag'

export default {
  name: 'ColumnTask',
  components: {
    AppDrop,
    AppDrag
  },
  props: [
    'column',
    'columnIndex',
    'board',
    'task',
    'taskIndex'
  ],
  methods: {
    goToTask (task) {
      console.log('goToTask')
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
