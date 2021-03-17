<template>
    <div class="login__div">
            <form class="login-form" name="loginForm" @submit.prevent="login(state.loginInput, state.passwordInput)">
            
            <label for="loginInput">Login</label>
            <input class="nice-input" v-model="state.loginInput" name="loginInput" type="text">
            <br>
            <label for="passwordInput">Hasło</label>
            <input class="nice-input" v-model="state.passwordInput" name="passwordInput" type="password">
            <br>
            <!-- <router-link to="/user"> -->
            <button class="nice-button">Zaloguj</button>
            <!-- </router-link> -->

            <div class="login__error" v-if="state.falseData">{{state.falseDataMessage}}</div>

            <router-link to="/signup">
            <div class="signInLink">Nie posiadasz jeszcze konta? <strong>Zarejestruj się!</strong></div>
            </router-link>
        </form>

    </div>
</template>

<script>
import { reactive } from 'vue';
import { useRouter } from 'vue-router'
import axios from 'axios';
import store from '../store';

export default {
    name: "Login",
    components: {  },

    setup() {
        const route = useRouter()
        const state = reactive({
            loginInput:'',
            passwordInput: '',
            falseData: false,
            falseDataMessage: ''
        })

        function login(login, password) {
            
            axios.post('http://localhost/fake-response/login.php',{
                'login': login,
                'password': password
                })
            .then(function (response) {
                console.log(response.data)
                if (response.data.succesfulLog) {
                    //tu dodać vuex z userem
                    store.state.UserStore.userId = response.data.id
                    store.state.UserStore.isLogged = true
                    store.state.UserStore.firstname = response.data.firstname
                    const userId = store.state.UserStore.userId
                    route.push(`user${userId}`)
                    // route.push(`user`)
                } else {
                    state.falseData = true
                    state.falseDataMessage = response.data.message
                }
                
            }).catch(function (error) {
                console.log(error)
            });
            
        }


        return {
            state, login
        }
            
    }
}
</script>


<style lang="scss" scoped>

.login__div {
    display: block;
    // display: grid;
    grid-template-columns: 1fr 3fr;
    text-align: center;
    justify-content: center;
    margin: auto;
    margin-top: 20px;
    width: 30%;
    border: 3px solid crimson;
    padding: 20px;

    .login-form {
        
        font-size: 25px;
        text-align: center;
        padding: 20px;

        display: inline-block;
        text-align: center;

        .nice-input {
            margin-left: 10px;
        }

        .nice-button {
            border-width: 2px;
            border-style: solid;
            padding-bottom: 5px;
            padding-top: 5px;
            font-size: 25px;
            margin-top: 20px;
            // margin: 5px;
        }


    .login__error {
        font-size: 20px;
        color: red;

    }

}


}

</style>