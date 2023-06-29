<script setup>
import NavBar from '../components/NavBar.vue';
import Product from '../components/Product.vue';
import { RouterView } from 'vue-router';
document.title="Senarai Produk"
</script>

<template>
  <div>
    <NavBar/>
    <div class="bg-slate-100 min-h-screen max-md:bg-white max-lg:bg-white ">
        <div>
            <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8  max-lg:w-4/5 max-sm:text-2xl max-sm:pb-2 ">Senarai Barang</p>
        </div>
        <div class="w-9/12 min-h-screen mx-auto mr-16 bg-white max-lg:w-[100%] rounded-3xl p-5 max-sm:pt-4">
          <ul class="inline-flex list-nonepx-8 pb-10 max-lg:pl-14 max-sm:pl-5 max-sm:text-xs max-sm:pb-5">
                    <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <RouterLink to="/showstock" class="text-blue-500 hover:underline">Urus Stok</RouterLink> 
                    <span class="px-2">></span>
                    <li>Produk</li>
                </ul>
                <div class="w-11/12 mx-auto max-lg:ml-14 max-sm:ml-5">
                    <p class="font-medium text-xl pb-10 max-lg:pb-5 max-sm:text-base max-sm:">Sila Pilih Produk</p>
                </div>
                <RouterView/>
            </div>
        </div>    
  </div>
</template>
