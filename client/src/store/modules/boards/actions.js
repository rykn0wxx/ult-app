// https://vuex.vuejs.org/en/actions.html
import BoardService from '@/services/api/BoardService'

export default {
  async setBoards({ commit }, payload) {
    try {
      const boardResponse = await BoardService.getAllBoards()
      commit('setBoards', boardResponse.data)
    } catch (error) {
      console.error(error)
    }
  },
  setActiveBoard ({ commit }, payload) {
    commit('setActiveBoard', payload)
  }
}
