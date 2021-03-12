<template>
    <div>
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
// import store from '../store'
import {reactive} from 'vue'
export default {
    name: 'UserHome',
    components: {Doctor},
    setup() {
        const state = reactive({
            // userId: store.state.UserStore.userId
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
        axios.get('http://localhost/fake-response/getDoctors.php')
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