<script setup>
import { RouterLink } from 'vue-router';
import {
    Disclosure,
    DisclosureButton,
    DisclosurePanel
  } from '@headlessui/vue';
  import { ref } from 'vue';


  const isOpen = ref(false)

    const navItems = [
        {link:"/manageinventory", label: "Urus Inventori", children: [
            {link:"/manager/managermanageinventory/add", label:"Tambah Stok", children:[], icon:null},
            {link:"/manager/managermanageinventory/delete", label:"Buang Produk", children:[], icon:null},
            {link:"/manager/registerproduct", label:"Daftar Produk", children:[], icon:null},
            {link:"/manager/managermanageinventory/update", label:"Kemaskini Maklumat", children:[], icon:null},            
        ], icon:null},
        {link:"/showstock", label: "Kategori", children:[
            {link:"/manager/managerlistitem/can", label:"Tin", children:[], icon:null},
            {link:"/manager/managerlistitem/detergent", label:"Sabun", children:[], icon:null}, 
            {link:"/manager/managerlistitem/drink", label:"Minuman", children:[], icon:null},
            {link:"/manager/managerlistitem/spice", label:"Rempah", children:[], icon:null},
            {link:"/manager/managerlistitem/bread", label:"Roti", children:[], icon:null},
            {link:"/manager/managerlistitem/sauce", label:"Sos dan Kicap", children:[], icon:null},
            {link:"/manager/managerlistitem/food", label:"Makanan", children:[], icon:null},
            {link:"/manager/managerlistitem/tool", label:"Alatan", children:[], icon:null},
        ]},
        {link:"/manager/registerworker", label:"Daftar Pekerja", children:[], icon:null},
        {link:"/manager/listworker", label:"Senarai Pekerja", children:[], icon:null},
        {link:"/manager/report", label:"Senarai Laporan", children:[], icon:null},

    ]

    function toggleDialog()
    {
        isOpen.value = !isOpen.value; // Toggle the isOpen property
    }
</script>

<template>
        <div class="fixed mt-3 h-full w-64 shadow-container bg-white" v-show="!isClose">
        <nav class="pt-5">
            <!-- buat for loop untuk item dalam array -->
            <template v-for="item in navItems">
                <RouterLink v-if="!item.children.length" class="flex py-2 px-8 hover:bg-slate-100" :to="item.link" v-bind:key="item.label">{{item.label}}</RouterLink>
                <template v-else>
                <Disclosure :key="item.label" v-slot="{open}">
                    <div class="hover:bg-slate-100 pl-1">
                        <DisclosureButton class="flex py-2 mx-8">
                            {{item.label}}
                            <img class="absolute ml-44 mt-2" :class="[open? '-rotate-90' :'']" src="../assets/left-arrow.png" alt="">
                        </DisclosureButton>
                    </div>
                        <DisclosurePanel>
                        <!-- buat if statement jika item dalam array tersebut ada child  -->
                         <div v-if="item.children.length">
                            <RouterLink class="flex pl-12 py-1 hover:bg-slate-100 text-gray-500" v-for="child in item.children" :to="child.link" v-bind:key="child.label ">{{child.label}}</RouterLink>
                         </div>                   
                        </DisclosurePanel>
                </Disclosure>
            </template>
            </template>
            <div  class=" text-red-600 py-2 px-8 hover:bg-slate-100">
                <button class="relative" @click="toggleDialog">Log Keluar</button>
            </div>
        </nav>
    </div> 
    <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
        <dialog class="w-1/5 mx-auto shadow-product rounded-2xl  absolute top-44 z-50" v-bind:open="isOpen">
        <div class="">
            <div class="mb-5">
                <p class="font-semibold text-red-600 text-center text-xl">Log Keluar?</p>            
            </div>
            <div class="flex justify-evenly">
                <div>
                    <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="toggleDialog">Batal</button>
                </div>
                <div class="mt-[7px]">
                    <RouterLink class="w-max bg-red-600 text-white p-2 px-5 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black"  to="/login" onclick="sessionStorage.clear()">Log Keluar</RouterLink>
                </div>
            </div>
        </div>
    </dialog>
</template>
<script>
export default
{
    props:{
        isClose:
        {
            type:Boolean,
            required:true
        }
    }
}
</script>