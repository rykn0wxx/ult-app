<template>
  <app-drop @drop="moveTaskOrColumn" class="board-column"
    :column="column"
    :columnIndex="columnIndex"
    :board="board">
    <app-drag class="column p-3 mr-4 text-left shadow rounded"
      :column="column"
      :columnIndex="columnIndex"
      :board="board">
      <div class="flex layout-align-start-center mb-2 font-bold">
        {{ column.name }}
      </div>
      <div class="list-reset">
        <column-task
          v-for="(task, $taskIndex) of column.tasks"
          :key="$taskIndex"
          :task="task"
          :taskIndex="$taskIndex"
          :column="column"
          :columnIndex="columnIndex"
          :board="board"></column-task>
        <input type="text" class="block p-2 w-full bg-transparent" placeholder="+ Enter new task" @keyup.enter="createTask($event, column.tasks)" />
      </div>
    </app-drag>
  </app-drop>
</template>

<script>
import AppDrop from '@/components/boards/AppDrop'
import AppDrag from '@/components/boards/AppDrag'
import ColumnTask from '@/components/boards/ColumnTask'

export default {
  name: 'BoardColumn',
  components: {
    AppDrop,
    AppDrag,
    ColumnTask
  },
  props: [
    'column',
    'columnIndex',
    'board'
  ],
  methods: {
    moveTaskOrColumn () {
      console.log('moveTaskOrColumn')
    },
    createTask (e, task) {
      console.log('createTask')
    }
  }
}
</script>

<style lang="scss" scoped>
.column {
  background-color: #dae1e7;
  min-width: 272px;
  max-width: 272px;
  width: 272px;
}
</style>
