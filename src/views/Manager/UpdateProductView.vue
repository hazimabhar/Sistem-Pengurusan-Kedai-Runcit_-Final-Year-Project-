<script setup>
import MyButton from "../../components/MyButton.vue";
import { RouterLink } from "vue-router";
import { ref } from "vue";
import ManagerNavBarVue from "../../components/ManagerNavBar.vue";

const imageUrl = ref(null);

document.title = "Update Product";
</script>
<template>
  <div>
    <ManagerNavBarVue />
    <div class="bg-slate-100 min-h-screen max-md:bg-white">
      <div>
        <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl">
          Maklumat Produk
        </p>
      </div>
      <div
        class="w-9/12 mx-auto mr-16 bg-white max-lg:w-11/12 max-lg:mx-auto max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5"
      >
        <ul class="inline-flex list-none px-8 pb-10">
          <RouterLink to="/manager" class="text-blue-500 hover:underline"
            >Laman Utama</RouterLink
          >
          <span class="px-2">></span>
          <RouterLink
            to="/manager/managermanageinventory"
            class="text-blue-500 hover:underline"
            >Urus Inventori</RouterLink
          >
          <span class="px-2">></span>
          <li>Kemaskini Maklumat Produk</li>
        </ul>
        <div class="w-full px-10 max-sm:p-0">
          <p class="text-xl font-semibold mb-4">
            Sila Masukkan Maklumat Produk
          </p>
          <form class="" @submit.prevent="registerProduct()">
            <div class="flex justify-between max-sm:block">
              <div class="">
                <label class="text-gray-500" for="Nama Produk"
                  >Nama Produk</label
                ><br />
                <input
                class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500"
                  type="text"
                  placeholder="Milo 3 in 1"
                  id="namaproduk"
                  v-model="item.name"
                /><br />
                <label class="text-red-600 font-medium text-xs" for="errorName" id="errorName">{{errorName}}</label><br>
                <label class="text-gray-500" for="Nama Produk"
                  >Harga Produk</label
                ><br />
                <input
                  class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500"
                  type="text"
                  placeholder="88.88"
                  id="hargaproduk"
                  v-model="item.price"
                /><br />
                <label class="text-red-600 font-medium text-xs" for="errorPrice" id="errorPrice">{{ errorPrice }}</label><br>
                <label class="text-gray-500" for="Nama Produk"
                  >Berat Produk</label
                ><br />
                <div class="flex gap-4">
                  <div>
                    <input
                      class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500"
                      type="text"
                      placeholder="500"
                      id="beratproduk"
                      v-model="item.weight"
                    />
                  </div>
                  <div class="py-4">
                    <select
                      class="w-full cursor-pointer"
                      name="berat"
                      id="berat"
                      v-model="item.unit"
                    >
                      <option disabled value="">Unit</option>
                      <option value="G">Gram</option>
                      <option value="Kg">Kg</option>
                      <option value="Mililiter">Mililiter</option>
                      <option value="Liter">Liter</option>
                    </select>
                  </div>
                </div>
                <label class="text-red-600 font-medium text-xs" for="errorWeight" id="errorWeight">{{ errorWeight }}</label><br>
                <label class="text-gray-500" for="Nama Produk"
                  >Kuantiti Produk</label
                ><br />
                <input
                  class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500"
                  type="text"
                  placeholder="Kuantiti Produk"
                  id="kuantitiproduk"
                  v-model="item.quantity"
                /><br />
                <label class="text-red-600 font-medium text-xs" for="errorQuantity" id="errorQuantity">{{ errorQuantity }}</label><br>
                <label class="text-gray-500" for="Nama Produk"
                  >Sila Pilih Kategori</label
                ><br />
                <div class="flex gap-5 mb-4">
                  <div>
                    <input type="radio" name="Kategori" value="Tin" v-model="item.category" />
                    <label class="pl-2" for="tin">Tin</label><br />
                    <input type="radio" name="Kategori" value="Sabun"  v-model="item.category"/>
                    <label class="pl-2" for="sabun">Sabun</label><br />
                    <input type="radio" name="Kategori" value="Minuman"  v-model="item.category" />
                    <label class="pl-2" for="minuman">Minuman</label><br />
                    <input type="radio" name="Kategori" value="Rempah"  v-model="item.category"/>
                    <label class="pl-2" for="rempah">Rempah</label><br />
                  </div>
                  <div>
                    <input type="radio" name="Kategori" value="Roti" v-model="item.category" />
                    <label class="pl-2" for="roti">Roti</label><br />
                    <input type="radio" name="Kategori" value="Sos"  v-model="item.category"/>
                    <label class="pl-2" for="sos">Sos dan Kicap</label><br />
                    <input type="radio" name="Kategori" value="Makanan"  v-model="item.category" />
                    <label class="pl-2" for="makanan">Makanan</label><br />
                    <input type="radio" name="Kategori" value="Alatan"  v-model="item.category" />
                    <label class="pl-2" for="alatan">Alatan</label><br />
                  </div>
                </div>
                <label class="text-red-600 font-medium text-xs" for="errorCategory" id="errorCategory">{{ errorCategory }}</label><br>
                <label class="text-gray-500" for="Nama Produk"
                  >Kodbar Produk</label
                ><br />
                <input class="outline-gray-300 outline outline-2 w-1/5 p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500 absolute max-lg:w-1/3 max-sm:w-4/5" type="text" placeholder="Barkod Produk" id="barkod" v-model="item.barcode"><br>
                <div @click="toggleDialog">
                  <i class="fa-solid fa-barcode relative bottom-2 left-3/4 pl-10 hover:opacity-50 cursor-pointer max-lg:hidden "></i>
                </div>
                <div @click="camScanner">
                  <i class="fa-solid fa-camera relative bottom-2 pl-10 hover:opacity-50 cursor-pointer lg:hidden  max-lg:left-[62%] max-sm:left-[78%]"></i>
                </div>
                <label class="text-red-600 font-medium text-xs" for="errorBarcode" id="errorBarcode">{{ errorBarcode }}</label>
              </div>
              <div class="w-2/12 mx-auto max-lg:w-4/12 max-sm:w-full">
                <div class="pb-6 max-sm:pt-6">
                  <label class="text-gray-500" for="Nama Produk"
                    >Gambar Produk</label
                  ><br />
                </div>
                <img class="mx-auto pb-5 w-[80%]" :src="item.image" alt="Produk">
                <UploadPicture  id="upload" v-on:upload="handleUploaderEvent"/>
              </div>
              <label class="text-red-600 font-medium text-xs" for="errorImage" id="errorImage">{{ errorImage }}</label>
            </div>
            <div class="w-max mx-auto flex gap-10 mt-5 max-sm:gap-5">
              <div class="mt-[31px]">
                    <RouterLink  to="/manager/managermanageinventory/update" class="w-max bg-red-600 text-white rounded-3xl py-2 px-20 mt-6 hover:outline hover:outline-black  hover:bg-white hover:text-black" >Batal</RouterLink>
              </div>
              <div class="mt-[14px]">
                <MyButton
                  txt="Kemaskini"
                  class="max-sm:px-8"
                  @click.prevent="updateInfo"
                />
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
    <dialog class="w-1/4 mx-auto shadow-product rounded-2xl  fixed top-44 z-50" v-bind:open="isOpen">
        <div class="">
            <div class="justify-center text-center">
                <div>
                    <p class="font-semibold">Sila Imbas Kodbar</p>
                </div>
                <div>
                    <img src="/barcode.gif" class="w-8/12 mx-auto" alt="">
                </div>
                <div>
                    <input ref="dialogInput" type="text" class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" @input="closeScanner($event.target.value)" v-model="barkodProduk">
                </div>
                <div>
                    <button class="w-max bg-red-600 text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="toggleDialog">Batal</button>
                </div>
            </div>
        </div>
    </dialog>
    <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !phoneScanner}"></div>
    <dialog class="w-3/4 mx-auto shadow-product rounded-2xl  fixed top-44 z-50" v-bind:open="phoneScanner">
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
  </div>
</template>

<script>
import router from '../../router';
import axios from 'axios';
import ToastMessageVue from "../../components/ToastMessage.vue";
import UploadPicture from '../../components/UploadPicture.vue';
import BarcodeScanner from '../../components/BarcodeScanner.vue';

export default {

  components: {
    ToastMessageVue,
  },
  data() {
    return {
      selectedImage: null,
      itemId:router.currentRoute.value.params.id,
      item:{
        name:'',
        price:'',
        weight:'',
        unit:'',
        quantity:'',
        category:'',
        barcode:'',
        image:'',
      },

      isOpen:false,
      completeRegister:false,
      phoneScanner:false,

      errorName:'',
      errorPrice:'',
      errorWeight:'',
      errorQuantity:'',
      errorCategory:'',
      errorBarcode:'',
      errorCheckedBarcode:'',
      errorImage:'',
    };
  },
  mounted(){
    console.log(this.itemId);
    window.addEventListener("LR_UPLOAD_FINISH", this.handleUploadFinish);

    this.loadData()
 
    },
  methods: {
    loadData()
    {
      this.loading = true
      axios.get('https://sistemkedairuncit.onrender.com/item/'+this.itemId)
        .then(response=> {
            this.item = response.data
            console.log(this.item)
        })
        .catch(error=> console.log(error))
        .finally(()=>{
          this.loading = false
        })
    },
    handleUploadFinish(e) {
            const dataUpload = e.detail.data[0];
            this.fileName = dataUpload.name;
            this.item.image = dataUpload.cdnUrl + dataUpload.name;
            console.log(this.fileName)
            console.log(this.item.image)
    },
    updateInfo() {
      this.loading = true

      try
      {

        if(this.item.name && this.item.price && this.item.quantity && this.item.barcode && this.item.category && this.item.image)
      { 
        this.item.price = parseFloat(this.item.price)
        this.item.quantity = parseInt(this.item.quantity)

        axios.put ('https://sistemkedairuncit.onrender.com/item/'+this.itemId,this.item)
        .then(response=>{
          const updateItem = response.data;
          console.log(updateItem)
        })
        .catch(error=>console.log(error))

        const message ='Produk Telah Dikemaskini'
        const status = 'Berjaya'
        
        this.$refs.toast.toast(message,status,'success')

        this.errorName=''
        this.errorPrice=''
        this.errorWeight=''
        this.errorQuantity=''
        this.errorCategory=''
        this.errorBarcode=''
        this.errorImage=''

      }
      else
        {
            if(this.item.name==='')
            {
                this.errorName='*Sila Masukkan Nama Produk'

            }
            else 
            {
                this.errorName=''
            }
            if(this.item.price==='')
            {
                this.errorPrice='*Sila Masukkan Harga Produk'
            }
            else
            {
                this.errorPrice=''
            }
            if(this.item.quantity==='')
            {
                this.errorQuantity='*Sila Masukkan Kuantiti Produk'
            }
            else
            {
                this.errorQuantity=''
            }
            if(this.item.category===null)
            {
                this.errorCategory='*Sila Pilih Kategori Produk'
            }
            else
            {
                this.errorCategory=''
            }
            if(this.item.barcode==='')
            {
                this.errorBarcode='*Sila Masukkan Kodbar Produk'
            }
            else
            {
                this.errorBarcode=''
            }
            if(this.item.image==='')
            {
                this.errorImage='*Sila Masukkan Gambar Produk'
            }
            else
            {
                this.errorImage=''
            }
        }
      }
      finally{
        this.loading=false
      }
    },
    toggleDialog() {
            this.isOpen = !this.isOpen; // Toggle the isOpen property
            if(this.isOpen)
            {
                this.$nextTick(() => {
                    this.$refs.dialogInput.focus() // Auto focus on the input field when dialog is opened
                })
            }
        },
        closeScanner(value)
        {  
            if(value.trim() !== '')
            {
                this.item.barcode=value
                setTimeout(()=>{
                    this.isOpen=false
                },500)
            }

        },
        camScanner()
        {
            this.phoneScanner = !this.phoneScanner; // Toggle the isOpen property
        },
        scanBarcode(decodedText)
        {
            if(decodedText.trim() !== '')
            {
                this.item.barcode = decodedText;
                console.log(this.item.barcode)
                setTimeout(()=>{
                    this.phoneScanner=false
                },500)
            }
        },
  },
};
</script>
