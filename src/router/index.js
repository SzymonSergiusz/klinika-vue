import { createRouter, createWebHistory } from 'vue-router'
// import Home from '../views/Home.vue'
import UserHome from '../views/UserHome.vue'
import SignUp from '../components/SignUp'
import Login from '../components/Login'
import store from '../store'
import UserVisits from '../components/UserVisits'
const routes = [
  {
    path: '/',
    name: 'Login',
    component: Login
  },

  {
    path: '/user:userId',
    name: 'UserHome',
    component: UserHome,
    meta: {
      requiresLogged: true
    }
  },
  {
    path: '/signup',
    name: 'SignUp',
    component: SignUp
  },
  {
    path: '/user:userId/visits',
    name: 'UserVisits',
    component: UserVisits
  }

  
]

const router = createRouter({
  history: createWebHistory(),
  routes
})


router.beforeEach(async (to, from, next) => {
  const isLogged = store.state.UserStore.isLogged
  const userId = store.state.UserStore.userId

  const requiresLogged = to.matched.some(record => record.meta.requiresLogged)

  if (requiresLogged && !isLogged && userId!=null) next({name: 'Login'})
  else next()

})

export default router
