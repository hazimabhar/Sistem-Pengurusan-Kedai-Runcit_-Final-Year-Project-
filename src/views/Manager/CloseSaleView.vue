<script setup>
import { ref } from '@vue/reactivity';
import ManagerNavBar from '../../components/ManagerNavBar.vue';

document.title="Tutup Jualan"

const isOpen = ref(false)

function toggleDialog()
{
    isOpen.value=!isOpen.value;
}

</script>

<template>
  <div >
    <ManagerNavBar/>
    <div class="bg-slate-100 min-h-screen max-md:bg-white max-lg:bg-white ">
        <div>
            <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">
                Hasil Jualan Hazim
            </p>
        </div>
            <div class="w-9/12 mx-auto mr-16 bg-white max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/manager" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <li>Tutup Jualan</li>
                </ul>
                <div class="text-center relative">
                    <button class=" bg-black text-white p-5 rounded-2xl hover:bg-red-600 hover:scale-125" @click="toggleDialog()" >Tutup Jualan</button>
                </div>
                <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
                <dialog class="w-4/5 mx-auto shadow-product rounded-2xl outline absolute top-44 z-50" v-bind:open="isOpen">
                    <form method="dialog" class="max-sm:text-xs max-md:text-sm">
                        <div class="flex justify-between p-5">
                            <p>Hasil Jualan</p>
                            <p>MYR88.88</p>
                        </div>
                        <div class="flex justify-between p-5">
                            <p>Pembayaran dalam Talian</p>
                            <p>MYR88.88</p>
                        </div>
                        <div class="flex justify-between p-5">
                            <p>Pembayaran Tunai</p>
                            <p>MYR88.88</p>
                        </div>
                        <div class="flex justify-between p-5">
                            <p>Jumlah Wang Tunai</p>
                            <p>MYR88.88</p>
                        </div>
                        <div class="flex justify-between p-5">
                            <p>Tarikh</p>
                            <p>12.12.12</p>
                        </div>
                        <div class="w-max mx-auto">
                            <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="toggleDialog()">Sah</button>
                        </div>
                    </form>
                </dialog>
            </div>
        </div>
  </div>
</template>
