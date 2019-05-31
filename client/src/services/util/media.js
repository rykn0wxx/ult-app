import _ from 'lodash'
import appConstant from '@/services/util/appConstant'

const queries = {}
const mqls = {}
const results = {}

function validate (query) {
  return appConstant.MEDIA[query] || ((query.charAt(0) !== '(') ? ('(' + query + ')') : query)
}

function add(query) {
  let result = mqls[query]
  if (!result) {
    result = mqls[query] = window.matchMedia(query)
  }
  result.addListener(onQueryChange)
  return (results[result.media] = !!result.matches)
}

function onQueryChange(query) {
  console.log('results', results[query.media])
  console.log('query', query.matches)
}

export default (query) => {
  let validated = queries[query]
  if (_.isUndefined(validated)) {
    validated = queries[query] = validate(query)
  }

  let result = results[validated]
  if (_.isUndefined(result)) {
    result = add(validated)
  }
  console.log(result)
  return result
}
