// https://vuex.vuejs.org/en/actions.html
import UserService from '@/services/api/UserService'

export default {
  async setToken ({ dispatch, commit }, payload) {
    try {
      const token = await UserService.login(payload)
      commit('setToken', token.data.jwt)
      dispatch('setUser', payload.auth.login)
    } catch (error) {
      console.error(error)
    }
  },
  async setUser ({ commit }, payload) {
    try {
      const userResponse = await UserService.getOne(payload)
      commit('setUser', userResponse.data)
    } catch (error) {
      console.error(error)
    }
  }
}
