<script setup>
import { ref } from 'vue';
const props = defineProps({
        placeholder : String,
        type : String,
        id : String, 
        datanext: String,
        databefore: String
    })
  const value = ref('')
</script>

<template>
    <input class="mt-2 mb-4 ml-1 bg-gray-300 w-1/12 p-3 px-4 rounded-xl focus:outline-emerald-700 shadow-input" v-bind:placeholder="placeholder" v-model="value" v-bind:type="type" v-bind:id="id" v-bind:datanext="datanext" v-bind:databefore="databefore">
</template>