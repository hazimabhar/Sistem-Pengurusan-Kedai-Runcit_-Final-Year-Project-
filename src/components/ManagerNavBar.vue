<script setup>
import MySearch from './MySearch.vue';
import MyLabel from './MyLabel.vue';
import ManagerSideBar from './ManagerSideBar.vue';
import { RouterLink } from 'vue-router';
import { isCoreComponent } from '@vue/compiler-core';

</script>

<template>
    <div class="fixed py-3 w-full bg-teal-500 select-none z-10" >
        <div class="max-sm:w-full" >
            <div class="flex pl-5">
                <div id="icon" class="py-2 px-2  max-lg:mr-10 " @click="closeOpenSideBar()">
                    <i class="fa-solid fa-bars cursor-pointer text-white hover:text-black max-lg:hover:text-white"></i>
                </div>
                <div class="text-lg pt-2 ml-[650px] mr-[550px] max-sm:mx-[30px]  max-lg:ml-[245px] max-lg:mr-[200px]">
                    <RouterLink class="font-semibold" to="/manager">Sistem Kedai Runcit</RouterLink>
                </div>
                <div>
                    <p class="font-semibold mt-2 max-sm:hidden">Pengurus</p>
                </div>
            </div>
        </div>
        <ManagerSideBar id="sidebar" v-bind:is-close="openSideBar"/>
    </div>

         
</template>

<script>
    export default
    {
        data()
    {
        return {
            openSideBar:false
        }
    },
        methods:
        {
            closeOpenSideBar()
            {
                this.openSideBar = !this.openSideBar
            }
        }
    }
</script>

<style>

</style>

