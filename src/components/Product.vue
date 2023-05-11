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
        <div class="bg-teal-500 text-white w-48  rounded-2xl p-1 ease-in-out duration-500 hover:scale-110">
            <div class="bg-white py-5 rounded-xl  h-44">
                <img class="mx-auto" v-bind:src="src" alt="">
            </div>
             <div class="p-2">
                {{text}}
            </div>
        </div>
    </RouterLink>
</template>



