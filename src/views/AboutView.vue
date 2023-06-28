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
        <form class="bg-white w-2/4 rounded-3xl shadow-login max-lg:w-4/5 max-sm:4/5" @submit.prevent="submitLogin">
            <h1 class="font-bold text-xl text-center py-10 max-lg:text-3xl max-sm:text-base">Sila Masukkan Maklumat Anda</h1>
            <div class="w-4/5 mx-auto">
                <MyLabel text="Nombor Kad Pengenalan" />
                <input class="mt-2 mb-2 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" placeholder="888888888888" v-model="icNumber" type="text" id="icNumber" ><br>
                <label class="text-red-600 font-medium text-xs" for="errorNric" id="errorNric">{{ errorNric }}</label><br>
                <MyLabel text="Nombor Telefon"/>
                <input class="mt-2 mb-2 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" placeholder="Nombor Telefon" v-model="phoneNumber" type="text" id="phoneNumber" ><br>
                <label class="text-red-600 font-medium text-xs" for="errorPassword" id="errorPassword">{{ errorphoneNumber }}</label><br>
                <MyLabel text="Emel"/>
                <input class="mt-2 mb-2 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" placeholder="aa@bb.com" v-model="email" type="text" id="email" ><br>
                <label class="text-red-600 font-medium text-xs" for="errorPassword" id="errorPassword">{{ errorEmail }}</label><br>
            </div>
  
            <div class="w-max mx-auto py-4">            
                <MyButton txt="Sahkan"/>
            </div>
        </form>
    </div>
    <div v-if="loading" class="fixed inset-0 flex items-center bg-black bg-opacity-50 justify-center z-50">
    <div class="loader-wrapper">
         <div class="loader animate-spin rounded-full border-t-4 border-b-4 border-gray-200 h-12 w-12"></div>
    </div>
</div>
</template>
<script>
import axios from 'axios';
import { TransitionChild } from '@headlessui/vue';

export default 
{
    data()
    {
        return{
            icNumber:"",
            phoneNumber:"",
            email:"",

            user:[],
            worker:[],
            manager:[],

            errorNric:'',
            errorphoneNumber:'',
            errorEmail:'',
            loading : false,
        }
    },
    async mounted()
    {


    },
    methods:
    {
        async submitLogin()
        {
            if(this.icNumber&&this.phoneNumber&&this.email)
            {
                this.loading = true
                this.errorNric=''
                this.errorphoneNumber=''
                this.errorEmail=''
                console.log(this.icNumber)
                console.log(this.phoneNumber)
                console.log(this.email)

                
                    await axios.get("https://sistemkedairuncit.onrender.com/resetpassword/"+this.icNumber)
                    .then(response=>{
                    this.user= response.data
                    console.log(this.user.idAccount)
                    sessionStorage.setItem("idAccount",JSON.stringify(this.user.idAccount))

                    if (this.user.role ==="Pekerja")
                    {
                        axios.get("https://sistemkedairuncit.onrender.com/resetworker/"+this.user.idAccount)
                        .then(response=>{
                            this.worker=response.data
                            console.log(this.worker)
                            if(this.worker.phoneNumber===this.phoneNumber && this.worker.email === this.email)
                            {
                                router.push("/resetpassword")
                            }
                            else
                            {
                                if( this.worker.phoneNumber !== this.phoneNumber)
                                {
                                    this.errorphoneNumber="*Nombor Telefon Tidak Sah"
                                }
                                else
                                {
                                   this.errorphoneNumber=''
                                }

                          if (this.worker.email !== this.email) {
                                this.errorEmail = "*Email Tidak Sah";
                            } else {
                                this.errorEmail = '';
                            }
                            }
                        })
                        .catch(error=>console.log(error))
                    }
                    else
                    {
                        axios.get("https://sistemkedairuncit.onrender.com/resetmanager/"+this.user.idAccount)
                        .then(response=>{
                            this.manager=response.data
                            console.log(this.manager)
                            if(this.manager.phoneNumber===this.phoneNumber && this.manager.email === this.email)
                            {
                                router.push("/resetpassword")
                            }
                            else
                            {
                                if( this.manager.phoneNumber !== this.phoneNumber)
                                {
                                    this.errorphoneNumber="*Nombor Telefon Tidak Sah"
                                }
                                else
                                {
                                   this.errorphoneNumber=''
                                }

                          if (this.manager.email !== this.email) {
                                this.errorEmail = "*Email Tidak Sah";
                            } else {
                                this.errorEmail = '';
                            }
                            }
                        })
                        .catch(error=>console.log(error))

                    }
                })
                .catch(error=>{
                    console.log(error)
                    if(error.response.status === 401)
                    {
                        this.errorNric ="*Akaun Tidak Wujud"
                        this.icNumber=''
                        this.phoneNumber=''
                        this.email=''
                    }
                }).finally(()=>{
                    this.loading = false
                })
            }
            else
            {
                if(this.icNumber==='')
                {
                    this.errorNric='*xNombor Kad Pengenalan '

                }else{
                    this.errorNric=''

                }
                
                if(this.phoneNumber==='')
                {
                    this.errorphoneNumber='*Sila Masukkan Nombor Telefon'

                }else{
                    this.errorphoneNumber=''
                }
                if(this.email==='')
                {
                    this.errorEmail='*Sila Masukkan Email'
                }
                else{
                    this.errorEmail=''
                }
            }
        }

    }
}
</script>