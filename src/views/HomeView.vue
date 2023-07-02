<script setup>
import NavBar from '../components/NavBar.vue';
import Process from '../components/Process.vue';

document.title='Home Page'
</script>

<template>
    <div >
        <NavBar/>
        <div class="bg-slate-100 max-md:bg-white max-lg:bg-white">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-lg:w-4/5 max-sm:text-2xl max-sm:pb-2">Operasi</p>
            </div>
            <div class="w-9/12 mx-auto mr-16 bg-white pt-4 pb-4 max-lg:w-[100%] rounded-3xl ">
                <ul>
                    <li class="px-8 pb-10 max-lg:pl-20 max-sm:pl-10 max-sm:text-xs max-sm:pb-5">Laman Utama</li>
                </ul>
                <div class="flex max-lg:w-[90%] max-lg:mx-auto max-lg:gap-5 max-sm:block">
                    <div v-if="item && item.length>0" class="ml-16 max-lg:ml-0">
                            <div class="shadow-container p-5 rounded-3xl">
                                <div class="flex justify-center">
                                    <i class="fa-solid fa-circle-info text-red-500 pr-3 text-2xl"></i>
                                    <p class="font-semibold text-red-500 text-center mt-[3px] text-lg max-sm:text-base">Peringatan</p>
                                </div>
                                <p class="font-semibold text-center text-base px-10 max-sm:px-2">Sila Tambah stok bagi produk ini</p>
                                <table>
                                <thead>
                                    <tr>
                                        <th class="w-[5%] text-[#b3b3b3] border-b-2 font-medium " >No.</th>
                                        <th class="w-[60%] text-[#b3b3b3] border-b-2 font-medium ">Nama Produk</th>
                                        <th class="w-[5%] text-[#b3b3b3] border-b-2 font-medium ">Kuantiti</th>
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
                    <div class="w-1/2 grid grid-cols-2 gap-10 mx-auto text-center max-lg:w-2/3 max-lg:gap-5 max-sm:mt-8 max-sm:w-[95%] max-sm:gap-2">
                        <Process class="hover:text-black" to="/manageinventory" text="Urus Inventori" icon="fa-solid fa-boxes-stacked"/>
                        <Process class="hover:text-black" to="/showstock" text="Papar Stok" icon="fa-solid fa-circle-info"/>
                        <Process class="hover:text-black" to="/cashier" text="Juruwang" icon="fa-solid fa-cash-register"/>
                        <Process class="hover:text-black" to="/closesale" text="Tutup Jualan" icon="fa-sharp fa-solid fa-money-bills"/>
                    </div>
                </div>
            <div>
                <p class="lg:hidden font-bold w-1/2 mx-auto text-4xl pt-10 pb-2 max-lg:w-4/5 max-lg:text-2xl max-sm:text-2xl max-sm:pb-2">Senarai Pengguna</p>
            </div>
            <div class="flex mt-24 justify-evenly max-lg:mt-5 max-lg:w-[90%] max-lg:mx-auto max-sm:block ">
                <div class= "rounded-2xl p-5 shadow-container w-5/12 max-sm:w-[100%]">
                    <p class="pb-4 text-center font-semibold ">Pekerja</p>
                    <div v-for="worker in worker" :key="worker.idWorker">
                        <div class="flex justify-between p-5 ">
                            <img class="w-1/12" src="../assets/worker.png" alt="">
                            <p class="text-sm ml-5">{{ worker.name }}</p>
                            <p class="text-sm">{{ worker.phoneNumber }}</p>
                        </div>
                    </div>
                </div>
                <div class="rounded-2xl p-5 shadow-container w-5/12 max-sm:w-[100%] max-sm:mt-5">
                    <p class="pb-4 text-center font-semibold">Pengurus</p>
                    <div v-for="manager in manager" :key="manager.idManager">
                        <div class="flex justify-between p-5">
                            <img class="w-1/12" src="../assets/manager.png" alt="">
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
        axios.get("https://sistemkedairuncit.onrender.com/worker")
        .then(response=>{
            this.worker = response.data
            console.log(this.worker)
        })
        .catch(error=>console.log(error))

        axios.get("https://sistemkedairuncit.onrender.com/manager")
        .then(response=>{
            this.manager = response.data
            console.log(this.manager)
        })
        .catch(error=>console.log(error))
        axios.get("https://sistemkedairuncit.onrender.com/item/notification")
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