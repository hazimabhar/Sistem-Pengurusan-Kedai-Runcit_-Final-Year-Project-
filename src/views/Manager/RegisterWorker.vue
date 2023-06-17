<script setup>
import ManagerNavBar from '../../components/ManagerNavBar.vue';
import MyButton from '../../components/MyButton.vue';
import { RouterLink } from 'vue-router';
import { ref } from 'vue';
import router from "../../router"


document.title='Home Page'
</script>

<template>
    <div >
        <ManagerNavBar/>
        <div class="bg-slate-100 max-md:bg-white max-lg:bg-white">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Daftar Pekerja</p>
            </div>
            <div class="w-9/12 mx-auto mr-16 bg-white pt-4 max-sm:w-11/12 max-sm:mx-auto rounded-3xl pb-5">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/manager" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <li>Daftar Pekerja </li>
                </ul>
                <div class="w-full px-10 max-sm:p-0">
                    <p class=" text-xl font-semibold mb-4">Sila Masukkan Butiran Pekerja</p>
                    <form autocomplete="off" class="">
                        <div>
                            <label class="text-gray-500" for="Nama Penuh">Nama Penuh</label><br>
                            <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="Ali bin Ahmad" id="namapenuh" v-model="namapenuh"><br>
                            <label class="text-red-600 font-medium text-xs" for="errorName" id="errorName">{{ errorName }}</label><br>
                            <div class="flex gap-5 mb-2">
                            <div class="block gap-5 mb-2">
                                    <div>
                                        <label class="text-gray-500" for="Nombor IC">Nombor Kad Pengenalan</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="888888888888" id="nomboric" v-model="nomboric"><br>
                                        <label class="text-red-600 font-medium text-xs" for="errornric" id="errorNric">{{ errorNric }}</label>                                        
                                        <label class="text-red-600 font-medium text-xs" for="errornric" id="errorNric">{{ errorCheckedNric }}</label><br>
                                    </div>
                                    <div>
                                        <label class="text-gray-500" for="Nombor Telefon">Nombor Telefon</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="0123456789" id="telefon" v-model="telefon"><br>
                                        <label class="text-red-600 font-medium text-xs" for="errorTelephone" id="errorTelephone">{{ errorPhone }}</label><br>
                                    </div>
                            </div>
                            <div class="block gap-5 mb-2">
                                    <div>
                                        <label class="text-gray-500" for="Password">Kata Laluan</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="password" placeholder="Kata Laluan" id="password" v-model="password"><br>
                                        <label class="text-red-600 font-medium text-xs" for="errorpassword" id="errorPassword">{{ errorPassword }}</label>
                                        <label class="text-red-600 font-medium text-xs" for="errorpassword" id="errorPassword">{{ errorCheckedPassword }}</label><br>
                                    </div>
                                    <div>
                                        <label class="text-gray-500" for="E-mel">E-mel</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="email" placeholder="ali@gmail.com" id="email" v-model="email" required><br>
                                        <label class="text-red-600 font-medium text-xs" for="errorEmail" id="errorEmail">{{ errorEmail }}</label>
                                        <label class="text-red-600 font-medium text-xs" for="errorEmail" id="errorEmail">{{ errorCheckedEmail }}</label><br>
                                    </div>
                            </div>
                            <div class="ml-[5%]">
                            <label class="text-gray-500" for="Alamat">Alamat</label><br>
                            <textarea rows="5" cols="60" class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" placeholder="Persiaran Tun Dr. Ismail, 86400 Parit Raja, Johor" id="alamat" v-model="alamat"></textarea><br>
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
                                        <input type="radio" name="Jantina" value="Lelaki" v-model="jantina">
                                        <label class="pl-2" for="Lelaki">Lelaki</label><br>
                                    </div>
                                    <div>
                                        <input type="radio" name="Jantina" value="Perempuan" v-model="jantina">
                                        <label class="pl-2" for="Lerempuan">Perempuan</label><br>
                                    </div>
                                </div>
                                <div class="flex gap-5 mb-2">
                                    <div>
                                        <input type="radio" name="Peranan" value="Pengurus" v-model="peranan">
                                        <label class="pl-2" for="Pengurus">Pengurus</label><br>
                                    </div>
                                    <div>
                                        <input type="radio" name="Peranan" value="Pekerja" v-model="peranan">
                                        <label class="pl-2" for="Pekerja">Pekerja</label><br>
                                    </div>
                                </div>
                            </div>
                            <div class="flex">
                                <div>
                                    <label class="text-red-600 font-medium text-xs" for="errorGender" id="errorGender">{{ errorGender }}</label>
                                </div>
                                <div>
                                    <label class="text-red-600 font-medium text-xs" for="errorRole" id="errorRole">{{ errorRole }}</label>
                                </div>
                            </div>
                        </div>
                        <div class="w-max mx-auto flex gap-10 mt-5 max-sm:gap-5">
                            <div>
                                <MyButton txt="Batal" class="bg-red-600 max-sm:px-8" @click.prevent="cancelForm"/>
                            </div>
                            <div>
                                <MyButton txt="Daftar" class="max-sm:px-8" @click.prevent="submitForm"/>
                                <div v-if="loading" class="fixed inset-0 flex items-center bg-black bg-opacity-50 justify-center z-50">
                                    <div class="loader-wrapper">
                                        <div class="loader animate-spin rounded-full border-t-4 border-b-4 border-gray-200 h-12 w-12"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            </div>
            <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !completeRegister}"></div>
    <dialog class="w-fit mx-auto shadow-product rounded-2xl  fixed top-44 z-50" v-bind:open="completeRegister">
        <div class="">
            <div>
                <p class="font-semibold text-green-700 text-center text-xl">Pengguna Berjaya Didaftarkan!</p>
            </div>
            <div class="py-2" v-if="user">
                <div class="flex justify-between gap-5 p-5">
                <div class="">
                    <p>Nama</p>
                    <p>Nombor Telefon</p>
                    <p>Email</p>
                    <p>Alamat</p>
                    <p>Jantina</p>
                </div>
                <div class="">
                    <p>{{user.name}}</p>
                    <p>{{user.phoneNumber}}</p>
                    <p>{{user.email}}</p>
                    <p>{{user.address}}</p>
                    <p>{{user.gender}}</p>
                </div>
                </div>
            </div>
            <div class="flex justify-evenly">
                <div class="mt-[7px]">
                    <RouterLink  to="/manager/listworker" class="w-max bg-blue-600 text-white p-2 px-5 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black text-sm " >Senarai Pekerja</RouterLink>
                </div>
                <div>
                    <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black text-sm " @click="closeCompleteRegister">Daftar</button>
                </div>
            </div>
        </div>
    </dialog>
        </div>
</template>
<script>
import router from '../../router';
import axios from 'axios';

export default {
    data() {
    return {
      namapenuh: '',
      nomboric: '',
      password: '',
      telefon: '',
      email: '',
      alamat: '',
      jantina:null,
      peranan: null,

      errorName:'',
      errorNric:'',
      errorCheckedNric:'',
      errorPassword:'',
      errorPhone:'',
      errorEmail:'',
      errorCheckedEmail:'',
      errorAddress:'',
      errorGender:'',
      errorRole:'',

      checkedEmailManager:'',
      checkedEmailWorker:'',
      checkedNric:'',

      completeRegister:false,
      loading : false,


      user:[]
    }
  },
  methods:{
    async submitForm()
    {
        try
        {
            this.loading = true
            await axios.get("https://sistemkedairuncit.onrender.com/emailmanager")
        .then(response=>{
            this.checkedEmailManager = response.data
            console.log(this.checkedEmailManager)
        })
        .catch(error=>console.log(error))

        await axios.get("https://sistemkedairuncit.onrender.com/emailworker")
        .then(response=>{
            this.checkedEmailWorker = response.data
            console.log(this.checkedEmailWorker)
        })
        .catch(error=>console.log(error))

        await axios.get("https://sistemkedairuncit.onrender.com/nric")
        .then(response=>{
            this.checkedNric = response.data
            console.log(this.checkedNric)
        })
        .catch(error=>console.log(error))

        const name = this.namapenuh
        const icNumber = this.nomboric
        const password = this.password
        const phoneNumber = this.telefon
        const email = this.email
        const address = this.alamat
        const gender = document.querySelector('input[name="Jantina"]:checked')?.value
        const role = document.querySelector('input[name="Peranan"]:checked')?.value

        const existingEmailManager = this.checkedEmailManager.find(manager => manager.email === this.email);
        const existedEmailWorker = this.checkedEmailWorker.find(worker=>worker.email === this.email)

        const existedEmail= existingEmailManager||existedEmailWorker

        const existedNric = this.checkedNric.find(user=>user.icNumber===this.nomboric)

        if(this.namapenuh && this.nomboric && this.password && this.telefon && this.email && this.alamat && this.jantina && this.peranan && !existedEmail && !existedNric)
        {
                this.errorCheckedEmail=''
                this.errorCheckedNric=''
                if(!/(?=.*[A-Z])(?=.*[0-9]).{8,}/.test(this.password)){
                    this.errorPassword ='*Kata Laluan Tidak Sah';
                }
                else{
                    this.errorPassword = ''   
                }
                
                if(!/^[\w.-]+@[a-zA-Z_-]+\.[a-zA-Z]{2,4}$/.test(this.email)){
                    this.errorEmail = '*Emel Tidak Sah';
                }
                else{
                    this.errorEmail = ''
                }
                if(!/^\d{12}$/.test(this.nomboric))
                {
                    this.errorNric='*IC Tidak Sah'
                }
                else{
                    this.errorNric=''
                }

                if(!this.errorPassword && !this.errorEmail && !this.errorNric)
                {
                    this.completeRegister = !this.completeRegister; // Toggle the isOpen property

                    const user={
                        icNumber,
                        password,
                        role
                    }

                    const info={
                        name,
                        phoneNumber,
                        email,
                        address,
                        gender,
                    }

                    this.user=info



                    if (role === "Pengurus")
                    {
                        console.log("Manager");
                        console.log(user);
                        console.log(info);
                        axios.post("https://sistemkedairuncit.onrender.com/", user)
                        .then(response=>{
                            const idAccount = response.data.idAccount
                            info.idAccount = idAccount

                            axios.post("https://sistemkedairuncit.onrender.com/manager", info)
                            .then(response => {console.log(response.data)})
                            .catch(error => {console.log(error)})
                        })
                        .catch(error => {console.log(error)})
                    }
                    else
                    {
                        console.log("Worker");
                        console.log(user);
                        console.log(info);
                        axios.post("https://sistemkedairuncit.onrender.com/", user)
                        .then(response=>{
                            const idAccount = response.data.idAccount
                            info.idAccount = idAccount

                            axios.post("https://sistemkedairuncit.onrender.com/worker", info)
                            .then(response => {console.log(response.data)})
                            .catch(error => {console.log(error)})
                        })
                        .catch(error => {console.log(error)})

                    }
                }


           
        }
        else
        {
      
         
                if(existedEmail){
                this.errorCheckedEmail='*Email Ini Telah Didaftarkan'
                }
                else{
                    this.errorCheckedEmail=''
                }
                if(existedNric){
                    this.errorCheckedNric='*IC Ini Telah Didaftarkan'
                }
                else{
                    this.errorCheckedNric=''
                }

                if(this.namapenuh===''){
                    this.errorName='*Sila Masukkan Nama Penuh'
                }
                else{
                    this.errorName=''
                }

                if(this.nomboric===''){
                    this.errorNric='*Sila Masukkan Nombor IC'
                }
                else{
                    this.errorNric=''
                }

                if(this.password===''){
                    this.errorPassword='*Sila Masukkan Kata Laluan'
                }
                else{
                    this.errorPassword=''
                }

                if(this.telefon===''){
                    this.errorPhone='*Sila Masukkan Nombor Telefon'
                }
                else{
                    this.errorPhone=''
                }

                if(this.email===''){
                    this.errorEmail='*Sila Masukkan Emel'
                }
                else{
                    this.errorEmail=''
                }
                    
                if(this.alamat===''){
                    this.errorAddress='*Sila Masukkan Alamat'
                }
                else{
                    this.errorAddress=''
                }
                    
                if(this.jantina===null){
                    this.errorGender='*Sila Pilih Jantina'
                }
                else{
                    this.errorGender=''
                }

                if(this.peranan===null){
                    this.errorRole='*Sila Pilih Peranan'
                }
                else{
                    this.errorRole=''
                }

            }
 
        }
        finally{
            this.loading = false
        }
        


    },
    cancelForm()
    {
        this.namapenuh='',
        this.nomboric='',
        this.password='',
        this.telefon='',
        this.email='',
        this.alamat='',
        this.jantina=null,
        this.peranan=null,

        router.push('/manager')
    },
    closeCompleteRegister()
    {
        this.completeRegister = !this.completeRegister; // Toggle the isOpen property

        this.namapenuh='',
                this.nomboric='',
                this.password='',
                this.telefon='',
                this.email='',
                this.alamat='',
                this.jantina=null,
                this.peranan=null
    }
  }
  }
</script>