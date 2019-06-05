import axios from 'axios'
import store from '@/store'
import AppConstant from '@/services/util/appConstant'

export default {
  base () {
    return axios.create({ baseURL: AppConstant.API.BASE_URL })
  },
  secured () {
    return axios.create({
      baseURL: AppConstant.API.BASE_URL,
      headers: {
        ...AppConstant.API.BASE_HEADERS,
        Authorization: `JWT ${store.state.users.token}`
      }
    })
  },
  api () {
    return axios.create({
      baseURL: AppConstant.API.BASE_URL,
      headers: {
        ...AppConstant.API.JSON_HEADERS
      }
    })
  }
}
