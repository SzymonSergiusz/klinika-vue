<template>
    <div class="login__div">
            <form class="login-form" id="loginForm" @submit.prevent="login()">
            
            <label for="loginInput">Login</label>
            <input class="nice-input" v-model="state.loginInput" name="loginInput" type="text">
            <br>
            <label for="passwordInput">Hasło</label>
            <input class="nice-input" v-model="state.passwordInput" name="passwordInput" type="password">
            <br>
            <!-- <router-link to="/user"> -->
            <button class="nice-button">Zaloguj</button>
            <!-- </router-link> -->

            <div class="login__error" v-if="state.falseData">Błędne dane logowania</div>

            <router-link to="/signup">
            <div class="signInLink">Nie posiadasz jeszcze konta? <strong>Zarejestruj się!</strong></div>
            </router-link>
        </form>

    </div>
</template>

<script>
import { reactive } from 'vue';
import { useRouter } from 'vue-router'
export default {
    name: "Login",
    components: {  },

    setup() {
        const route = useRouter()
        const state = reactive({
            loginInput:'',
            passwordInput: '',
            falseData: false
        })

        function login() {
            if (state.loginInput == 'admin' && state.passwordInput == '123') {
                route.push('user')
            } else state.falseData = true
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
            font-size: 20px;
            margin: 5px;
        }


    .login__error {
        font-size: 20px;
        color: red;

    }

}


}

</style>