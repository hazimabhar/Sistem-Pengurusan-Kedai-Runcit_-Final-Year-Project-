<script setup>
import MySearch from './MySearch.vue';
import MyLabel from './MyLabel.vue';
import ManagerSideBar from './ManagerSideBar.vue';
import { RouterLink } from 'vue-router';
import { isCoreComponent } from '@vue/compiler-core';

</script>

<template>
    <div class="fixed py-3 w-full bg-teal-500 select-none z-10" >
        <div class="flex max-sm:w-2/3" >
            <div class="flex pl-5">
                <div id="icon" class="py-2 px-2" @click="closeOpenSideBar()">
                    <i class="fa-solid fa-bars cursor-pointer text-white hover:text-black max-lg:hover:text-white"></i>
                </div>
                <div class="text-lg pt-2 px-2">
                    <RouterLink class="font-semibold max-lg:hidden" to="/manager">Kedai Runcit Azzain</RouterLink>
                </div>
            </div>
            <div class="mx-auto pt-1 max-sm:ml-10">
                <MySearch placeholder="Carian..." value="" type="text" id="carian"/>
            </div>
            <div class="pr-32">
                <RouterLink to="/home"><i class="fa-solid fa-house text-white text-2xl lg:hidden max-sm:pl-28 max-md:pt-1 max-lg:pt-1 "></i></RouterLink>
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

