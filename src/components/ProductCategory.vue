<script setup>
import { RouterLink } from 'vue-router';

const props = defineProps ({
    to:String,
    text:String,
    src:String
})

</script>

<template>
    <RouterLink  v-bind:to="to">
        <div class="bg-teal-500 text-white w-full rounded-2xl p-1 shadow-product ease-in-out duration-500 hover:scale-110 hover:shadow-category">
            <div class="bg-white py-5 rounded-xl max-xl:h-10/12">
                <img class="mx-auto" v-bind:src="src" alt="">
            </div>
             <div class="p-2 text-sm font-semibold max-lg:text-xs max-sm:p-0 max-sm:py-2">
                {{text}}
            </div>
        </div>
    </RouterLink>
</template>



<style>

</style>