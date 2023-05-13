<script setup>
import ManagerNavBar from '../../components/ManagerNavBar.vue';
import Process from '../../components/Process.vue';
import { RouterLink } from 'vue-router';
import { RouterView } from 'vue-router';

document.title="Manage Inventory"
</script>

<template>
    <div class="min-h-screen">
        <ManagerNavBar/>
        <div class="bg-slate-100 min-h-screen max-md:bg-white max-lg:bg-white ">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Urus Inventori Hazim</p>
            </div>
            <div class="w-9/12 mx-auto mr-16 bg-white max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/manager" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <li>Urus Inventori</li>
                </ul>
                <div class="w-4/5 grid grid-cols-4 gap-10 mx-auto text-center max-md:block max-md:w-60">
                    <Process class="hover:text-black " to="/manager/managermanageinventory/add" text="Tambah Stok" icon="fa-regular fa-square-plus"/>
                    <Process class="hover:text-black" to="/manager/managermanageinventory/delete" text="Buang Stok" icon="fa-regular fa-square-minus"/>
                    <Process class="hover:text-black" to="/manager/registerproduct" text="Daftar Produk" icon="fa-solid fa-file-circle-plus"/>
                    <Process class="hover:text-black " to="/manager/managermanageinventory/update" text="Kemaskini Maklumat" icon="fa-solid fa-pen-to-square"/>
                </div> 
                <div>
                    <RouterView/>
                </div>
            </div>
        </div>
    </div>

</template>
