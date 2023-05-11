<script setup>
import { ref } from 'vue';
const props = defineProps({
        placeholder : String,
        type : String,
        id : String 
    })
  const value = ref('')
</script>

<template>
    <input class="mt-2 mb-4 bg-gray-300 w-full p-3 rounded-xl focus:outline-emerald-700 shadow-input" v-bind:placeholder="placeholder" v-model="value" v-bind:type="type" v-bind:id="id" ><br>
</template>