<script setup>
import ManagerNavBar from '../../components/ManagerNavBar.vue';
import Process from '../../components/Process.vue';

document.title='Home Page'
</script>

<template>
    <div >
        <ManagerNavBar/>
        <div class="bg-slate-100 max-md:bg-white max-lg:bg-white">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Operasi</p>
            </div>
            <div class="w-9/12 mx-auto mr-16 bg-white pt-4 max-sm:w-11/12 max-sm:mx-auto rounded-3xl">
                <ul>
                    <li class="px-8 pb-10">Laman Utama</li>
                </ul>
                <div class="flex">
                <div v-if="item && item.length>0" class="ml-16 ">
                            <div class="shadow-container p-5 rounded-3xl">
                                <div class="flex justify-center">
                                    <i class="fa-solid fa-circle-info text-red-500 pr-3 text-2xl"></i>
                                    <p class="font-semibold text-red-500 text-center mt-[3px] text-lg">Peringatan</p>
                                </div>
                                <p class="font-semibold text-base px-10">Sila Tambah stok bagi produk ini</p>
                                <table>
                                <thead>
                                    <tr>
                                        <th class="w-[5%] text-[#b3b3b3] border-b-2 font-medium" >No.</th>
                                        <th class="w-[60%] text-[#b3b3b3] border-b-2 font-medium">Nama Produk</th>
                                        <th class="w-[5%] text-[#b3b3b3] border-b-2 font-medium">Kuantiti</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(itemInfo, index) in item" :key="item.idItem">
                                        <td class="w-[5%] text-slate-500 border-b-2 font-medium py-2" >{{ index+1 }}</td>
                                        <td class="w-[60%] text-slate-500 border-b-2 font-medium text-center" >{{ itemInfo.name }}</td>
                                        <td class="w-[5%] text-slate-500 border-b-2 font-medium text-center select-none">{{ itemInfo.quantity }}</td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                    </div>
                <div class="w-3/5 grid grid-cols-2 gap-10 mx-auto text-center max-md:block max-md:w-2/3">
                    <Process class="hover:text-black" to="/manager/managermanageinventory" text="Urus Inventori" icon="fa-solid fa-boxes-stacked"/>
                    <Process class="hover:text-black" to="/manager/managershowstock" text="Papar Stok" icon="fa-solid fa-circle-info"/>
                    <Process class="hover:text-black" to="/manager/registerworker" text="Daftar Pekerja" icon="fa-solid fa-file-circle-plus"/>
                    <Process class="hover:text-black" to="/manager/listworker" text="Senarai Pekerja" icon="fa-solid fa-pen-to-square"/>
                </div>
            </div>
                <div class="flex mt-20 justify-evenly max-md:block max-md:w-96 max-md:mx-auto max-sm:mx-auto">
                <div class= "rounded-2xl p-5 shadow-container w-5/12 max-md:px-12 max-md:w-8/12 max-md:mx-11">
                    <p class="pb-4 text-center font-semibold ">Pekerja</p>
                    <div v-for="worker in worker" :key="worker.idWorker">
                        <div class="flex justify-between p-5 max-md:block">
                            <img class="w-1/12 max-md:hidden max-lg:hidden max-xl:hidden" src="../../assets/worker.png" alt="">
                            <p class="text-sm ml-5">{{ worker.name }}</p>
                            <p class="text-sm">{{ worker.phoneNumber }}</p>
                        </div>
                    </div>
                </div>
                <div class="rounded-2xl p-5 shadow-container w-5/12 max-md:px-12 max-md:w-8/12 max-md:mt-5 max-md:mx-11">
                    <p class="pb-4 text-center font-semibold">Pengurus</p>
                    <div v-for="manager in manager" :key="manager.idManager">
                        <div class="flex justify-between p-5 max-md:block ">
                            <img class="w-1/12 max-md:hidden max-lg:hidden max-xl:hidden" src="../../assets/manager.png" alt="">
                            <p class="text-sm ml-5">{{ manager.name }}</p>
                            <p class="text-sm">{{ manager.phoneNumber }}</p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default
{
    data()
    {
        return{
            worker:[],
            manager:[],
            item:[],
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
        axios.get("http://localhost:3000/item/notification")
        .then(response=>{
            this.item = response.data
            console.log(this.item)
        })
        .catch(error=>console.log(error))
    },
    methods()
    {

    }
}
</script>