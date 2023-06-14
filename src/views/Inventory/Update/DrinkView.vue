<script>
import { ref } from 'vue';
import axios from 'axios';

export default {

    data()
    {
        return {
            item: [],
            isOpen: false,
            selectedItem: null,
            updateId:""
        }
    },
    mounted(){
        axios.get('https://sistemkedairuncit.onrender.com/item/drink')
        .then(response=> {
            this.item = response.data
            console.log(response)
        })
        .catch(error=> console.log(error))
    },
    methods: {
        toggleDialog(item) {
            this.selectedItem = item;
            this.updateId=this.selectedItem.idItem
            this.isOpen = !this.isOpen; // Toggle the isOpen property
        }
    }
}
</script>

<template>
    <div class="w-10/12 grid grid-cols-5 gap-10 mx-auto text-center max-md:block max-md:w-60" >
      <RouterLink to="" v-for="item in item" v-bind:key="item.idItem" @click="toggleDialog(item)">
          <div class="bg-teal-500 text-white w-48  rounded-2xl p-1 ease-in-out duration-500 hover:scale-110">
              <div class="bg-white py-5 rounded-xl  h-44">
                <img class="mx-auto h-[100%]" :src="item.image" alt="Produk">
              </div>
               <div class="p-2">
                  {{item.name}}
              </div>
          </div>
      </RouterLink>
      <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
      <dialog class="w-1/4 mx-auto shadow-product rounded-2xl  absolute top-44 z-50" v-bind:open="isOpen">
          <div class=""  v-if="selectedItem">
              <div class="py-5 rounded-xl  border-solid border-2 border-teal-500">
                <img class="mx-auto w-[45%]" :src="selectedItem.image" alt="Produk">
              </div>
              <div class="py-2" >
                  <div class="flex justify-between p-5">
                  <div class="">
                      <p>Nama Produk</p>
                      <p>Harga Produk</p>
                      <p>Berat Produk</p>
                      <p>Kuantiti Produk</p>
                      <p>Kategori</p>
                      <p>Barkod Produk</p>
                  </div>
                  <div class="">
                      <p>{{selectedItem.name}}</p>
                      <p>RM {{selectedItem.price}}</p>
                      <p>{{selectedItem.weight}} {{selectedItem.unit}}</p>
                      <p>{{selectedItem.quantity}}</p>
                      <p>{{selectedItem.category}}</p>
                      <p>{{selectedItem.barcode}}</p>
                  </div>
                  </div>
              </div>
              <div class="flex justify-evenly">
                <div>
                    <button class="w-max bg-red-600 text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="toggleDialog">Batal</button>
                </div>
                <div class="mt-[7px]">
                    <RouterLink  v-bind:to="`/updateproduct/`+updateId" class="w-max bg-blue-600 text-white p-2 px-5 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " >Kemaskini</RouterLink>
                </div>
            </div>
          </div>
      </dialog>
    </div>
  </template>