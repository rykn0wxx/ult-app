import api from '@/services/api'

export default {
  getAllBoards () {
    return api.secured().get(`api/v1/boards`)
  }
}
