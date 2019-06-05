import api from '@/services/api'

export default {
  login (cred) {
    return api.base().post('user_token', cred)
  },
  register (cred) {
    return api.base().post('users', cred)
  },
  getOne (userId) {
    return api.secured().get(`users/${userId}`)
  }
}
