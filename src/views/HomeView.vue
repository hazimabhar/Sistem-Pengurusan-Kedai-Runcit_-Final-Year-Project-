<script setup>
import NavBar from '../components/NavBar.vue';
import Process from '../components/Process.vue';

document.title='Home Page'
</script>

<template>
    <div >
        <NavBar/>
        <div class="bg-slate-100 max-md:bg-white max-lg:bg-white">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Operasi</p>
            </div>
            <div class="w-9/12 mx-auto mr-16 bg-white pt-4 max-sm:w-11/12 max-sm:mx-auto rounded-3xl">
                <ul>
                    <li class="px-8 pb-10">Laman Utama</li>
                </ul>
                <div class="w-3/5 grid grid-cols-2 gap-10 mx-auto text-center max-md:block max-md:w-2/3">
                    <Process class="hover:text-black" to="/manageinventory" text="Urus Inventori" icon="fa-solid fa-boxes-stacked"/>
                    <Process class="hover:text-black" to="/showstock" text="Papar Stok" icon="fa-solid fa-circle-info"/>
                    <Process class="hover:text-black" to="/cashier" text="Juruwang" icon="fa-solid fa-cash-register"/>
                    <Process class="hover:text-black" to="/closesale" text="Tutup Jualan" icon="fa-sharp fa-solid fa-money-bills"/>
                </div>
            <div class="flex mt-20 justify-evenly max-md:block max-md:w-96 max-md:mx-auto max-sm:mx-auto">
                <div class= "rounded-2xl p-5 shadow-container w-5/12 max-md:px-12 max-md:w-8/12 max-md:mx-11">
                    <p class="pb-4 text-center font-semibold ">Pekerja</p>
                    <div class="flex justify-evenly p-5 max-md:block">
                        <img class="w-1/12 max-md:hidden max-lg:hidden max-xl:hidden" src="../assets/worker.png" alt="">
                        <p>Nama Pekerja</p>
                        <p>888-88888888</p>
                    </div>
                    <div class="flex justify-evenly p-5 max-md:block ">
                        <img class="w-1/12 max-md:hidden max-lg:hidden max-xl:hidden" src="../assets/worker.png" alt="">
                        <p>Nama Pekerja</p>
                        <p>888-88888888</p>
                    </div>
                    <div class="flex justify-evenly p-5 max-md:block ">
                        <img class="w-1/12 max-md:hidden max-lg:hidden max-xl:hidden" src="../assets/worker.png" alt="">
                        <p>Nama Pekerja</p>
                        <p>888-88888888</p>
                    </div>
                </div>
                <div class="rounded-2xl p-5 shadow-container w-5/12 max-md:px-12 max-md:w-8/12 max-md:mt-5 max-md:mx-11">
                    <p class="pb-4 text-center font-semibold">Pengurus</p>
                    <div class="flex justify-evenly p-5 max-md:block ">
                        <img class="w-1/12 max-md:hidden max-lg:hidden max-xl:hidden" src="../assets/manager.png" alt="">
                        <p class="max-md:w-36">Nama Pengurus</p>
                        <p >888-88888888</p>
                    </div>
                </div>
            </div>
            </div>
   

        </div>
      
    </div>
</template>