import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import UserHome from '../views/UserHome.vue'
import SignUp from '../components/SignUp'
const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },

  {
    path: '/user',
    name: 'UserHome',
    component: UserHome
  },
  {
    path: '/signup',
    name: 'SignUp',
    component: SignUp
  },

  
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
