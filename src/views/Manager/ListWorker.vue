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
        <div class="bg-slate-100 max-md:bg-white max-lg:bg-white ]">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Senarai Pekerja</p>
            </div>
            <div class="w-9/12 mx-auto mr-16 bg-white pt-4 max-sm:w-11/12 max-sm:mx-auto rounded-3xl pb-5 min-h-screen ">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/manager" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <li>Senarai Pekerja </li>
                </ul>
                <div class="w-full px-10  max-sm:p-0">
                    <p class=" text-xl font-semibold mb-4">Senarai Pekerja</p>
                    <table  class="w-11/12 text-center" >
                        <colgroup>
                            <col class="w-1/2">
                            <col class="w-1/4">
                            <col class="w-1/4">
                        </colgroup>
                        <thead class="bg-teal-500 text-sm text-white">
                            <th class="font-semibold py-2 px-2 rounded-l-2xl">Nama</th>
                            <th class="font-semibold" >Nombor Telefon</th>
                            <th class="font-semibold py-2 px-2 rounded-r-2xl" >Tindakan</th>
                        </thead>
                        <tbody>
                            <tr  v-for="user in worker" :key="user.id" class="text-slate-500 text-sm border-b-2 ">
                                <td class="border-slate-600">{{user.name}}</td>
                                <td class="border-slate-600">{{user.phoneNumber}}</td>
                                <td class="border-slate-600">
                                    <div class="flex justify-evenly">
                                        <div>
                                            <i class="fa-solid fa-trash text-red-500 text-2xl hover:text-red-300 cursor-pointer" @click="toggleDialog(user, 'worker')" ></i>
                                        </div>
                                        <div>
                                            <RouterLink v-bind:to="`/manager/updateworker/` +user.idWorker">
                                                <i class="fa-regular fa-pen-to-square text-blue-500 text-2xl hover:text-blue-300 cursor-pointer"></i>
                                            </RouterLink>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="w-full mt-10 px-10 max-sm:p-0">
                    <p class=" text-xl font-semibold mb-4">Senarai Pengurus</p>
                    <table  class="w-11/12 text-center" >
                        <colgroup>
                            <col class="w-1/2">
                            <col class="w-1/4">
                            <col class="w-1/4">
                        </colgroup>
                        <thead class="bg-teal-500 text-sm text-white">
                            <th class="font-semibold py-2 px-2 rounded-l-2xl">Nama</th>
                            <th class="font-semibold" >Nombor Telefon</th>
                            <th class="font-semibold py-2 px-2 rounded-r-2xl" >Tindakan</th>
                        </thead>
                        <tbody>
                            <tr  v-for="user in manager" :key="user.id" class="text-slate-500 text-sm border-b-2 ">
                                <td class="border-slate-600">{{user.name}}</td>
                                <td class="border-slate-600">{{user.phoneNumber}}</td>
                                <td class="border-slate-600">
                                    <div class="flex justify-evenly">
                                        <div>
                                            <i class="fa-solid fa-trash text-red-500 text-2xl hover:text-red-300 cursor-pointer" @click="toggleDialog(user,'manager')" ></i>
                                        </div>
                                        <div>
                                            <RouterLink v-bind:to="`/manager/updatemanager/` +user.idManager">
                                                <i class="fa-regular fa-pen-to-square text-blue-500 text-2xl hover:text-blue-300 cursor-pointer"></i>
                                            </RouterLink>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            </div>
            <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
    <dialog class="w-1/3 mx-auto shadow-product rounded-2xl  absolute top-44 z-50" v-bind:open="isOpen">
        <div class="">
            <div class="py-2" v-if="selectedUser" >
                <div>
                    <p class="font-semibold text-blue-700 text-center text-xl">Info Pengguna</p>
                </div>
                <div class="flex justify-between p-5">
                <div class="">
                    <p>Nama</p>
                    <p>Nombor Telefon</p>
                    <p>Emel</p>
                    <p>Jantina</p>
                </div>
                <div class="">
                    <p>{{selectedUser.name}}</p>
                    <p>{{selectedUser.phoneNumber}}</p>
                    <p>{{selectedUser.email}}</p>
                    <p>{{selectedUser.gender}}</p>
                </div>
                </div>
            </div>
            <div class="flex w-max mx-auto gap-4">
                <div>
                    <button class="bg-black text-white p-2 px-8 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="toggleDialog">Batal</button>
                </div>
                <div>
                    <button class="bg-red-600 text-white p-2 px-8 rounded-xl hover:bg-white hover:text-red-600 hover:outline hover:outline-red-600" @click="deleteUser(selectedUser)">Buang</button>
                </div>
            </div>
        </div>
    </dialog>
        </div>
        <ToastMessageVue ref="toast"/>
</template>

<script>
import axios from 'axios';
import ToastMessageVue from "../../components/ToastMessage.vue";

export default {
    components: {
    ToastMessageVue,
  },
    data()
    {
        return {
            worker: [],
            manager:[],
            isOpen: false,
            selectedUser: null,
            role:null

        }
    },
    mounted()
    {
        axios.get("http://localhost:3000/worker")
        .then(response=>{
            this.worker = response.data
            console.log(this.worker)
        })
        .catch(error=>console.log(error))

        axios.get("http://localhost:3000/manager")
        .then(response=>{
            this.manager = response.data
            console.log(this.manager)
        })
        .catch(error=>console.log(error))

    },
    methods:{
        toggleDialog(user, role)
        {
            console.log(user)
            this.selectedUser = user
            this.role = role
            console.log(role)
            this.isOpen = !this.isOpen; // Toggle the isOpen property
        },
        async deleteUser(selectedUser)
        {
            console.log(selectedUser);
            if (this.role === 'worker')
            {
                await axios.delete("http://localhost:3000/worker/"+selectedUser.idWorker)
                .then(response => {
                const index = this.worker.findIndex(i => i.idWorker === selectedUser.idWorker)
                if (index !== -1) {
                    this.worker.splice(index, 1); // Remove the selected item from the item array
                }
                const message ='Rekod Pekerja Berjaya Dibuang'
                const status = 'Berjaya'
                this.$refs.toast.toast(message,status,'success')
            })
            .catch(error=>console.log(error))
            this.isOpen = !this.isOpen; // Toggle the isOpen property
            }
            else if (this.role === 'manager')
            {
                await axios.delete("http://localhost:3000/manager/"+selectedUser.idManager)
                .then(response => {
                const index = this.manager.findIndex(i => i.idManager === selectedUser.idManager)
                if (index !== -1) {
                    this.manager.splice(index, 1); // Remove the selected item from the item array
                }
                const message ='Rekod Pengguna Berjaya Dibuang'
                const status = 'Berjaya'
                this.$refs.toast.toast(message,status,'success')
            })
            .catch(error=>console.log(error))
            this.isOpen = !this.isOpen; // Toggle the isOpen property
            }


        }


    }


}
</script>