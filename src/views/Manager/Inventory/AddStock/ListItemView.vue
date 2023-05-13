<script setup>
import ProductVue from '../../../../components/Product.vue';
import { RouterView } from 'vue-router';
document.title="Senarai Produk"
</script>

<template>
  <div>
    <NavBar/>
    <div class="max-md:px-24">
            <div class="w-4/5 mx-auto">
                <div>
                    <p class="font-bold w-3/4 mx-auto text-4xl pt-8 pb-10 max-md:text-3xl">Senarai Barang</p>
                </div>
                <div class="w-4/5 mx-auto">
                    <p class="font-medium w-4/5 mx-auto text-xl pt-2 pb-10 max-md:text-3xl">Sila Pilih Produk</p>
                </div>
                <RouterView/>
            </div>
        </div>    
  </div>
</template>
