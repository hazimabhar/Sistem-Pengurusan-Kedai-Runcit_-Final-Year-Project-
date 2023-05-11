<script setup>
const props = defineProps({
  txt: String,
})
</script>
<template>
    <button class="bg-black text-white rounded-3xl py-2 px-16 mt-6 hover:outline hover:outline-black  hover:bg-white hover:text-black">{{txt}}</button>
</template>