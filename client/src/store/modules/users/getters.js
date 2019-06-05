// https://vuex.vuejs.org/en/getters.html

export default {
  getUser: (state) => state.user,
  getToken: (state) => state.token,
  isUserLogin: (state) => state.isUserLogin !== null
}
