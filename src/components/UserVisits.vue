<template>
    <NavBar/>
    <div>
        <div class="nice-card" v-for="item in state.visits" :key="item.visit_id">
            <h2>Godzina: {{item.termin}}</h2>
            <h3>Lekarz: {{item.doctors_firstname}} {{item.doctors_surname}}, {{item.doctors_specification}}</h3>
            <button class="nice-button" @click="cancelVisit(item.visit_id)">Odwołaj wizytę</button>
 
        </div>

    </div>
  
</template>

<script>
import NavBar from '../components/NavBar'

import {reactive} from 'vue'
import store from '../store'
import axios from 'axios' 
export default {
    name: 'UserVisits',
    components: {NavBar},
    setup() {
        const state = reactive({
            id: Number,
            visits: Array(),
            comp_key: 0
        })
        
        getVisits(store.state.UserStore.userId, state.visits)
        
        function cancelVisit(id) {
            axios.post('http://localhost/fake-response/cancelVisit.php', {
                id: id
            })
            .then(function (response) {
                state.visits = []
                getVisits(store.state.UserStore.userId, state.visits)
            }) 
        }
        return {
            state, cancelVisit
        }


    },
}

function getVisits(id, visits) {
    

    axios.post('http://localhost/fake-response/getVisits.php',{
        'id':id
        })
    .then(function (response) {
        
        response.data.forEach(element => {
            visits.push({
                'visit_id' : element.id,
                'termin' : element.termin,
                'doctors_firstname' : element.firstname,
                'doctors_surname' : element.surname,
                'doctors_specification' : element.specification,
            })
        });
    })
}
</script>

<style lang="scss" scoped>

</style>