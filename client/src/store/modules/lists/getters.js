// https://vuex.vuejs.org/en/getters.html

const { filter, toNumber } = require('lodash')

export default {
  getLists: (state) => (boardId) => {
    return filter(state.lists, ['board_id', toNumber(boardId)])
  }
}
