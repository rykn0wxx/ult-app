import Vue from 'vue'

// Sync router with store
import { sync } from 'vuex-router-sync'

// Global Components
import '@/components/global'

// Application Plugins
import media from './plugins/media'

// Tailwind Styles
import '@/assets/styles.css'
// Custom Styles
import '@/sass/app.scss'

// Application imports
import App from './App'
import store from '@/store'
import router from '@/router'
import AppConstant from '@/services/util/appConstant'

Vue.use(media)
sync(store, router)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  mq: {
    ...AppConstant.MEDIA
  },
  render: h => h(App)
}).$mount('#app')
