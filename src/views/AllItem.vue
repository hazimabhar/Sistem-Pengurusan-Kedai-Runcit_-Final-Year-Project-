<script setup>
import MyButton from '../components/MyButton.vue';
import { RouterLink } from 'vue-router';
import NavBar from '../components/NavBar.vue';
import { ref } from 'vue';

const imageUrl = ref(null);

document.title="List Product";
</script>
<template>
  <div>
    <NavBar/>
    <div class="bg-slate-100 min-h-screen max-lg:bg-white ">
        <div>
            <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8  max-lg:w-4/5 max-sm:text-2xl max-sm:pb-2 ">Senarai Semua Barangan</p>
        </div>
        <div class="w-9/12 min-h-screen mx-auto mr-16 bg-white max-lg:w-[100%] rounded-3xl p-5 max-sm:pt-4">
                <ul class="inline-flex list-nonepx-8 pb-10 max-lg:pl-14 max-sm:pl-5 max-sm:text-[10px] max-sm:pb-5 max-sm:w-full">
                    <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2 ">></span>
                    <RouterLink to="/showstock" class="text-blue-500 hover:underline ">Urus Stok</RouterLink> 
                    <span class="px-2">></span>
                    <li>Senarai Semua Produk</li>
                </ul>
                <div class="w-full px-10 max-lg:px-14 max-sm:px-5">
                    <p class=" text-xl font-semibold mb-4 max-sm:text-lg">Senarai Produk</p>
                    <table>
                            <thead class="bg-teal-500 text-sm text-white max-sm:text-xs">
                                <tr>
                                    <th class="w-1/12 max-sm:w-1/6  font-semibold py-2 px-2 rounded-l-2xl" >No.</th>
                                    <th class="w-6/12 max-sm:w-4/6 font-semibold">Nama Produk</th>
                                    <th class="w-1/12 max-sm:w-1/6 font-semibold">Kuantiti</th>
                                    <th class="w-3/12 max-sm:w-1/6 font-semibold py-2 px-2 rounded-r-2xl">Harga</th>
                                </tr>
                            </thead>
                            <tbody class="max-sm:text-xs">
                                <tr v-for="(item, index) in item" v-bind:key="item.idItem">
                                    <td class="w-[5%] border-b-2 text-slate-500 font-medium py-2 text-center" >{{ index+1 }}</td>
                                    <td class="w-[60%] border-b-2 text-slate-500 font-medium text-center" >{{ item.name }}</td>
                                    <td class="w-[5%] border-b-2 text-slate-500 font-medium text-center select-none">{{ item.quantity }}</td>
                                    <td class="text-slate-500  border-b-2 font-medium text-center" >RM {{  (parseFloat(item.price)).toFixed(2) }}</td>
                                </tr>
                            </tbody>
                    </table>
                </div>
            </div>
        </div>
</div>
<div v-if="loading" class="fixed inset-0 flex items-center bg-black bg-opacity-50 justify-center z-50">
    <div class="loader-wrapper">
         <div class="loader animate-spin rounded-full border-t-4 border-b-4 border-gray-200 h-12 w-12"></div>
    </div>
</div>
</template>
<script>
import axios from 'axios';

export default
{
    data()
    {
        return {

            item:[],
            loading : false,
            
        }
    },
    mounted()
    {
        this.loadData()
   
    },
    methods:
    {
        loadData()
        {
            this.loading=true
            axios.get("https://sistemkedairuncit.onrender.com/item")
            .then(response=>
            {
                this.item = response.data
                console.log(this.item)
            })
            .catch(error=>console.log(error))
            .finally(()=>{
                this.loading = false
            })
        }

    }
}
</script>