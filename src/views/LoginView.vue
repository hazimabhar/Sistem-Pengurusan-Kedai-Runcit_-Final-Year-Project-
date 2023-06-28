<script setup>
import MyButton from '../components/MyButton.vue';
import MyLabel from '../components/MyLabel.vue';
import MyInput from '../components/MyInput.vue';
import NumberInput from '../components/NumberInput.vue';
import { RouterLink } from 'vue-router';
import router from "../router"
import { ref } from '@vue/reactivity';


document.title="Login"
</script>
<template>
    <div class="bg-teal-500 w-screen min-h-screen  grid place-items-center">
        <form class="bg-white w-2/4 rounded-3xl shadow-login max-lg:w-4/5" @submit.prevent="submitLogin">
            <img class="mx-auto px-4 py-4 max-sm:hidden" src="../assets/logo.png" alt="">
            <h1 class="font-bold tracking-wider text-xl text-center pb-3 max-sm:py-5 max-sm:text-2xl max-sm:font-extrabold max-sm:tracking-normal">Log Masuk</h1>
            <div class="w-4/5 mx-auto">
                <MyLabel text="Nombor Kad Pengenalan" />
                <input class="mt-2 mb-2 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" placeholder="888888888888" v-model="icNumber" type="text" id="icNumber" ><br>
                <label class="text-red-600 font-medium text-xs" for="errorNric" id="errorNric">{{ errorNric }}</label><br>
                <MyLabel text="Kata Laluan"/>
                <input class="mt-2 mb-2 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" placeholder="Katalaluan..." v-model="password" type="password" id="password" ><br>
                <label class="text-red-600 font-medium text-xs" for="errorPassword" id="errorPassword">{{ errorPassword }}</label><br>

            </div>
  
            <div class="w-max mx-auto">            
                <MyButton txt="Log Masuk"/>
                <div v-if="loading" class="fixed inset-0 flex items-center bg-black bg-opacity-50 justify-center z-50">
                    <div class="loader-wrapper">
                        <div class="loader animate-spin rounded-full border-t-4 border-b-4 border-gray-200 h-12 w-12"></div>
                    </div>
                </div>
            </div>
            <div class="text-center text-[13px] py-4 underline">
                <RouterLink to="/userinfo">Tukar Kata Laluan</RouterLink>
            </div>
        </form>
    </div>
    <ToastMessageVue ref="toast"/>
</template>
<script>
import axios from 'axios';
import ToastMessageVue from "../components/ToastMessage.vue";


export default 
{
    components:{
        ToastMessageVue,
    },
    data()
    {
        return{
            icNumber:"",
            password:"",

            errorNric:'',
            errorPassword:'',
            loading:false,
        }
    },
    async mounted()
    {


    },
    methods:
    {
        async submitLogin()
        {
            if(this.icNumber&&this.password)
            {
                this.errorNric=''
                this.errorPassword=''
                this.loading=true
                console.log(this.icNumber)
                console.log(this.password)
                try {
                    const response = await axios.post("https://sistemkedairuncit.onrender.com/login",{
                        icNumber : this.icNumber,
                        password: this.password
                    })
                    console.log(response.data)
                    sessionStorage.setItem("idAccount",JSON.stringify(response.data))

                    const responseUser = await axios.get( `https://sistemkedairuncit.onrender.com/${response.data}`)
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
                    if(error.response)
                    {
                        if(error.response.status === 401)
                        {
                            if(error.response.data==="Invalid Identification Number")
                            {
                                this.errorNric="*Nombor Kad Pengenalan Tidak Sah"
                                this.icNumber=''
                                this.password=''
                            }
                            else if(error.response.data==="Invalid Password")
                            {
                                this.errorNric=''
                                this.errorPassword="*Salah Katalaluan"
                                this.password=''
                            }
                            else if(error.response.data==="Invalid Password. Please reset your password")
                            {
                                this.errorNric=''
                                this.errorPassword="*Salah Katalaluan"
                                this.password=''

                                const message ='Sila Tukar Kata Laluan'
                                const status = 'Gagal'
                                
                                this.$refs.toast.toast(message,status,'error')
                            }
                            else
                            {
                                this.errorNric = ''
                                this.errorPassword=''
                            }
                        }
                    }
                    else {
                        this.errorNric = 'An error occurred during login.';
                    }
                }
                finally{
                    this.loading=false
                }

            }
            else
            {
                if(this.icNumber==='')
                {
                    this.errorNric='*Sila Masukkan Nombor Kad Pengenalan Anda'

                }else{
                    this.errorNric=''

                }
                
                if(this.password==='')
                {
                    this.errorPassword='*Sila Masukkan Katalaluan'

                }else{
                    this.errorPassword=''
                }
            }
        }

    }
}
</script>