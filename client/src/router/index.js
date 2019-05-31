/**
 * Vue Router
 *
 * @library
 *
 */

// Lib imports
import Vue from 'vue'
import Router from 'vue-router'
import Meta from 'vue-meta'

// Routes
import paths from './paths'

function genRoutes (pathObj) {
  const tmpRoute = {
    name: pathObj.name,
    path: pathObj.path,
    component: (resolve) => import(`@/views/${pathObj.view}.vue`).then(resolve)
  }
  if (pathObj.redirect) tmpRoute.redirect = pathObj.redirect
  if (pathObj.children) tmpRoute.children = pathObj.children.map(path => genRoutes(path))
  return tmpRoute
}

Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: paths.map(path => genRoutes(path)).concat([{ path: '*', redirect: '/' }]),
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    }
    if (to.hash) {
      return { selector: to.hash }
    }
    return { x: 0, y: 0 }
  },
  linkActiveClass: 'active'
})

Vue.use(Meta)

export default router
