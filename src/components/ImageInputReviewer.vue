<template>
    <div>
      <label class=" cursor-pointer bg-black text-white p-4 rounded-lg hover:text-black hover:bg-white hover:outline hover:outline-black" for="image-input">
        Pilih Gambar <i class="fa-solid fa-image"></i>
        <input class="hidden " type="file" accept="image/*" id="image-input" @change="handleImageChange">
      </label>
      <div class="outline-dotted outline-gray-400 w-64 h-auto mt-10">
        <img :src="imageUrl" v-if="imageUrl" alt="Preview" class="">
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        imageUrl: null
      }
    },
    methods: {
      handleImageChange(event) {
        const file = event.target.files[0]
        const reader = new FileReader()
  
        reader.onload = () => {
          this.imageUrl = reader.result
        }
  
        reader.readAsDataURL(file)
      },
  }
}

  </script>