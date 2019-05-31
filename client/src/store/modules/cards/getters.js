// https://vuex.vuejs.org/en/getters.html
const _ = require('lodash')

export default {
  getCards: (state) => (listId) => {
    const tmpIds = _.stubArray()
    _.forEach(listId, (val, ind) => {
      tmpIds.push(_.toNumber(_.filter(_.keys(val), (k) => k === 'list_id')))
    })
    return _.filter(state.cards, ['list_id', _.toNumber(listId)])
  }
}
