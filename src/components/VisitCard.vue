<template>
  <div class="nice-card">
      <h2>Godzina: {{state.visit_time}}</h2>
      <h3>Lekarz: {{state.doctors_firstname}} {{state.doctors_surname}}, {{state.doctors_specification}}</h3>
      <button class="nice-button" @click="cancelVisit()">Odwołaj wizytę</button>
  </div>
</template>

<script>
import {reactive} from 'vue';
import axios from 'axios'
import { useRouter } from "vue-router"
export default {
    name: 'VisitCard',
    props: {
        visit_id: {
            type: String,
            required: true
        },
        visit_time: {
            type: String,
            required: true
        },
        doctors_firstname: {
            type: String,
            required: true
        },
        doctors_surname: {
            type: String,
            required: true
        },
        doctors_specification: {
            type: String,
            required: true
        }
    },
    setup(props) {
        const router = useRouter()
        const state = reactive({
            visit_id: props.visit_id,
            visit_time: props.visit_time,
            doctors_firstname: props.doctors_firstname,
            doctors_surname: props.doctors_surname,
            doctors_specification: props.doctors_specification,
            
        })
        function cancelVisit() {
            axios.post('http://klinika-paie-serwer.atwebpages.com/scripts/cancelVisit.php', {
                id: state.visit_id
            })
            .then(function (response) {
                console.log(response.data)
                router.push({name: 'UserHome'})
            }) 
        }
        return {
            state, cancelVisit
        }
    },
    
}
</script>

<style lang="scss" scoped>
    .visit_card {
        margin: 15px;
        padding: 15px;
        width: 30%;
        color: white;
        background-color: rgba(226, 43, 67, 0.616);
    }


</style>