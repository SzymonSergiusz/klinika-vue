<template>
    <NavBar/>
    <div>
        
            <VisitCard
            v-for="(item, index) in state.visits"
            :key="index"
            :visit_id = "item.visit_id"
            :visit_time = "item.termin"
            :doctors_firstname = "item.doctors_firstname"
            :doctors_surname = "item.doctors_surname"
            :doctors_specification="item.doctors_specification">
            </VisitCard>
            
    </div>
  
</template>

<script>
import NavBar from '../components/NavBar'
import VisitCard from '../components/VisitCard'
import {reactive} from 'vue'
import store from '../store'
import axios from 'axios' 
export default {
    name: 'UserVisits',
    components: {NavBar, VisitCard},
    setup() {
        const state = reactive({
            id: Number,
            visits: Array(),
            comp_key: 0
        })
        
        getVisits(store.state.UserStore.userId, state.visits)
        
        return {
            state,
        }


    },
}

function getVisits(id, visits) {

    // console.log(`id to ${id}`)
    axios.post('http://localhost/fake-response/getVisits.php',{
        'id':id
        })
    .then(function (response) {

        console.log(response.data)
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