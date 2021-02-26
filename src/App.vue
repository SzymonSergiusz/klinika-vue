<template>
<div id="app">
  <nav>
    <div class="navigation__logo">
      Klinika
    </div>
  </nav>

  <router-view/>
</div>
</template>

<script>

export default {
  name: 'App',
  components: {  }
}
</script>

<style lang='scss'>

.navigation__logo {
  background-color: crimson;
  font-size: 60px;
  padding: 10px;
  color: white;
}


.nice-div {


}
</style>
