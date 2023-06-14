<script setup>
import ManagerNavBar from '../../components/ManagerNavBar.vue';
import { RouterLink } from 'vue-router';
import ProductCategory from '../../components/ProductCategory.vue';

document.title="Laporan Jualan"

</script>

<template>
  <div>
    <ManagerNavBar/>
    <div class="bg-slate-100 min-h-screen max-md:bg-white max-lg:bg-white ">
      <div>
        <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl">Papar Laporan Hazim</p>
      </div>
        <div class="w-9/12 mx-auto mr-16 bg-white max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
          <ul class="inline-flex list-none px-8 pb-10">
            <RouterLink to="/manager" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
            <span class="px-2">></span>
            <li>Laporan Jualan</li>
          </ul>
          <p class=" max-sm:ml-6 w-3/4 mx-8  text-xl font-semibold pb-4 max-md:text-xl max-md:pt-3 max-md:pb-2 max-md:w-full max-md:mx-0">Senarai Laporan Jualan</p>
          <div class="w-10/12 grid grid-cols-5 gap-32 mx-auto text-center max-md:block max-md:w-60" >
          <a :href="report.filePath" target="blank" v-for="report in report" v-bind:key="report.idReport">
            <div class="bg-teal-500 text-white w-48  rounded-2xl p-1 ease-in-out duration-500 hover:scale-110">
                <div class="bg-white py-5 rounded-xl  h-44">
                    <img class="mx-auto h-[100%]" src="/report.svg" alt="Produk">
                </div>
                <div class="p-2">
                    <a :href="report.filePath">{{report.fileName.substring(13, 23)}}</a>
                </div>
            </div>
        </a>
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
            report:[],
        }
    },
    mounted()
    {
        axios.get("https://sistemkedairuncit.onrender.com/allreport")
        .then(response=>{
            this.report = response.data
            console.log(this.report)
        })
        .catch(error=>console.log(error))
    },
}
</script>