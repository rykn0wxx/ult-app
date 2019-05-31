<template>
  <div class="boards-show h-full overflow-auto">
    <div class="flex layout-row layout-align-start-start h-full">
      <board-column
        v-for="(col, indx) in tmpBoard.columns"
        :key="indx"
        :column="col"
        :columnIndex="indx"
        :board="tmpBoard"></board-column>
      <div class="column flex p-2 mr-4 text-left shadow rounded">
        <input type="text" class="p-2 mr-2 flex-grow" placeholder="New Column Name" v-model="newColumnName" @keyup.enter="createColumn" />
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import _ from 'lodash'

import BoardColumn from '@/components/boards/BoardColumn'
function uuid () {
  return Math.random().toString(16).slice(2)
}

export default {
  name: 'BoardsZhow',
  data () {
    return {
      newColumnName: '',
      tmpBoard: {
        name: 'workshop',
        columns: [
          {
            name: 'todo',
            tasks: [
              {
                description: '',
                name: 'first task',
                id: uuid(),
                userAssigned: null
              },
              {
                description: '',
                name: 'second task',
                id: uuid(),
                userAssigned: null
              },
              {
                description: '',
                name: 'and thrid',
                id: uuid(),
                userAssigned: null
              }
            ]
          },
          {
            name: 'in-progress',
            tasks: [
              {
                description: '',
                name: 'first task',
                id: uuid(),
                userAssigned: null
              }
            ]
          },
          {
            name: 'done',
            tasks: [
              {
                description: '',
                name: 'first task',
                id: uuid(),
                userAssigned: null
              }
            ]
          }
        ]
      }
    }
  },
  components: {
    BoardColumn
  },
  methods: {
    ...mapGetters({
      getLists: 'lists/getLists',
      getCards: 'cards/getCards'
    }),
    getCardsFn () {
      return this.getCards()
    },
    getListsFn () {
      return this.getLists()
    },
    runMe () {
      _.forEach(this.boardLists, (v) => {
        const tmpKeys = _.keys(v)
        console.log(_.filter(tmpKeys, (vvv) => vvv === 'list_id'))
      })
    },
    createColumn () {
      console.log('createColumn')
    }
  },
  computed: {
    boardLists: function () {
      const listsFn = this.getListsFn()
      return listsFn(this.$route.params.boardId)
    },
    listCards: function () {
      const cardsFn = this.getCardsFn()
      return cardsFn(this.boardLists)
    }
  }
}
</script>

<style lang="scss" scoped>
@import "../../sass/mixins";
.boards-show {
  @include prop-to-value(padding, 0, true);
}
.column {
  background-color: #dae1e7;
  min-width: 272px;
  max-width: 272px;
  width: 272px;
}
</style>
