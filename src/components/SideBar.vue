<script setup>
import { RouterLink } from 'vue-router';
import {
    Disclosure,
    DisclosureButton,
    DisclosurePanel
  } from '@headlessui/vue';



    const navItems = [
        {link:"/manageinventory", label: "Urus Inventori", children: [
            {link:"/manageinventory/add", label:"Tambah Stok", children:[], icon:null},
            {link:"/manageinventory/delete", label:"Buang Produk", children:[], icon:null},
            {link:"/registerProduct", label:"Daftar Produk", children:[], icon:null},
            {link:"/manageinventory/update", label:"Kemaskini Maklumat", children:[], icon:null},            
        ], icon:null},
        {link:"/showstock", label: "Kategori", children:[
            {link:"/listitem/can", label:"Tin", children:[], icon:null},
            {link:"/listitem/detergent", label:"Sabun", children:[], icon:null}, 
            {link:"/listitem/drink", label:"Minuman", children:[], icon:null},
            {link:"/listitem/spice", label:"Rempah", children:[], icon:null},
            {link:"/listitem/bread", label:"Roti", children:[], icon:null},
            {link:"/listitem/sauce", label:"Sos dan Kicap", children:[], icon:null},
            {link:"/listitem/food", label:"Makanan", children:[], icon:null},
            {link:"/listitem/tool", label:"Alatan", children:[], icon:null},
        ]},
        {link:"/cashier", label:"Juruwang", children:[], icon:"../assets/box.png"},
        {link:"/closesale", label:"Tutup Jualan", children:[], icon:null},
    ]
</script>

<template>
        <div class="fixed mt-3 h-full w-64 shadow-container bg-white">
        <nav class="pt-5">
            <!-- buat for loop untuk item dalam array -->
            <template v-for="item in navItems" :key="item.label">
                <RouterLink v-if="!item.children.length" class="flex py-2 px-8 hover:bg-slate-100" :to="item.link">{{item.label}}</RouterLink>
                <Disclosure v-else v-slot="{open}">
                    <div class="hover:bg-slate-100 pl-1">
                        <DisclosureButton class="flex py-2 mx-8">
                            {{item.label}}
                            <img class="absolute ml-44 mt-2" :class="[open? '-rotate-90' :'']" src="../assets/left-arrow.png" alt="">
                        </DisclosureButton>
                    </div>
                   <div>
                        <DisclosurePanel>
                        <!-- buat if statement jika item dalam array tersebut ada child  -->
                         <div v-if="item.children.length">
                            <RouterLink class="flex pl-12 py-1 hover:bg-slate-100 text-gray-500" v-for="child in item.children" :to="child.link" :key="child.label ">{{child.label}}</RouterLink>
                         </div>                   
                        </DisclosurePanel>
                   </div>
                </Disclosure>
            </template>
            <div  class=" text-red-600 py-2 px-8 hover:bg-slate-100">
                <RouterLink class="relative" to="/login">Log Keluar</RouterLink>
            </div>
        </nav>
    </div> 
</template>