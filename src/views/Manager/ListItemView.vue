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
            <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl">Senarai Barang</p>
        </div>
            <div class="w-9/12 mx-auto mr-16 bg-white max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <RouterLink to="/showstock" class="text-blue-500 hover:underline">Urus Stok</RouterLink> 
                    <span class="px-2">></span>
                    <li>Produk</li>
                </ul>
                <div class="w-11/12 mx-auto">
                    <p class="font-medium text-xl pb-10 max-md:text-3xl">Sila Pilih Produk</p>
                </div>
                <RouterView/>
            </div>
        </div>    
  </div>
</template>
