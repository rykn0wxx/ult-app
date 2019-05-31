<template>
  <div class="boards-show h-full overflow-auto">
    <div class="flex h-full">
      <Container
        class="flex layout-row layout-align-start-start h-full"
        orientation="horizontal"
        @drop="onColumnDrop($event)"
        drag-handle-selector=".column-drag-handle"
        @drag-start="dragStart"
        drag-class="card-ghost"
        drop-class="card-ghost-drop"
        :drop-placeholder="upperDropPlaceholderOptions">
        <Draggable
          v-for="(col, indx) in scene.children"
          :key="indx">
          <div class="card-container">
            <div class="card-column-header">
              <span class="column-drag-handle">&#x2630;</span>
              {{ col.name }}
            </div>
            <Container
              class="aaaa"
              group-name="col"
              @drop="(e) => onCardDrop(col.id, e)"
              @drag-start="(e) => log('drag start', e)"
              @drag-end="(e) => log('drag end', e)"
              :get-child-payload="getCardPayload(col.id)"
              drag-class="card-ghost"
              drop-class="card-ghost-drop"
              :drop-placeholder="dropPlaceholderOptions"
            >
              <Draggable v-for="card in col.children" :key="card.id">
                <div class="card">
                  <p>{{ card.name }}</p>
                </div>
              </Draggable>
            </Container>
          </div>
        </Draggable>
      </Container>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import _ from 'lodash'

import { Container, Draggable } from 'vue-smooth-dnd'

function uuid () {
  return Math.random().toString(16).slice(2)
}

function applyDrag (arr, dragResult) {
  const { removedIndex, addedIndex, payload } = dragResult
  if (removedIndex === null && addedIndex === null) return arr

  const result = [...arr]
  let itemToAdd = payload
  if (removedIndex !== null) {
    itemToAdd = result.splice(removedIndex, 1)[0]
  }
  if (addedIndex !== null) {
    result.splice(addedIndex, 0, itemToAdd)
  }
  return result
}

export default {
  name: 'BoardsShow',
  data () {
    return {
      newColumnName: '',
      upperDropPlaceholderOptions: {
        className: 'cards-drop-preview',
        animationDuration: '150',
        showOnTop: true
      },
      dropPlaceholderOptions: {
        className: 'drop-preview',
        animationDuration: '150',
        showOnTop: true
      },
      scene: {
        name: 'workshop',
        children: [
          {
            id: 'column1',
            name: 'todo',
            children: [
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
            id: 'column2',
            name: 'in-progress',
            children: [
              {
                description: '',
                name: 'first task',
                id: uuid(),
                userAssigned: null
              }
            ]
          },
          {
            id: 'column3',
            name: 'done',
            children: [
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
    Container,
    Draggable
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
    },
    onColumnDrop (e) {
      const scene = Object.assign({}, this.scene)
      const meme = applyDrag(scene.children, e)
      console.log(meme)
      scene.children = applyDrag(scene.children, e)
      this.scene = scene
    },
    dragStart () {
      console.log('dragStart')
    },
    getCardPayload (columnId) {
      return index => {
        return this.scene.children.filter(p => p.id === columnId)[0].children[index]
      }
    },
    onCardDrop (columnId, dropResult) {
      if (dropResult.removedIndex !== null || dropResult.addedIndex !== null) {
        const scene = Object.assign({}, this.scene)
        const column = scene.children.filter(p => p.id === columnId)[0]
        const columnIndex = scene.children.indexOf(column)

        const newColumn = Object.assign({}, column)
        newColumn.children = applyDrag(newColumn.children, dropResult)
        scene.children.splice(columnIndex, 1, newColumn)

        this.scene = scene
      }
    },
    log (...params) {
      console.log(...params)
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
.draggable-item {
  height: 50px;
  line-height: 50px;
  text-align: center;
  display: block;
  background-color: #fff;
  outline: 0;
  border: 1px solid rgba(0, 0, 0, .125);
  margin-bottom: 2px;
  margin-top: 2px;
  cursor: default;
  user-select: none;
}
.draggable-item-horizontal {
  height: 300px;
  padding: 10px;
  line-height: 100px;
  text-align: center;
  /* width : 200px; */
  display: block;
  background-color: #fff;
  outline: 0;
  border: 1px solid rgba(0, 0, 0, .125);
  margin-right: 4px;
  cursor: default;
}
.dragging {
  background-color: yellow;
}
.card-container {
  width: 320px;
  padding: 10px;
  margin: 5px;
  margin-right: 45px;
  background-color: #f3f3f3;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.12), 0 1px 1px rgba(0, 0, 0, 0.24);
}
.card {
  margin: 5px;
  /* border: 1px solid #ccc; */
  background-color: white;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.12), 0 1px 1px rgba(0, 0, 0, 0.24);
  padding: 10px;
  &-container {
    width: 320px;
    padding: 10px;
    margin: 5px;
    margin-right: 45px;
    background-color: #f3f3f3;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.12), 0 1px 1px rgba(0, 0, 0, 0.24);
  }
  &-column-header {
    font-size: 18px;
  }
  &-drag-handle {
    cursor: move;
    padding: 5px;
  }
  &-ghost {
    transition: transform 0.18s ease;
    transform: rotateZ(5deg)
  }
  &-ghost-drop {
    transition: transform 0.18s ease-in-out;
    transform: rotateZ(0deg)
  }
}
</style>
