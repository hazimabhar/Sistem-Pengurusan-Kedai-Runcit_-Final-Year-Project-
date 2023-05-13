<script setup>
import NavBar from '../components/NavBar.vue';
import { RouterLink } from 'vue-router';
import ProductCategory from '../components/ProductCategory.vue';
import Process from '../components/Process.vue';

document.title="Papar Stok"

</script>

<template>
  <div>
    <NavBar/>
    <div class="bg-slate-100 min-h-screen max-md:bg-white max-lg:bg-white ">
      <div>
        <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl">Papar Stok</p>
      </div>
        <div class="w-9/12 mx-auto mr-16 bg-white max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
          <ul class="inline-flex list-none px-8 pb-10">
            <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
            <span class="px-2">></span>
            <li>Urus Stok</li>
          </ul>
        <div class="w-11/12 grid grid-cols-4 gap-10 mx-auto text-center max-xl:gap-5 max-lg:gap-2 max-sm:grid-cols-3">
            <ProductCategory to="/listitem/can" text="Tin" src="/can.svg"/>
            <ProductCategory to="/listitem/detergent" text="Sabun" src="/detergent.svg"/>
            <ProductCategory to="/listitem/drink" text="Minuman" src="/drink.svg"/>
            <ProductCategory to="/listitem/spice" text="Rempah" src="/spice.svg"/>
            <ProductCategory to="/listitem/bread" text="Roti" src="/bread.svg"/>
            <ProductCategory to="/listitem/sauce" text="Sos dan Kicap" src="/sauce.svg"/>
            <ProductCategory to="/listitem/food" text="Makanan" src="/food.svg"/>
            <ProductCategory to="/listitem/tool" text="Alatan" src="/broom.svg"/>
        </div>
        </div>
    </div>
  </div>
</template>
