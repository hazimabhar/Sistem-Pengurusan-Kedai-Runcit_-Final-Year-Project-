<script setup>
import MyLabel from '../components/MyLabel.vue';
import NavBar from '../components/NavBar.vue';
import Process from '../components/Process.vue';
import { RouterLink } from 'vue-router';
import { RouterView } from 'vue-router';

document.title="Manage Inventory"
</script>

<template>
    <div class="min-h-screen">
        <NavBar/>
        <div class="bg-slate-100 min-h-screen max-md:bg-white max-lg:bg-white ">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-lg:w-4/5 max-sm:text-2xl max-sm:pb-2 ">Urus Inventori</p>
            </div>
            <div class="w-9/12 min-h-screen mx-auto mr-16 bg-white max-lg:w-[100%] rounded-3xl p-5 max-sm:pt-4">
                <ul class="inline-flex list-nonepx-8 pb-10 max-lg:pl-20 max-sm:pl-5 max-sm:text-xs max-sm:pb-5">
                    <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <li>Urus Inventori</li>
                </ul>
                <div class="w-4/5 grid grid-cols-4 gap-10 mx-auto text-center max-lg:grid-cols-2 max-lg:gap-5 max-sm:w-[100%] max-sm:gap-2">
                    <Process class="hover:text-black " to="/manageinventory/add" text="Tambah Stok" icon="fa-regular fa-square-plus"/>
                    <Process class="hover:text-black" to="/manageinventory/delete" text="Buang Produk" icon="fa-regular fa-square-minus"/>
                    <Process class="hover:text-black" to="/registerproduct" text="Daftar Produk" icon="fa-solid fa-file-circle-plus"/>
                    <Process class="hover:text-black " to="/manageinventory/update" text="Kemaskini Maklumat" icon="fa-solid fa-pen-to-square"/>
                </div> 
                <div>
                    <RouterView/>
                </div>
            </div>
        </div>
    </div>

</template>
