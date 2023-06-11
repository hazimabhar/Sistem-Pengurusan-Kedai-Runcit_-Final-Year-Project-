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
              <form @submit.prevent="scanBarcode" autocomplete="off" >
                    <div >
                        <input ref="barkodProduk" v-model="barkodProduk" class=" bg-white absolute py-1 px-5 pr-80 rounded-3xl outline outline-1 outline-emerald-700 shadow-input max-md:pr-0 max-md:m-0 " placeholder="Barkod"  type="text"  id="kodbar">
                    </div>
                </form>
             </div>
        <div class="mt-14 w-11/12 grid grid-cols-4 gap-10 mx-auto text-center max-xl:gap-5 max-lg:gap-2 max-sm:grid-cols-3">
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
    <dialog class="w-1/4 mx-auto shadow-product rounded-2xl  absolute top-44 z-50" v-bind:open="isOpen">
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
    <ToastMessageVue ref="toast"/>
</template>

<script>
import axios from 'axios';
import ToastMessageVue from "../components/ToastMessage.vue";

export default {
    components: {
    ToastMessageVue,
  },
    data()
    {
        return {
            barkodProduk:'',
            itemDetail:[],

            isOpen: false,
            
        }
    },
        methods:
        {
        async scanBarcode()
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
        }
    }
 
</script>