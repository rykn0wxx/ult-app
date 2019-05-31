import Vue from 'vue'

// Sync router with store
import { sync } from 'vuex-router-sync'

// Global Components
import '@/components/global'

// Tailwind Styles
import '@/assets/styles.css'
// Custom Styles
import '@/sass/app.scss'

// Application imports
import App from './App'
import store from '@/store'
import router from '@/router'

sync(store, router)
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
