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
        <input class=" bg-white py-1 px-5 pr-80 rounded-3xl focus:outline-emerald-700 shadow-input max-md:pr-0 max-md:m-0" v-bind:placeholder="placeholder" v-model="value" v-bind:type="type" v-bind:id="id"><br>
</template>
