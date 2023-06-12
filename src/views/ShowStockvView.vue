<script setup>
import NavBar from '../components/NavBar.vue';
import { RouterLink } from 'vue-router';
import ProductCategory from '../components/ProductCategory.vue';
import Process from '../components/Process.vue';

document.title="Papar Stok"

</script>

<template>
  <div>
    <NavBar/>
    <div class="bg-slate-100 min-h-screen max-md:bg-white max-lg:bg-white ">
      <div>
        <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl">Papar Stok</p>
      </div>
        <div class="w-9/12 mx-auto mr-16 bg-white max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
          <ul class="inline-flex list-none px-8 pb-10">
            <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
            <span class="px-2">></span>
            <li>Urus Stok</li>
          </ul>
          <div class="ml-14">
              <form class="flex max-sm:block" @submit.prevent="searchItem" autocomplete="off" >
                    <div class="relative max-sm:right-[28px] mt-[2px]" >
                        <input ref="barkodProduk" v-model="barkodProduk" class=" bg-white py-1 px-5 pr-80 rounded-3xl outline outline-1 outline-emerald-700 shadow-input max-md:pr-0 max-md:m-0  max-sm:w-[270px]" placeholder="Barkod"  type="text"  id="kodbar">
                        <div @click="camScanner">
                            <i class="fa-solid fa-camera absolute bottom-2 pl-10 hover:opacity-50 cursor-pointer lg:hidden  max-lg:left-[62%] max-sm:left-[76%] max-sm:top-2"></i>
                        </div>
                    </div>
                <div class="max-sm:mt-2 max-sm:ml-8 hover:text-black">
                    <button class="ml-5 text-white bg-teal-500 py-[6px] px-4 rounded-3xl hover:outline hover:outline-black max-sm:hover:outline-none" :disabled="barkodProduk === ''">Cari <i class="pl-5 max-sm:pl-2 text-sm fa-solid fa-magnifying-glass text-white"></i></button>
                </div>
                </form>

             </div>
             <div>
            <p class=" max-sm:ml-6 font-medium w-3/4 mx-8 text-2xl pt-10 pb-8 max-md:text-xl max-md:pt-3 max-md:pb-2 max-md:w-full max-md:mx-0">Pilih Kategori Produk</p>
        </div>
        <div class=" w-11/12 grid grid-cols-4 gap-10 mx-auto text-center max-xl:gap-5 max-lg:gap-2 max-sm:grid-cols-3">
            <ProductCategory to="/listitem/can" text="Tin" src="/can.svg"/>
            <ProductCategory to="/listitem/detergent" text="Sabun" src="/detergent.svg"/>
            <ProductCategory to="/listitem/drink" text="Minuman" src="/drink.svg"/>
            <ProductCategory to="/listitem/spice" text="Rempah" src="/spice.svg"/>
            <ProductCategory to="/listitem/bread" text="Roti" src="/bread.svg"/>
            <ProductCategory to="/listitem/sauce" text="Sos dan Kicap" src="/sauce.svg"/>
            <ProductCategory to="/listitem/food" text="Makanan" src="/food.svg"/>
            <ProductCategory to="/listitem/tool" text="Alatan" src="/broom.svg"/>
        </div>
        </div>
    </div>
  </div>
  <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
    <dialog class="w-1/4 max-sm:w-[75%] mx-auto shadow-product rounded-2xl  absolute top-44 z-50" v-bind:open="isOpen">
        <div class="" v-if="itemDetail">
            <div class="py-5 rounded-xl  border-solid border-2 border-teal-500">
                <img class="mx-auto" :src="itemDetail.image" alt="Produk">
            </div>
            <div class="py-2" >
                <div class="flex justify-between p-5">
                <div class="">
                    <p>Nama Produk</p>
                    <p>Harga Produk</p>
                    <p>Berat Produk</p>
                    <p>Kuantiti Produk</p>
                    <p>Kategori</p>
                </div>
                <div class="">
                    <p>{{itemDetail.name}}</p>
                    <p>RM {{itemDetail.price}}</p>
                    <p>{{itemDetail.weight}} {{itemDetail.unit}}</p>
                    <p>{{itemDetail.quantity}}</p>
                    <p>{{itemDetail.category}}</p>
                </div>
                </div>
            </div>
            <div class="w-max mx-auto">
                <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="toggleDialog">Ok</button>
            </div>
        </div>
    </dialog>
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
import ToastMessageVue from "../components/ToastMessage.vue";
import BarcodeScanner from '../components/BarcodeScanner.vue';

export default {
    components: {
    ToastMessageVue,
  },
    data()
    {
        return {
            barkodProduk:'',
            itemDetail:[],
            barcodeScanner:null,

            phoneScanner:false,
            isOpen: false,
            
        }
    },
        methods:
        {
        async searchItem()
            {
                try{
                    console.log(this.barkodProduk)
                    await axios.get("http://localhost:3000/item/search/"+ this.barkodProduk)
                    .then(response=>{
                    this.itemDetail = response.data
                    console.log(this.itemDetail)})

                    this.isOpen = !this.isOpen; // Toggle the isOpen property
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
            },
        async toggleDialog()
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