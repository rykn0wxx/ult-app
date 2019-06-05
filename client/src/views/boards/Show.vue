<template>
  <div class="boards-show h-full overflow-auto">
    <div class="flex h-full">
      <container class="flex layout-row layout-align-start-start h-full"
        orientation="horizontal"
        @drop="onColumnDrop($event)"
        drag-handle-selector=".column-drag-handle"
        @drag-start="dragStart"
        drag-class="card-ghost"
        drop-class="card-ghost-drop"
        :drop-placeholder="upperDropPlaceholderOptions">
        <draggable v-for="(list, indx) in lists.lists" :key="indx">
          <div class="card-container">
            <div class="card-column-header flex">
              <span class="column-drag-handle flex-15 text-theme-primary">
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24" enable-background="new 0 0 24 24" xml:space="preserve"><g id="Header"> <g> <rect x="-618" y="-2232" fill="none" width="1400" height="3600"/> </g></g><g id="Label"></g><g id="Icon"> <g> <rect fill="none" width="24" height="24"/> <path d="M3,18h18v-2H3V18z M3,13h18v-2H3V13z M3,6v2h18V6H3z"/> </g></g><g id="Grid" display="none"> <g display="inline"> </g></g></svg>
              </span>
              <h4 class="md-subhead card-column-header-text">{{ list.list_name }}</h4>
            </div>
            <container group-name="list"
              @drop="(e) => onCardDrop(list.id, e)"
              @drag-start="(e) => log('drag start', e)"
              @drag-end="(e) => log('drag end', e)"
              :get-child-payload="getCardPayload(list.id)"
              drag-class="card-ghost"
              drop-class="card-ghost-drop"
              :drop-placeholder="dropPlaceholderOptions">
              <draggable v-for="card in list.cards" :key="card.id">
                <div class="card">
                  <p>{{ card.card_content }}</p>
                </div>
              </draggable>
            </container>
          </div>
        </draggable>
      </container>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { Container, Draggable } from 'vue-smooth-dnd'

export default {
  name: 'BoardsShow',
  components: {
    Container,
    Draggable
  },
  data () {
    return {
      upperDropPlaceholderOptions: {
        className: 'cards-drop-preview',
        animationDuration: '150',
        showOnTop: true
      },
      dropPlaceholderOptions: {
        className: 'drop-preview',
        animationDuration: '150',
        showOnTop: true
      }
    }
  },
  computed: {
    ...mapGetters('lists', {
      lists: 'allList'
    }),
    list () {
      return this.lists.lists
    }
  },
  methods: {
    getCardPayload (columnId) {
      console.log('getCardPayload')
    },
    onColumnDrop () {
      console.log('onColumnDrop')
    },
    dragStart () {
      console.log('dragStart')
    },
    onCardDrop (columnId, dropResult) {
      console.log('columnId', columnId)
      console.log('dropResult', dropResult)
    },
    log (...params) {
      console.log(...params)
    }
  }
}
</script>

<style lang="scss" scoped>
@import "../../sass/variables";
@import "../../sass/mixins";
.boards-show {
  @include prop-to-value(padding, 0, true);
}
.column {
  background-color: #dae1e7;
  min-width: 272px;
  max-width: 272px;
  width: 272px;
  &-drag-handle {
    display: flex;
    > svg {
      fill: currentColor;
    }
  }
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
.card {
  margin: 0.8rem;
  /* border: 1px solid #ccc; */
  background-color: $theme-dark02;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.12), 0 1px 1px rgba(0, 0, 0, 0.24);
  padding: 10px;
  &-container {
    width: 320px;
    padding: 10px;
    margin: 5px;
    margin-right: 45px;
    background-color: $theme-dark03;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.12), 0 1px 1px rgba(0, 0, 0, 0.24);
  }
  &-column-header {
    font-size: 18px;
    margin-bottom: 2rem;
    &-text {
      font-weight: 500;
    }
  }
  &-drag-handle {
    cursor: move;
    padding: 5px;
  }
  &-ghost {
    background-color: $theme-dark01;
    transition: transform 0.18s ease;
    transform: rotateZ(5deg)
  }
  &-ghost-drop {
    transition: transform 0.18s ease-in-out;
    transform: rotateZ(0deg)
  }
}
</style>
