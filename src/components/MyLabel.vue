<script setup>
    const props = defineProps (
        {
            text: String,
        }
    )
</script>
<template>
    <label class="font-medium">{{text}}</label> <br>
</template>