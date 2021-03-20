<template>
<div id="app">
  <nav style="nav">
    <div class="navigation__logo">
       <img class="obrazek" src="..\src\assets\esku.png" style="  -webkit-transform: scaleX(-1);
  transform: scaleX(-1);"> Klinika <img class="obrazek" src="..\src\assets\esku.png">
        <div class="hello-name">Witaj {{firstname}}</div>
        
    </div>


  </nav>

  <router-view/>


</div>
</template>

<script>
import { computed } from 'vue'
import store from './store'

export default {
  name: 'App',
  components: {  },
  setup() {
    const firstname = computed( () => store.state.UserStore.firstname);
    return {
      firstname
    }
  }
}
</script>

<style lang='scss'>



.navigation__logo {
  // float: left;
  width: 100%;
  background-color: crimson;
  font-size: 60px;
  padding-left: 20px;
  padding: 10px;
  color: white;
  
  .hello-name {
    padding: 20px;
    float: right;
    display: grid;
    font-size: 35px;
    color: whitesmoke;
    text-align: right;
    }
}

</style>
