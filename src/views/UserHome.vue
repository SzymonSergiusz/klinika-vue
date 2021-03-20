<template>
    <div>
        <NavBar/>
        <router-view/>
        <div>
            <!-- lekarze -->
            <Doctor
            v-for="doctor in state.doctors"
            :key="doctor.id"
            :firstname="doctor.firstname"
            :surname="doctor.surname"
            :specification = "doctor.specification"
            :hours = "doctor.appointments">
            </Doctor>
        </div>
    </div>
</template>

// <script>
import Doctor from '../components/Doctor'
import axios from 'axios';
import NavBar from '../components/NavBar'
import {AXIOS_LINKS} from '../links/AXIOS_LINKS'
import {reactive} from 'vue'
export default {
    name: 'UserHome',
    components: {Doctor, NavBar},
    setup() {
        const state = reactive({
            doctors: Array(),
        
        })

        getDoctors(state.doctors)
        console.log(state.doctors)
        
        return {
            state
        }

}
}


        function getDoctors(docs) {
        axios.get(AXIOS_LINKS.GETDOCTORS)
        .then(function (response) {

            console.log(response.data)
            response.data.forEach(element => {
                // console.log(element)
                docs.push({
                    'id': element.id,
                    'firstname': element.firstname,
                    'surname': element.surname,
                    'specification': element.specification,
                    'appointments': element.terminy
                })
            });
                })
        .catch(function (error) {
            console.log(error)
        })
        }
</script>

<style lang='scss' scoped>


</style>