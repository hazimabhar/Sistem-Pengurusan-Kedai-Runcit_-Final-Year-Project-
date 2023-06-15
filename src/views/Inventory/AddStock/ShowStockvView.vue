<script setup>
import { RouterLink } from 'vue-router';
import ProductCategory from '../../../components/ProductCategory.vue';
import { RouterView } from 'vue-router';

</script>

<template>
  <div>
    <NavBar/>
    <div>
        <div class="w-4/5 mx-auto max-md:w-full">
        <div>
            <p class="font-medium w-3/4 mx-8 text-2xl pt-10 pb-6 max-md:text-xl max-md:pt-3 max-md:pb-2 max-md:w-full max-md:mx-0">Pilih Kategori Produk</p>
        </div>
        <form class="flex max-sm:block" @submit.prevent="searchItem" autocomplete="off" >
                    <div class="relative max-sm:right-[28px] mt-[2px]" >
                        <input ref="barkodProduk" v-model="barkodProduk" class=" bg-white py-1 px-5 pr-80 rounded-3xl outline outline-1 outline-emerald-700 shadow-input max-md:pr-0 max-md:m-0  max-sm:w-[270px]" placeholder="Imbas Kodbar"  type="text"  id="kodbar">
                        <div @click="camScanner">
                            <i class="fa-solid fa-camera absolute bottom-2 pl-10 hover:opacity-50 cursor-pointer lg:hidden  max-lg:left-[62%] max-sm:left-[76%] max-sm:top-2"></i>
                        </div>
                    </div>
                <div class="max-sm:mt-2 max-sm:ml-8 hover:text-black">
                    <button class="ml-5 text-white bg-teal-500 py-[6px] px-4 rounded-3xl hover:outline hover:outline-black max-sm:hover:outline-none" :disabled="barkodProduk === ''">Cari <i class="pl-5 max-sm:pl-2 text-sm fa-solid fa-magnifying-glass text-white"></i></button>
                <div v-if="loading" class="fixed inset-0 flex items-center bg-black bg-opacity-50 justify-center z-50">
                    <div class="loader-wrapper">
                        <div class="loader animate-spin rounded-full border-t-4 border-b-4 border-gray-200 h-12 w-12"></div>
                    </div>
                </div>
                </div>
                </form>
        <div class="w-full mt-5 grid grid-cols-8 gap-2 mx-auto text-center text-sm max-lg:grid-cols-4 max-md:grid-cols-2">
          <RouterLink to="/manageinventory/add/can" class="bg-teal-500 text-white rounded-lg py-2 hover:text-black text-xs focus:text-black"><i class="fa-solid fa-drum-steelpan text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Tin</RouterLink>
          <RouterLink to="/manageinventory/add/detergent" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black focus:text-black"><i class="fa-solid fa-jug-detergent text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Sabun</RouterLink>
          <RouterLink to="/manageinventory/add/drink" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black focus:text-black"><i class="fa-solid fa-bottle-water text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Minuman</RouterLink>
          <RouterLink to="/manageinventory/add/spice" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black focus:text-black"><i class="fa-solid fa-mortar-pestle text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Rempah</RouterLink>
          <RouterLink to="/manageinventory/add/bread" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black focus:text-black"><i class="fa-solid fa-bread-slice text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Roti</RouterLink>
          <RouterLink to="/manageinventory/add/sauce" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black focus:text-black"><i class="fa-solid fa-wine-bottle text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Sos</RouterLink>
          <RouterLink to="/manageinventory/add/food" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black focus:text-black"><i class="fa-solid fa-pizza-slice text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Makanan</RouterLink>
          <RouterLink to="/manageinventory/add/tool" class="bg-teal-500 text-white rounded-lg py-2 text-xs hover:text-black focus:text-black"><i class="fa-solid fa-broom text-sm max-lg:hidden"></i><br class="max-lg:hidden"> Alatan</RouterLink>
        </div>
        </div>
        <div class="mt-5">
          <RouterView/>
        </div>
    </div>
    <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
    <dialog class=" w-1/3 mx-auto shadow-product rounded-2xl  fixed top-44 z-50" v-bind:open="isOpen">
        <div class="" v-if="selectedItem" >
            <div class="py-5 rounded-xl  border-solid border-2 border-teal-500">
                <img class="mx-auto w-[45%]" :src="selectedItem.image" alt="Produk">
            </div>
            <div class="py-2">
                <div class="flex p-5">
                  <div class="w-5/6 text-center">
                      <p>Stok Produk</p>
                      <label for="">Masukkan Kuantiti</label>
                  </div>
                  <div class="text-center">
                      <p class="">{{selectedItem.quantity}}</p>
                      <input class="w-1/3 ml-12" placeholder="0" type="number" v-model="item.quantity">
                  </div>
                </div>
            </div>
            <div class="flex w-max mx-auto gap-5">
                <div class="">
                    <button class="w-max bg-red-600 text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="toggleDialog">Batal</button>
                </div>
                <div class="">
                    <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="updateStock(selectedItem)">Sah</button>
                    <div v-if="loading" class="fixed inset-0 flex items-center bg-black bg-opacity-50 justify-center z-50">
                    <div class="loader-wrapper">
                        <div class="loader animate-spin rounded-full border-t-4 border-b-4 border-gray-200 h-12 w-12"></div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </dialog>
  </div>
  <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !phoneScanner}"></div>
    <dialog class="w-[70%] mx-auto shadow-product rounded-2xl  fixed top-44 z-50" v-bind:open="phoneScanner">
        <div class="">
            <div class="justify-center text-center">
                <div>
                    <p class="font-semibold">Sila Imbas Kodbar</p>
                </div>
                <div class="flex flex-col items-center my-4">
                    <div class="section mx-auto w-11/12 text-xs">
                        <BarcodeScanner
                            v-bind:qrbox="300"
                            v-bind:fps="10"
                            @scan-success="scanBarcode"
                            class="mx-auto"
                        />
                    </div>
                </div>
                <div>
                    <input type="text" class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" v-model="barkodProduk">
                </div>
                <div>
                    <button class="w-max bg-red-600 text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="camScanner">Batal</button>
                </div>
            </div>
        </div>
    </dialog>
  <ToastMessageVue ref="toast"/>
</template>

<script>
import axios from 'axios';
import ToastMessageVue from "../../../components/ToastMessage.vue";
import BarcodeScanner from '../../../components/BarcodeScanner.vue';

export default {
    components: {
    ToastMessageVue,
  },
    data()
    {
        return {
            barkodProduk:'',
            item:[],
            selectedItem: null,
            barcodeScanner:null,

            phoneScanner:false,
            isOpen: false,

            loading:false
            
        }
    },
        methods:
        {
        async searchItem()
            {
                try{
                    this.loading = true
                    console.log(this.barkodProduk)
                    await axios.get("https://sistemkedairuncit.onrender.com/item/search/"+ this.barkodProduk)
                    .then(response=>{
                    this.itemDetail = response.data
                    console.log(this.itemDetail)})
                    this.selectedItem = this.itemDetail;
                    console.log(this.selectedItem)

                    this.isOpen = !this.isOpen // Toggle the isOpen property
                }
                catch (error)
                {
                    if(error.response)
                    {
                        if(error.response.status === 404)
                        {
                            const message ='Produk Tidak Wujud'
                            const status = 'Gagal'
                            this.$refs.toast.toast(message,status,'error')
                        }
                    }
                    this.barkodProduk=''

                }
                finally{
                    this.loading=false
                }
            },
            async updateStock(selectedItem)
        {
            console.log(selectedItem)
            console.log(this.item.quantity)
            this.loading=true
            try
            {
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

                        await axios.put("https://sistemkedairuncit.onrender.com/item/updatestock/"+ selectedItem.idItem,{newQuantity:newQuantity})
                        .then(response=>{
                            const update =response.data
                            console.log(update)
                        })
                        .catch(error=>console.log(error))
                        this.isOpen = !this.isOpen; // Toggle the isOpen property

                        const message ='Kuantiti Telah Dikemaskini'
                        const status = 'Berjaya'
                        this.$refs.toast.toast(message,status,'success')
                    }
                    }
            }
            finally
            {
                this.loading=false
            }
 

        },
        async toggleDialog(item)
        {
            this.isOpen = !this.isOpen; // Toggle the isOpen property
            this.barkodProduk=''

        },
        camScanner()
        {
            this.phoneScanner = !this.phoneScanner; // Toggle the isOpen property
        },
        scanBarcode(decodedText)
        {
            if(decodedText.trim() !== '')
            {
                this.barkodProduk = decodedText;
                console.log(this.barkodProduk)
                setTimeout(()=>{
                    this.phoneScanner=false
                },500)
            }
        },
        }
    }
 
</script>