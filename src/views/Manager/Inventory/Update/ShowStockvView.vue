<script setup>
import { RouterLink } from 'vue-router';
import ProductCategory from '../../../components/ProductCategory.vue';
import { RouterView } from 'vue-router';


</script>

<template>
  <div>
    <NavBar/>
    <div>
        <div class="w-4/5 mx-auto max-md:w-full">
        <div>
            <p class="font-medium w-3/4 mx-8 text-2xl pt-10 pb-8 max-md:text-xl max-md:pt-3 max-md:pb-2 max-md:w-full max-md:mx-0">Pilih Kategori Produk</p>
        </div>
        <div class="w-full grid grid-cols-8 gap-2 mx-auto text-center text-sm max-lg:grid-cols-4 max-md:grid-cols-2">
          <RouterLink to="/manageinventory/update/can" class="bg-teal-500 text-white rounded-lg py-2 hover:text-black text-xs"><i class="fa-solid fa-drum-steelpan text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Tin</RouterLink>
          <RouterLink to="/manageinventory/update/detergent" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black"><i class="fa-solid fa-jug-detergent text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Sabun</RouterLink>
          <RouterLink to="/manageinventory/update/drink" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black"><i class="fa-solid fa-bottle-water text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Minuman</RouterLink>
          <RouterLink to="/manageinventory/update/spice" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black"><i class="fa-solid fa-mortar-pestle text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Rempah</RouterLink>
          <RouterLink to="/manageinventory/update/bread" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black"><i class="fa-solid fa-bread-slice text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Roti</RouterLink>
          <RouterLink to="/manageinventory/update/sauce" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black"><i class="fa-solid fa-wine-bottle text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Sos</RouterLink>
          <RouterLink to="/manageinventory/update/food" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black"><i class="fa-solid fa-pizza-slice text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Makanan</RouterLink>
          <RouterLink to="/manageinventory/update/tool" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black"><i class="fa-solid fa-broom text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Alatan</RouterLink>
        </div>
        </div>
        <div class="mt-5">
          <RouterView/>
        </div>
    </div>
  </div>
</template>
