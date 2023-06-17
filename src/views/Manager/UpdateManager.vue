<script setup>
import ManagerNavBar from '../../components/ManagerNavBar.vue';
import MyButton from '../../components/MyButton.vue';

document.title='Home Page'
</script>

<template>
    <div >
        <ManagerNavBar/>
        <div class="bg-slate-100 max-md:bg-white max-lg:bg-white">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Daftar Pekerja Hazim</p>
            </div>
            <div class="w-9/12 mx-auto mr-16 bg-white pt-4 pb-5 max-sm:w-11/12 max-sm:mx-auto rounded-3xl">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/manager" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <RouterLink to="/manager/listworker" class="text-blue-500 hover:underline">Senarai Pekerja</RouterLink> 
                    <span class="px-2">></span>
                    <li>Kemaskini Maklumat Pekerja </li>
                </ul>
                <div class="w-full px-10 max-sm:p-0">
                    <p class=" text-xl font-semibold mb-4">Kemaskini Maklumat Pekerja</p>
                    <form class="" @submit.prevent="registerProduct()">
                        <div>
                            <label class="text-gray-500" for="Nama Penuh">Nama Penuh</label><br>
                            <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="Ali bin Ahmad" id="namapenuh" v-model="user.name"><br>
                            <label class="text-red-600 font-medium text-xs" for="errorName" id="errorName">{{ errorName }}</label><br>
                            <div class="flex gap-5 mb-2">
                            <div class="block gap-5 mb-2">
                                    <div>
                                        <label class="text-gray-500" for="Nombor IC">Nombor Kad Pengenalan</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500 disabled:bg-[#b0b0b0] cursor-not-allowed" type="text" placeholder="888888888888" id="nomboric" v-model="cantChange.icNumber" disabled ><br>
                                        <label class="text-red-600 font-medium text-xs" for="errornric" id="errorNric"></label><br>
                                    </div>
                                    <div>
                                        <label class="text-gray-500" for="Nombor Telefon">Nombor Telefon</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="0123456789" id="telefon" v-model="user.phoneNumber"><br>
                                        <label class="text-red-600 font-medium text-xs" for="errorTelephone" id="errorTelephone">{{ errorPhone }}</label><br>
                                    </div>
                
                            </div>
                            <div class="block gap-5 mb-2">
                                    <div>
                                        <label class="text-gray-500" for="Password">Kata Laluan</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500 disabled:bg-[#b0b0b0] cursor-not-allowed" type="password" placeholder="Kata Laluan" id="password" v-model="cantChange.password" disabled><br>
                                        <label class="text-red-600 font-medium text-xs" for="errorpassword" id="errorPassword"></label><br>
                                    </div>
                                    <div>
                                        <label class="text-gray-500" for="E-mel">E-mel</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="email" placeholder="ali@gmail.com" id="email" v-model="user.email" required><br>
                                        <label class="text-red-600 font-medium text-xs" for="errorEmail" id="errorEmail">{{ errorEmail }}</label><br>
                                    </div>
                            </div>
                            <div class="ml-[5%]">
                            <label class="text-gray-500" for="Alamat">Alamat</label><br>
                            <textarea rows="4" cols="60" class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" placeholder="Persiaran Tun Dr. Ismail, 86400 Parit Raja, Johor" id="alamat" v-model="user.address"></textarea><br>
                            <label class="text-red-600 font-medium text-xs" for="errorAddress" id="errorAddress">{{ errorAddress }}</label><br>
                            </div>
                        </div>
                            <div class="flex gap-96 mb-2">
                                <label class="text-gray-500" for="Jantina">Jantina</label>
                                <label class="text-gray-500" for="Jantina">Peranan</label>
                            </div>
                            <div class="flex gap-60 mb-2">
                                <div class="flex gap-5 mb-2">
                                    <div>
                                        <input type="radio" name="Jantina" value="Lelaki" v-model="user.gender">
                                        <label class="pl-2" for="lelaki">Lelaki</label><br>
                                    </div>
                                    <div>
                                        <input type="radio" name="Jantina" value="Perempuan" v-model="user.gender">
                                        <label class="pl-2" for="perempuan">Perempuan</label><br>
                                    </div>
                                </div>
                                <div class="flex gap-5 mb-2">
                                    <div>
                                        <input type="radio" name="Peranan" value="Pengurus" v-model="cantChange.role" disabled class="opacity-100 cursor-not-allowed">
                                        <label class="pl-2" for="lelaki">Pengurus</label><br>
                                    </div>
                                    <div>
                                        <input type="radio" name="Peranan" value="Pekerja" v-model="cantChange.role" disabled class="opacity-100 cursor-not-allowed">
                                        <label class="pl-2" for="perempuan">Pekerja</label><br>
                                    </div>
                                </div>
                            </div>
                            <div class="flex">
                                <div>
                                    <label class="text-red-600 font-medium text-xs" for="errorGender" id="errorGender">{{ errorGender }}</label>
                                </div>
                            </div>
                        </div>
                        <div class="w-max mx-auto flex gap-10 mt-5 max-sm:gap-5">
                            <div class="mt-[31px]">
                                <RouterLink  to="/manager/listworker" class="w-max bg-red-600 text-white rounded-3xl py-2 px-20 mt-6 hover:outline hover:outline-black  hover:bg-white hover:text-black" >Batal</RouterLink>
                            </div>
                            <div class="mt-[14px]">
                                <MyButton txt="Kemaskini" class="max-sm:px-8" @click.prevent="submitForm"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            </div>
   
        </div>
        <ToastMessageVue ref="toast"/>
        <div v-if="loading" class="fixed inset-0 flex items-center bg-black bg-opacity-50 justify-center z-50">
                                    <div class="loader-wrapper">
                                        <div class="loader animate-spin rounded-full border-t-4 border-b-4 border-gray-200 h-12 w-12"></div>
                                    </div>
                            </div>
</template>
<script>
import axios from 'axios';
import router from '../../router';
import ToastMessageVue from "../../components/ToastMessage.vue";

export default {
    components: {
    ToastMessageVue,
  },
    data()
    {
        return {
            userId:router.currentRoute.value.params.id,
            user:{
                name:'',
                phoneNumber:'',
                email:'',
                address:'',
                gender:'',
            },
            cantChange:[],

            errorName:'',
            errorNric:'',
            errorPhone:'',
            errorEmail:'',
            errorAddress:'',
            errorGender:'',

            loading : false

        }
    },
    async mounted()
    {
        console.log(this.userId)
        this.loadData()
  
    },
    methods:
    {
        async loadData()
        {
            this.loading = true 
           
                await axios.get("https://sistemkedairuncit.onrender.com/manager/"+this.userId)
                .then(response=>{
                    this.user = response.data
                    console.log(this.user)
                })
                .catch(error=>console.log(error))
                const idAccount = this.user.idAccount
                console.log(idAccount)
                await axios.get("https://sistemkedairuncit.onrender.com/"+ idAccount)
                .then(response=>{
                    this.cantChange = response.data
                    console.log(this.cantChange)
                })
                .finally(()=>{
                    this.loading = false
                })
           
            
        },
        async submitForm()
        {
            console.log(this.user)
            console.log(this.userId)
            console.log(this.user.email)
            this.loading = true

            try {
                if(this.user.name && this.user.phoneNumber && this.user.email && this.user.address && this.user.gender)
            {

                if(!/^[\w.-]+@[a-zA-Z_-]+\.[a-zA-Z]{2,4}$/.test(this.user.email)){
                    this.errorEmail = '*Emel Tidak Sah';
                }
                else{
                    this.errorEmail = ''
                }

                if(!this.errorEmail)
                {
                    await axios.put("https://sistemkedairuncit.onrender.com/manager/"+this.userId, this.user)
                    .then(response=>console.log(response))
                    const message ='Maklumat Pengurus Berjaya Dikemaskini'
                    const status = 'Berjaya'
                    this.$refs.toast.toast(message,status,'success')
                    this.errorName=''
                    this.errorNric=''
                    this.errorPhone=''
                    this.errorEmail=''
                    this.errorAddress=''
                    this.errorGender=''
                    .catch(error=>console.log(error))

                }

            }
            else
        {
            
            if(this.user.name===''){
                this.errorName='*Sila Masukkan Nama Penuh'
            }
            else{
                this.errorName=''
            }

            if(this.user.phoneNumber===''){
                this.errorPhone='*Sila Masukkan Nombor Telefon'
            }
            else{
                this.errorPhone=''
            }

            if(this.user.email===''){
                this.errorEmail='*Sila Masukkan Emel'
            }
            else{
                this.errorEmail=''
            }
                
            if(this.user.address===''){
                this.errorAddress='*Sila Masukkan Alamat'
            }
            else{
                this.errorAddress=''
            }
                
            if(this.user.gender===null){
                this.errorGender='*Sila Pilih Jantina'
            }
            else{
                this.errorGender=''
            }

            if(this.user.role===null){
                this.errorRole='*Sila Pilih Peranan'
            }
            else{
                this.errorRole=''
            }


        }
                
            } finally {
                this.loading = false
                
            }
           
        }
    }
}
</script>