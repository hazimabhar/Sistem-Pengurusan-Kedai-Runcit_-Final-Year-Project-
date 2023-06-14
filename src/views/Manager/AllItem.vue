<script setup>
import MyButton from '../../components/MyButton.vue';
import { RouterLink } from 'vue-router';
import ManagerNavBar from '../../components/ManagerNavBar.vue';
import { ref } from 'vue';

const imageUrl = ref(null);

document.title="List Product";
</script>
<template>
  <div>
    <ManagerNavBar/>
    <div class="bg-slate-100 min-h-screen max-md:bg-white ">
        <div>
            <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Daftar Produk</p>
        </div>
            <div class="w-9/12  min-h-screen mx-auto mr-16 bg-white max-lg:w-11/12 max-lg:mx-auto max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/manager" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <RouterLink to="/manager/managershowstock" class="text-blue-500 hover:underline">Urus Stok</RouterLink> 
                    <span class="px-2">></span>
                    <li>Senarai Semua Produk</li>
                </ul>
                <div class="w-full px-10 max-sm:p-0">
                    <p class=" text-xl font-semibold mb-4">Senarai Produk</p>
                    <table>
                            <thead class="bg-teal-500 text-sm text-white">
                                <tr>
                                    <th class="w-[5%]   font-semibold py-2 px-2 rounded-l-2xl" >No.</th>
                                    <th class="w-[60%] font-semibold">Nama Produk</th>
                                    <th class="w-[5%]  font-semibold">Kuantiti</th>
                                    <th class="w-[15%] font-semibold py-2 px-2 rounded-r-2xl">Harga</th>
                                </tr>
                            </thead>
                            <tbody>
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
</template>
<script>
import axios from 'axios';

export default
{
    data()
    {
        return {

            item:[]
        }
    },
    mounted()
    {
        axios.get("http://localhost:3000/item")
        .then(response=>
        {
            this.item = response.data
            console.log(this.item)
        })
        .catch(error=>console.log(error))

    }
}
</script>