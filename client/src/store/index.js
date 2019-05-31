/**
 * Vuex
 * @library
 */

// Lib imports
import Vue from 'vue'
import Vuex from 'vuex'
// import createPersistedState from 'vuex-persistedstate'

// Store functionality
import actions from './actions'
import getters from './getters'
import modules from './modules'
import mutations from './mutations'
import state from './state'

Vue.use(Vuex)

// Create a new store
const store = new Vuex.Store({
  // plugins: [
  //   createPersistedState()
  // ],
  strict: true,
  actions,
  getters,
  mutations,
  state,
  modules
})

export default store
