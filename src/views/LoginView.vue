<script setup>
import MyButton from '../components/MyButton.vue';
import MyLabel from '../components/MyLabel.vue';
import MyInput from '../components/MyInput.vue';
import NumberInput from '../components/NumberInput.vue';
import { RouterLink } from 'vue-router';
import router from "../router"
import { ref } from '@vue/reactivity';



// async function submitLogin()
// {
//     console.log(icNumber.value)
//     console.log(password.value)

//     try {
//         const response = await axios.post("http://localhost:3000/login",{
//             icNumber : icNumber.value,
//             password:password
//         })
//         sessionStorage.setItem("idAccount",JSON.stringify(response.data))

//         const responseUser = await axios.get( `http://localhost:3001/login/${response.data}`)

//         if(responseUser.data.role==="Pekerja")
//         {
//             router.push("/home")
//         }
//         else if(responseUser.data.role==="Pengurus")
//         {
//             router.push("/manager")
//         }
//     }
//     catch(error)
//     {
//         console.log(error)
//     }
// }

//     if (nric.value == "")
//     {
//         document.getElementById("nricError").innerText="Please enter your identification number"
//     }
//     else if (nric.value != "123")
//     {
//         document.getElementById("nricError").innerText="Wrong identification number"
//         document.getElementById("nric").value=""
//     }
//     else
//     {
//         document.getElementById("nricError").innerText=""
//     }
//     if (password.value == "")
//     {
//         document.getElementById("passError").innerText="Please enter your password"
//     }
//     else if (password.value != "123")
//     {
//         document.getElementById("passError").innerText="Wrong Password"
//         document.getElementById("password").value=""
//     }
//     else
//     {
//         document.getElementById("passError").innerText=""
//         redirectHome()
//     }
// }

// function redirectHome() {
//     router.push("/home");
// }

document.title="Login"
</script>
<template>
    <div class="bg-teal-500 w-screen min-h-screen  grid place-items-center">
        <form class="bg-white w-2/4 rounded-3xl shadow-login max-md:w-4/5" @submit.prevent="submitLogin">
            <img class="mx-auto px-4 py-4" src="../assets/logo.png" alt="">
            <h1 class="font-bold tracking-wider text-xl text-center pb-3">Log Masuk</h1>
            <div class="w-4/5 mx-auto">
                <MyLabel text="Nombor Kad Pengenalan" />
                <input class="mt-2 mb-4 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" placeholder="888888888888" v-model="icNumber" type="text" id="icNumber" ><br>
                <div>
                    <label for="" id="nricError" class="text-red-600 font-light text-sm"></label>
                </div>
                <MyLabel text="Kata Laluan"/>
                <input class="mt-2 mb-4 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" placeholder="Katalaluan..." v-model="password" type="password" id="password" ><br>
                <div>
                    <label for="" id="passError" class="text-red-600 font-light text-sm"></label>
                </div>
            </div>
  
            <div class="w-max mx-auto">            
                <MyButton txt="Log Masuk"/>
            </div>
            <div class="text-center py-4 underline">
                <RouterLink to="/about">Tukar Kata Laluan</RouterLink>
            </div>
        </form>
    </div>
</template>
<script>
import axios from 'axios';

export default 
{
    data()
    {
        return{
            icNumber:"",
            password:""
        }
    },
    async mounted()
    {


    },
    methods:
    {
        async submitLogin()
        {
            console.log(this.icNumber)
            console.log(this.password)
            try {
                const response = await axios.post("http://localhost:3000/login",{
                    icNumber : this.icNumber,
                    password: this.password
                })
                console.log(response.data)
                sessionStorage.setItem("idAccount",JSON.stringify(response.data))

                const responseUser = await axios.get( `http://localhost:3000/${response.data}`)
                console.log(responseUser)

                if(responseUser.data.role ==="Pekerja")
                {                
                        router.push("/home")
                }
                else if(responseUser.data.role === "Pengurus")
                {
                    router.push("/manager")
                }
            }
            catch(error)
            {
                console.log(error)
            }
        }

    }
}
</script>