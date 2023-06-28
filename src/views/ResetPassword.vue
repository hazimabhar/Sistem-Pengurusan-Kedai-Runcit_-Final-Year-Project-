<script setup>
import MyButton from '../components/MyButton.vue';
import MyLabel from '../components/MyLabel.vue';
import MyInput from '../components/MyInput.vue';
import NumberInput from '../components/NumberInput.vue';
import { RouterLink } from 'vue-router';
import router from "../router"
import { ref } from '@vue/reactivity';


document.title="Reset Password"
</script>
<template>
    <div class="bg-teal-500 w-screen min-h-screen  grid place-items-center">
        <form class="bg-white w-2/4 rounded-3xl shadow-login max-lg:w-4/5 max-sm:w-11/12 " @submit.prevent="submitLogin">
            <h1 class="font-bold text-xl text-center py-10 max-sm:text-lg">Sila Masukkan Maklumat Anda</h1>
            <div class="w-4/5 mx-auto">
                <MyLabel text="Kata Laluan Baru" />
                <input class="mt-2 mb-2 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" placeholder="888888888888" v-model="password" type="password" id="icNumber" ><br>
                <label class="text-red-600 font-medium text-xs" for="errorNric" id="errorNric">{{ errorPassword }}</label><br>
                <MyLabel text="Pengesahan Kata Laluan"/>
                <input class="mt-2 mb-2 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" placeholder="Nombor Telefon" v-model="confirmPassword" type="password" id="phoneNumber" ><br>
                <label class="text-red-600 font-medium text-xs" for="errorPassword" id="errorPassword">{{ errorConfirmPassword }}</label><br>

            </div>
  
            <div class="w-max mx-auto py-4">            
                <MyButton txt="Tukar Kata Laluan"/>
            </div>
        </form>
    </div>
    <ToastMessageVue ref="toast"/>
</template>
<script>
import axios from 'axios';
import ToastMessageVue from "../components/ToastMessage.vue";


export default {

components: {
  ToastMessageVue,
},
    data()
    {
        return{
            password:"",
            confirmPassword:"",
            user:'',
            errorPassword:'',
            errorConfirmPassword:'',
        }
    },
    async mounted()
    {


    },
    methods:
    {
        async submitLogin()
        {
            this.user=JSON.parse(sessionStorage.getItem("idAccount"))
            console.log(this.user)

            if(this.password&&this.confirmPassword)
            {
                this.errorPassword=''
                this.errorConfirmPassword=''
                console.log(this.password)
                console.log(this.confirmPassword)
                if(!/(?=.*[A-Z])(?=.*[0-9]).{8,}/.test(this.password)){
                    this.errorPassword ='*Kata Laluan Tidak Sah'
                    this.confirmPassword=''
                }
                else{
                    this.errorPassword = ''   
                    if (this.password !== this.confirmPassword) {
                        this.errorConfirmPassword = '*Kata Laluan Tidak Sama'
                    } else {
                        this.errorConfirmPassword = ''
                    }
                }
               
                if(!this.errorPassword && !this.errorConfirmPassword)
                {

                    const idAccount = this.user
                    const password = this.confirmPassword

                    const data={
                        idAccount,
                        password
                    }
     
                    console.log(data)
                    axios.put("https://sistemkedairuncit.onrender.com/resetpassword/user",data)
                    .then(response=>console.log(response))
                    .catch(error=>console.log(error))
                    sessionStorage.clear();

                    const message ='Kata Laluan Telah Ditukar'
                    const status = 'Berjaya'
                    
                    this.$refs.toast.toast(message,status,'success')

                    setTimeout(() => {
                        router.push("/login");
                    }, 800); // Delay of 0.5 seconds (500 milliseconds)
                }
            }
            else{
                if(this.password==='')
                {
                    this.errorPassword='*Sila Masukkan Kata Laluan'
                }
                else
                {
                    this.errorPassword=''
                }
                if(this.confirmPassword==='')
                {
                    this.errorConfirmPassword='*Sila Masukkan Pengesahan Kata Laluan'
                }
                else
                {
                    this.errorConfirmPassword=''
                }
            }
        }

    }
}
</script>