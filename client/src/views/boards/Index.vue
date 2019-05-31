<template>
  <div class="boards-index layout-row flex layout-wrap">
    <div class="board bg-accent-blue text-light-base02 h-32 w-3/12 rounded-lg m-3 shadow-lg" v-for="board in allBoards" :key="board.board_id">
      <router-link :to="`/boards/show/${board.board_id}`">
        <div class="flex bg-accent-blue p-4 content-center h-full rounded-lg hover:bg-hover-dark hover:text-light-base01 app-trans">
          <h4 class="text-1-6 font-bold tracking-body leading-body2">
            {{ board.board_name }}
          </h4>
        </div>
      </router-link>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'BoardsIndex',
  computed: {
    ...mapGetters({
      allBoards: 'boards/allBoards'
    })
  }
}
</script>

<style lang="scss" scoped>
</style>
