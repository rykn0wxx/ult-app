// https://vuex.vuejs.org/en/mutations.html

export default {
  setBoards (state, payload) {
    state.boards = payload
  },
  setActiveBoard (state, payload) {
    state.activeBoard = payload
  }
}
