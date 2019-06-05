// https://vuex.vuejs.org/en/mutations.html

export default {
  setToken (state, payload) {
    state.token = payload
    state.userLogin = payload ? true : null
  },
  setUser (state, payload) {
    state.user = payload
  }
}
