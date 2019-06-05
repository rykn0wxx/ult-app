/**
 * Define all of your application routes here
 */

export default [
  {
    path: '/authentication',
    name: 'LayoutsAuthentication',
    view: 'layouts/Authentication',
    redirect: '/authentication/login',
    children: [
      {
        path: '/authentication/login',
        name: 'AuthsLogin',
        view: 'auths/Login',
        meta: { public: true }
      }
    ]
  }, {
    path: '/',
    name: 'LayoutsApplication',
    view: 'layouts/Application',
    redirect: '/home',
    children: [
      {
        path: '/home',
        name: 'Home',
        view: 'Home'
      }, {
        path: '/about',
        name: 'About',
        view: 'About'
      }
    ]
  }, {
    path: '/boards',
    name: 'LayoutsBoards',
    view: 'layouts/Boards',
    redirect: '/boards/index',
    children: [
      {
        path: '/boards/index',
        name: 'BoardsIndex',
        view: 'boards/Index'
      }, {
        path: '/boards/show/:boardId',
        name: 'BoardsShow',
        view: 'boards/Show'
      }
    ]
  }
]
