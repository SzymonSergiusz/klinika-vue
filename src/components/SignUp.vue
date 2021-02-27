<template>
    <div class="sign-up__div">
            <form class="login-form" id="loginForm" @submit.prevent="signUp()">
            

            <label for="firstnameInput">Imię</label>
            <input class="nice-input" v-model="state.firstnameInput" name="firstnameInput" type="text">
            
            <br>

            
            <label for="surnameInput">Nazwisko</label>
            <input class="nice-input" v-model="state.surnameInput" name="surnameInput" type="text">
            
            <br>

            <label for="loginInput">Login</label>
            <input class="login-input" v-model="state.loginInput" name="loginInput" type="text">
            
            <br>
            
            <label for="passwordInput">Hasło</label>
            <input class="pass-input" v-model="state.passwordInput" name="passwordInput" type="password">
            
            <br>

            <label for="passwordValidInput">Powtórz hasło</label>
            <input class="pass-input" v-model="state.passwordValidInput" name="passwordValidInput" type="password">
            <label v-if="state.passwordInput !== state.passwordValidInput">❌</label>
            
            <br>
            <!-- <router-link to="/user"> -->
            <button class="nice-button">Zarejestruj się</button>
            <!-- </router-link> -->

            <router-link to="/">
            <div class="failureMessage" v-if="state.failureSigning">{{state.failureMessage}}</div>
            <div class="signInLink">Posiadasz już konto? <strong>Zaloguj się!</strong></div>
            </router-link>
        </form>

    </div>
</template>

<script>
import { reactive } from "vue"
import axios from "axios"
export default {
    name: 'SignUp',
    setup() {
        // const route = useRouter()
        const state = reactive({
            firstnameInput: '',
            surnameInput: '',
            loginInput:'',
            passwordInput: '',
            passwordValidInput: '',
            failureSigning: false,
            failureMessage: ''
    })

    function signUp() {
        axios.post("http://localhost/fake-response/signup.php", {
            firstname: state.firstnameInput,
            surname: state.surnameInput,
            login: state.loginInput,
            password: state.passwordInput,
            passwordValid: state.passwordValidInput,
        })
        .then(function (response) {
            
            if (response.data.succesfulSign) {
                console.log(response.data)    
            } else {
                state.failureSigning = true
                state.failureMessage = response.data.message
            }
        })
        .catch(function (error) {
            console.log(error)
        })


    }
    
    
    return {
        state,
        signUp
        }
    
    }
}
</script>

<style lang="scss" scoped>

.sign-up__div {
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
            text-transform: capitalize;
        }

        .nice-button {
            font-size: 20px;
            margin: 5px;
        }


    .failureMessage {
        font-size: 20px;
        color: red;

    }

}


}

</style>