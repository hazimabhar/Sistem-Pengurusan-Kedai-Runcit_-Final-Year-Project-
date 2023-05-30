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
            <div class="w-9/12 mx-auto mr-16 bg-white pt-4 max-sm:w-11/12 max-sm:mx-auto rounded-3xl">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/manager" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <RouterLink to="/manager/listworker" class="text-blue-500 hover:underline">Senarai Pekerja</RouterLink> 
                    <span class="px-2">></span>
                    <li>Kemaskini Maklumat Pengurus </li>
                </ul>
                <div class="w-full px-10 max-sm:p-0">
                    <p class=" text-xl font-semibold mb-4">Kemaskini Maklumat Pengurus</p>
                    <form class="" @submit.prevent="registerProduct()">
                        <div>
                            <label class="text-gray-500" for="Nama Penuh">Nama Penuh</label><br>
                            <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="Ali bin Ahmad" id="namapenuh" v-model="user.name"><br>
                            <label class="text-red-600 font-light text-sm" for="errorName" id="errorName"></label><br>
                            <div class="flex gap-5 mb-2">
                            <div class="block gap-5 mb-2">
                                    <div>
                                        <label class="text-gray-500" for="Nombor IC">Nombor Kad Pengenalan</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="888888888888" id="nomboric" v-model="cantChange.icNumber"><br>
                                        <label class="text-red-600 font-light text-sm" for="errornric" id="errorNric"></label><br>
                                    </div>
                                    <div>
                                        <label class="text-gray-500" for="Password">Kata Laluan</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="password" placeholder="Kata Laluan" id="password" v-model="cantChange.password"><br>
                                        <label class="text-red-600 font-light text-sm" for="errorpassword" id="errorPassword"></label><br>
                                    </div>
                            </div>
                            <div class="block gap-5 mb-2">
                                    <div>
                                        <label class="text-gray-500" for="Nombor Telefon">Nombor Telefon</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="0123456789" id="telefon" v-model="user.phoneNumber"><br>
                                        <label class="text-red-600 font-light text-sm" for="errorTelephone" id="errorTelephone"></label><br>
                                    </div>
                                    <div>
                                        <label class="text-gray-500" for="E-mel">E-mel</label><br>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="email" placeholder="ali@gmail.com" id="email" v-model="user.email" required><br>
                                        <label class="text-red-600 font-light text-sm" for="errorEmail" id="errorEmail"></label><br>
                                    </div>
                            </div>
                            <div class="ml-[5%]">
                            <label class="text-gray-500" for="Alamat">Alamat</label><br>
                            <textarea rows="4" cols="60" class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" placeholder="Persiaran Tun Dr. Ismail, 86400 Parit Raja, Johor" id="alamat" v-model="user.address"></textarea><br>
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
                                        <input type="radio" name="Peranan" value="Pengurus" v-model="user.role">
                                        <label class="pl-2" for="lelaki">Pengurus</label><br>
                                    </div>
                                    <div>
                                        <input type="radio" name="Peranan" value="Pekerja" v-model="user.role">
                                        <label class="pl-2" for="perempuan">Pekerja</label><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="w-max mx-auto flex gap-10 mt-5 max-sm:gap-5">
                            <div>
                                <MyButton txt="Batal" class="bg-red-600 max-sm:px-8" @click.prevent="cancelForm"/>
                            </div>
                            <div>
                                <MyButton txt="Kemaskini" class="max-sm:px-8" @click.prevent="submitForm"/>
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
import router from '../../router';

export default
{
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
                role:''
            },
            cantChange:
            {
                icNumber:'',
                password:'',
            }
            

        }
    },
    async mounted()
    {
        console.log(this.userId)
        await axios.get("http://localhost:3000/manager/"+this.userId)
        .then(response=>{
            this.user = response.data
            console.log(this.user)
        })
        .catch(error=>console.log(error))

        const idAccount = this.user.idAccount
        console.log(idAccount)
        await axios.get("http://localhost:3000/"+ idAccount)
        .then(response=>{
            this.cantChange = response.data
            console.log(this.cantChange)
        })
    },
    methods:
    {
        async submitForm()
        {
            console.log(this.user)
            console.log(this.userId)

            await axios.put("http://localhost:3000/manager/"+this.userId, this.user)
            .then(response=>console.log(response))
            .catch(error=>console.log(error))
        }
    }
}
</script>