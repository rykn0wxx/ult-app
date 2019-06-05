<template>
  <div class="boards-index layout-row flex layout-wrap">
    <div v-for="(board, id) in boards" :key="id" class="board bg-blue-700 text-light-base02 h-32 w-3/12 rounded-lg m-3 shadow-lg">
      <button class="md-button router-button" @click="showBoard(board)">
        <div class="flex bg-blue-700 p-4 content-center h-full rounded-lg hover:bg-blue-600 hover:text-light-base01 app-trans">
          <h4 class="text-1-6 font-bold tracking-body leading-body2">
            {{ board.board_name }}
          </h4>
        </div>
      </button>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  name: 'BoardsIndex',
  computed: {
    ...mapGetters('boards', {
      boards: 'allBoards'
    })
  },
  methods: {
    ...mapActions('boards', {
      setBoards: 'setBoards'
    }),
    ...mapActions('lists', {
      setLists: 'setLists'
    }),
    async showBoard (board) {
      await this.setLists(board)
      this.$router.push(`/boards/show/${board.id}`)
    }
  },
  created () {
    this.setBoards()
  }
}
</script>

<style lang="scss" scoped>
.router-button {
  height: 100%;
  width: 100%;
  padding: 0;
  margin: 0;
  border-radius: 0.5rem;
}
</style>
