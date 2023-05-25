<script setup>
import ManagerNavBar from '../../components/ManagerNavBar.vue';
import MyButton from '../../components/MyButton.vue';
import { RouterLink } from 'vue-router';
import { ref } from 'vue';

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
                    <form autocomplete="off" class="" @submit.prevent="registerProduct()" >
                        <div>
                            <label class="text-gray-500" for="Nama Penuh">Nama Penuh</label><br>
                            <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="Ali bin Ahmad" id="namapenuh" v-model="namapenuh"><br>
                            <label class="text-red-600 font-light text-sm" for="errorName" id="errorName"></label><br>
                            <div class="flex gap-5 mb-2">
                            <div class="block gap-5 mb-2">
                                    <div>
                                        <label class="text-gray-500" for="Nombor IC">Nombor Kad Pengenalan</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="888888888888" id="nomboric" v-model="nomboric"><br>
                                        <label class="text-red-600 font-light text-sm" for="errornric" id="errorNric"></label><br>
                                    </div>
                                    <div>
                                        <label class="text-gray-500" for="Nombor Telefon">Nombor Telefon</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="0123456789" id="telefon" v-model="telefon"><br>
                                        <label class="text-red-600 font-light text-sm" for="errorTelephone" id="errorTelephone"></label><br>
                                    </div>
                            </div>
                            <div class="block gap-5 mb-2">
                                    <div>
                                        <label class="text-gray-500" for="Password">Kata Laluan</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="password" placeholder="Kata Laluan" id="password" v-model="password"><br>
                                        <label class="text-red-600 font-light text-sm" for="errorpassword" id="errorPassword"></label><br>
                                    </div>
                                    <div>
                                        <label class="text-gray-500" for="E-mel">E-mel</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="email" placeholder="ali@gmail.com" id="email" v-model="email" required><br>
                                        <label class="text-red-600 font-light text-sm" for="errorEmail" id="errorEmail"></label><br>
                                    </div>
                            </div>
                            <div class="ml-[5%]">
                            <label class="text-gray-500" for="Alamat">Alamat</label><br>
                            <textarea rows="4" cols="60" class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" placeholder="Persiaran Tun Dr. Ismail, 86400 Parit Raja, Johor" id="alamat" v-model="alamat"></textarea><br>
                            <label class="text-red-600 font-light text-sm" for="errorAddress" id="errorAddress"></label><br>
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
                        </div>
                        <div class="w-max mx-auto flex gap-10 mt-5 max-sm:gap-5">
                            <div>
                                <MyButton txt="Batal" class="bg-red-600 max-sm:px-8" @click.prevent="cancelForm"/>
                            </div>
                            <div>
                                <MyButton txt="Daftar" class="max-sm:px-8" @click.prevent="submitForm"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            </div>
   

        </div>
</template>
<script>
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
    }
  },
  methods:{
    submitForm()
    {
        const name = this.namapenuh
        const icNumber = this.nomboric
        const password = this.password
        const phoneNumber = this.telefon
        const email = this.email
        const address = this.alamat
        const gender = document.querySelector('input[name="Jantina"]:checked')?.value
        const role = document.querySelector('input[name="Peranan"]:checked')?.value

        const user={
            icNumber,
            password
        }
        
        const info={
            name,
            phoneNumber,
            email,
            address,
            gender,
            role
        }

        if (role === "Pengurus")
        {
            console.log("Manager");
            console.log(user);
            console.log(info);
            axios.post("http://localhost:3000/", user)
            .then(response=>{
                const idAccount = response.data.idAccount
                info.idAccount = idAccount

                axios.post("http://localhost:3000/manager", info)
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
            axios.post("http://localhost:3000/", user)
            .then(response=>{
                const idAccount = response.data.idAccount
                info.idAccount = idAccount

                axios.post("http://localhost:3000/worker", info)
                .then(response => {console.log(response.data)})
                .catch(error => {console.log(error)})
            })
            .catch(error => {console.log(error)})
        }


    }
    
  }


}
</script>