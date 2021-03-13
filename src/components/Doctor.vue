<template>
  <div class="doctor__card">
  <h2>{{firstname}} {{surname}}</h2>
  <h4>{{specification}}</h4>

    <select v-model="state.reg_time">

     <option disabled value="">Wybierz godzinę</option>   
    <option v-for="item in state.hours" :key="item.id" :value="item">
      {{ item.registration_time }}
      
    </option>
  </select>

  <button :disabled = "state.reg_time == ''" @click="zarezerwuj()">
      Zarezerwuj wizytę
  </button>

  </div>


</template>

<script>
import {reactive} from 'vue'
import store from '../store'
import { useRouter } from "vue-router"
import axios from 'axios'
export default {
    name: 'Doctor',
    props: {
        firstname: {
            type: String,
            required: true
        },
        surname: {
            type: String,
            required: true
        },
        specification: {
            type: String,
            required: true
        },
        hours: {
            type: Array,
            required: false
        }
    },
    setup(props) {
        const router = useRouter()
        const state = reactive({
            hours: props.hours,
            reg_time: "",
        })
        
        
    function zarezerwuj() {
        console.log(state.reg_time.registration_time)
        axios.post('http://localhost/fake-response/booking.php', {
            'id_uzytkownika': store.state.UserStore.userId,
            'id_lekarza': state.reg_time.id_lekarza,
            'registration_time': state.reg_time.registration_time
        })
        .then(function (response) {
            console.log(response.data)
            router.push({name: 'UserVisits'})
        })
    }

    return {
        state, zarezerwuj
    }
}



}
</script>

<style lang="scss" scoped>

.doctor__card {
    background: #da00008f;
    color: whitesmoke;
    font-size: 20px;
    border-color: #ff00005e;
    width: 40%;
    border-width: 10px;
    border-style: solid;
    padding: 10px;
    margin: 15px;


}

</style>