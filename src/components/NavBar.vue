<template>
          <nav>
            <div class="navigation__bar">
                
                <div class="zakladka">
                    <router-link :to="{name: 'UserHome'}">
                    Strona użytkownika
                    </router-link>
                </div>

                <div class="zakladka">
                    <router-link :to="{name: 'UserVisits'}">
                        Zaplanowane wizyty
                    </router-link>
                </div>
            </div>
        </nav>
</template>

<script>
export default {
    name: 'NavBar'

}
</script>

<style lang="scss" scoped>
    .navigation__bar {

        float: flex;
        width: 100%;
        font-size: 30px;
        padding: 20px;
        color: white;
        background-color: rgb(201, 0, 0);


        .zakladka {
            display: inline;
            margin: 20px;
        }
    }

</style>