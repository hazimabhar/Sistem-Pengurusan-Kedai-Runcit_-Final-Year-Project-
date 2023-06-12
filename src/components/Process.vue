<script setup>
import { RouterLink } from 'vue-router';

const props = defineProps({
    to: String,
    text: String,
    icon: String
})
</script>

<template>
    <RouterLink class="border-2 text-white bg-teal-500 px-3 py-5 hover:opacity-90 rounded-2xl max-md:block max-md:mb-5 max-md:mx-auto max-md:w-full focus:text-black" v-bind:to="to">
        <div>
            <i class="text-5xl max-lg:text-3xl " v-bind:class="icon"></i>
            <div class="pt-5 max-lg:text-sm">{{text}}</div>
        </div>
    </RouterLink>
</template>


