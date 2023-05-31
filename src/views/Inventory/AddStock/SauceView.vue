<script>
import { ref } from 'vue';
import axios from 'axios';

import ToastMessageVue from "../../../components/ToastMessage.vue";

export default {
    components: {
    ToastMessageVue,
  },
    data()
    {
        return {
            item: [],
            isOpen: false,
            selectedItem: null
        }
    },
    mounted(){
        axios.get('http://localhost:3000/item/sauce')
        .then(response=> {
            this.item = response.data
            console.log(response)
        })
        .catch(error=> console.log(error))
    },
    methods: {
        toggleDialog(item) {
            this.selectedItem = item;
            this.isOpen = !this.isOpen; // Toggle the isOpen property
        },
        async updateStock(selectedItem)
        {
            console.log(selectedItem)
            console.log(this.item.quantity)

            if(this.item.quantity < 1)
            {
                const message ='Sila Masukkan Kuantiti'
                const status = 'Gagal'
                this.$refs.toast.toast(message,status,'error')
            }
            else{
                const newQuantity = selectedItem.quantity+this.item.quantity
                const oldQuantity = selectedItem.quantity
                selectedItem.quantity=newQuantity
                if (isNaN(selectedItem.quantity))
                {
                    selectedItem.quantity=oldQuantity
                    const message ='Sila Masukkan Kuantiti'
                    const status = 'Gagal'
                    this.$refs.toast.toast(message,status,'error')

                }
                else
                {
                    console.log(selectedItem.idItem)
                    this.item.quantity=''

                    console.log(newQuantity)

                    await axios.put("http://localhost:3000/item/updatestock/"+ selectedItem.idItem,{newQuantity:newQuantity})
                    .then(response=>{
                        const update =response.data
                        console.log(update)
                    })
                    .catch(error=>console.log(error))
                    this.isOpen = !this.isOpen; // Toggle the isOpen property

                    const message ='Kuantiti Produk Telah Dikemaskini'
                    const status = 'Berjaya'
                    this.$refs.toast.toast(message,status,'success')
                }
                }

        }
    }
}
</script>

<template>
  <div class="w-10/12 grid grid-cols-5 gap-10 mx-auto text-center max-md:block max-md:w-60" >
    <RouterLink to="" v-for="item in item" v-bind:key="item.idItem" @click="toggleDialog(item)">
        <div class="bg-teal-500 text-white w-48  rounded-2xl p-1 ease-in-out duration-500 hover:scale-110">
            <div class="bg-white py-5 rounded-xl  h-44">
                <img class="mx-auto" src="" alt="Produk">
            </div>
             <div class="p-2">
                {{item.name}}
            </div>
        </div>
    </RouterLink>
    <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
    <dialog class="w-fit mx-auto shadow-product rounded-2xl  absolute top-44 z-50" v-bind:open="isOpen">
        <div class="">
            <div class="py-5 rounded-xl  border-solid border-2 border-teal-500">
                <img class="mx-auto" src="" alt="Produk">
            </div>
            <div class="py-2" v-if="selectedItem" >
                <div class="flex justify-between p-5">
                <div class="w-5/6">
                    <p>Stok Produk</p>
                    <label for="">Imbas Barkod</label><br>
                    <label for="">Masukkan Kuantiti</label>
                </div>
                <div class="">
                    <p>{{selectedItem.quantity}}</p>
                    <input class="" type="text" placeholder="88888888888">
                    <input class="w-1/3" placeholder="0" type="number" v-model="item.quantity">
                </div>
                </div>
            </div>
            <div class="flex w-max mx-auto gap-5">
                <div class="">
                    <button class="w-max bg-red-600 text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="toggleDialog">Batal</button>
                </div>
                <div class="">
                    <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="updateStock(selectedItem)">Sah</button>
                </div>
            </div>
        </div>
    </dialog>
</div>
<ToastMessageVue ref="toast"/>
</template>