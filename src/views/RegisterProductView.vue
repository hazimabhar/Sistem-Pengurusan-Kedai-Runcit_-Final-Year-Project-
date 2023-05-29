<script setup>
import MyButton from '../components/MyButton.vue';
import { RouterLink } from 'vue-router';
import NavBar from '../components/NavBar.vue';
import { ref } from 'vue';

const imageUrl = ref(null);

document.title="Register Product";
</script>
<template>
  <div>
    <NavBar/>
    <div class="bg-slate-100 min-h-screen max-md:bg-white ">
        <div>
            <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Daftar Produk</p>
        </div>
            <div class="w-9/12 mx-auto mr-16 bg-white max-lg:w-11/12 max-lg:mx-auto max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <RouterLink to="/manageinventory" class="text-blue-500 hover:underline">Urus Inventori</RouterLink> 
                    <span class="px-2">></span>
                    <li>Daftar Produk</li>
                </ul>
                <div class="w-full px-10 max-sm:p-0">
                    <p class=" text-xl font-semibold mb-4">Sila Masukkan Maklumat Produk</p>
                    <form class="" @submit.prevent="registerProduct()">
                        <div class="flex justify-between max-sm:block">
                            <div class="">
                                <label class="text-gray-500" for="Nama Produk">Nama Produk</label><br>
                                <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="Milo 3 in 1" id="namaproduk" v-model="namaProduk"><br>
                                <label class="text-red-600 font-medium text-xs" for="errorName" id="errorName">{{errorName}}</label><br>
                                <label class="text-gray-500" for="Nama Produk">Harga Produk</label><br>
                                <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="88.88" id="hargaproduk" v-model="hargaProduk"><br>
                                <label class="text-red-600 font-medium text-xs" for="errorPrice" id="errorPrice">{{ errorPrice }}</label><br>
                                <label class="text-gray-500" for="Nama Produk">Berat Produk</label><br>
                                <div class="flex gap-4">
                                    <div>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="500" id="beratproduk" v-model="berat">
                                    </div>
                                    <div class="py-4">
                                        <select class=" w-full cursor-pointer" name="berat" id="berat" v-model="unit">
                                        <option disabled value="">Unit</option>
                                        <option value="G">Gram</option>
                                        <option value="Kg">Kg</option>
                                        <option value="Mililiter">Mililiter</option>
                                        <option value="Liter">Liter</option>
                                        </select>
                                    </div>
                                </div>
                                <label class="text-red-600 font-medium text-xs" for="errorWeight" id="errorWeight">{{ errorWeight }}</label><br>
                                <label class="text-gray-500" for="Nama Produk">Kuantiti Produk</label><br>
                                <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500" type="text" placeholder="Kuantiti Produk" id="kuantitiproduk" v-model="kuantitiProduk"><br>
                                <label class="text-red-600 font-medium text-xs" for="errorQuantity" id="errorQuantity">{{ errorQuantity }}</label><br>
                                <label class="text-gray-500" for="Nama Produk">Sila Pilih Kategori</label><br>
                                <div class="flex gap-5 mb-2">
                                    <div>
                                        <input type="radio" name="Kategori" value="Tin" v-model="kategori">
                                        <label class="pl-2" for="tin">Tin</label><br>
                                        <input type="radio" name="Kategori" value="Sabun" v-model="kategori">
                                        <label class="pl-2" for="sabun">Sabun</label><br>
                                        <input type="radio" name="Kategori" value="Minuman" v-model="kategori">
                                        <label class="pl-2" for="minuman">Minuman</label><br>
                                        <input type="radio" name="Kategori" value="Rempah" v-model="kategori">
                                        <label class="pl-2" for="rempah">Rempah</label><br>
                                    </div>
                                    <div>
                                        <input type="radio" name="Kategori" value="Roti" v-model="kategori">
                                        <label class="pl-2" for="roti">Roti</label><br>
                                        <input type="radio" name="Kategori" value="Sos" v-model="kategori">
                                        <label class="pl-2" for="sos">Sos dan Kicap</label><br>
                                        <input type="radio" name="Kategori" value="Makanan" v-model="kategori">
                                        <label class="pl-2" for="makanan">Makanan</label><br>
                                        <input type="radio" name="Kategori" value="Alatan" v-model="kategori">
                                        <label class="pl-2" for="alatan">Alatan</label><br>
                                    </div>
                                </div>
                                <label class="text-red-600 font-medium text-xs" for="errorCategory" id="errorCategory">{{ errorCategory }}</label><br>
                                <label class="text-gray-500" for="Nama Produk">Kodbar Produk</label><br>
                                <input class="outline-gray-300 outline outline-2 w-1/5 p-2 rounded-md mt-2 mb-2 focus:outline focus:outline-blue-500 absolute max-lg:w-1/3 max-sm:w-4/5" type="text" placeholder="Barkod Produk" id="barkod" v-model="barkodProduk"><br>
                                <div @click="toggleDialog">
                                    <i class="fa-solid fa-barcode relative bottom-2 left-3/4 pl-10 hover:opacity-50 cursor-pointer max-lg:hidden "></i>
                                </div>
                                <div @click="camScanner">
                                    <i class="fa-solid fa-camera relative bottom-2 pl-10 hover:opacity-50 cursor-pointer lg:hidden  max-lg:left-[62%] max-sm:left-[78%]"></i>
                                </div>
                                <label class="text-red-600 font-medium text-xs" for="errorBarcode" id="errorBarcode">{{ errorBarcode }}</label><br>
                            </div>
                            <div class="w-2/12 mx-auto max-lg:w-4/12 max-sm:w-full">
                                <div class="pb-6 max-sm:pt-6">
                                    <label class="text-gray-500" for="Nama Produk">Gambar Produk</label><br>
                                </div>
                                <image-input-reviewer v-model="selectedImage" />
                            </div>
                        </div>
                        <div class="w-max mx-auto flex gap-10 mt-1 max-sm:gap-5">
                            <div >
                                <MyButton txt="Batal" class="bg-red-600 max-sm:px-8" @click.prevent="cancelForm"/>
                            </div>
                            <div>
                                <MyButton txt="Daftar" class="max-sm:px-8" @click.prevent="submitForm"/>
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
    <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !completeRegister}"></div>
    <dialog class="w-1/4 mx-auto shadow-product rounded-2xl  fixed top-44 z-50" v-bind:open="completeRegister">
        <div class="">
            <div>
                <p class="font-semibold text-green-700 text-center text-xl">Produk Berjaya Didaftarkan!</p>
            </div>
            <div class="py-2" v-if="item">
                <div class="flex justify-between p-5">
                <div class="">
                    <p>Nama Produk</p>
                    <p>Harga Produk</p>
                    <p>Berat Produk</p>
                    <p>Kuantiti Produk</p>
                    <p>Kategori</p>
                </div>
                <div class="">
                    <p>{{item.name}}</p>
                    <p>RM {{item.price}}</p>
                    <p>{{item.weight}} {{item.unit}}</p>
                    <p>{{item.quantity}}</p>
                    <p>{{item.category}}</p>
                </div>
                </div>
            </div>
            <div class="flex justify-evenly">
                <div class="mt-[7px]">
                    <RouterLink  to="/showstock" class="w-max bg-blue-600 text-white p-2 px-5 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black text-sm " >Senarai Produk</RouterLink>
                </div>
                <div>
                    <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black text-sm " @click="closeCompleteRegister">Daftar</button>
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
</div>
</template>

<script>
import ImageInputReviewer from '../components/ImageInputReviewer.vue'
import axios from 'axios'
import BarcodeScanner from '../components/BarcodeScanner.vue';

export default {
  components: {
    ImageInputReviewer
  },
  data() {
    return {
      namaProduk: '',
      hargaProduk: '',
      berat: '',
      unit: '',
      kuantitiProduk: '',
      barkodProduk: '',
      kategori:null,
      selectedImage: null,
      barcodeScanner:null,

      isOpen:false,
      completeRegister:false,
      phoneScanner:false,

      errorName:'',
      errorPrice:'',
      errorWeight:'',
      errorQuantity:'',
      errorCategory:'',
      errorBarcode:'',


      item:[]
    }
  },
  methods: {
    submitForm() {
        const name = this.namaProduk
        const price = parseFloat(this.hargaProduk)
        const weight = this.berat
        const unit = this.unit 
        const quantity = parseInt(this.kuantitiProduk)
        const category = document.querySelector('input[name="Kategori"]:checked')?.value
        const barcode = this.barkodProduk

        
        if(this.namaProduk && this.hargaProduk && this.berat && this.unit && this.kuantitiProduk && this.barkodProduk && this.kategori)
        {
            const item =
        {
            name,
            price,
            weight,
            unit,
            quantity,
            category,
            barcode
        }
        this.item= item

        axios.post('http://localhost:3000/item', item)
        .then(response => {console.log(response.data)})
        .catch(error => {console.log(error)})
            this.completeRegister = !this.completeRegister; // Toggle the isOpen property
            
           this.namaProduk ="" 
           this.hargaProduk=""
           this.berat=""
           this.kuantitiProduk=""
           this.kuantitiProduk=""
           this.barkodProduk=""
           this.kategori = null

           this.errorName=''
           this.errorPrice=''
           this.errorWeight=''
           this.errorQuantity=''
           this.errorCategory=''
           this.errorBarcode=''
        }
        else
        {
            if(this.namaProduk==='')
            {
                this.errorName='*Sila Masukkan Nama Produk'
            }
            else 
            {
                this.errorName=''
            }
            if(this.hargaProduk==='')
            {
                this.errorPrice='*Sila Masukkan Harga Produk'
            }
            else
            {
                this.errorPrice=''
            }
            if(this.berat===''||this.unit==='')
            {
                this.errorWeight='*Sila Masukkan Berat Produk dan Pilih Unit'
            }
            else
            {
                this.errorWeight=''
            }
            if(this.kuantitiProduk==='')
            {
                this.errorQuantity='*Sila Masukkan Kuantiti Produk'
            }
            else
            {
                this.errorQuantity=''
            }
            if(this.kategori===null)
            {
                this.errorCategory='*Sila Pilih Kategori Produk'
            }
            else
            {
                this.errorCategory=''
            }
            if(this.barkodProduk==='')
            {
                this.errorBarcode='*Sila Masukkan Kodbar Produk'
            }
            else
            {
                this.errorBarcode=''
            }
        }
        window.scrollTo({
            top: 0,
            behavior: 'smooth' // Optional: Add smooth scrolling animation
        })
    
        },
        closeCompleteRegister()
        {
            this.completeRegister = !this.completeRegister; // Toggle the isOpen property
        },
        cancelForm()
        {
           this.namaProduk ="" 
           this.hargaProduk=""
           this.berat=""
           this.kuantitiProduk=""
           this.kuantitiProduk=""
           this.barkodProduk=""
           this.kategori = null
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
                this.barkodProduk=value
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
                this.barkodProduk = decodedText;
                console.log(this.barkodProduk)
                setTimeout(()=>{
                    this.phoneScanner=false
                },500)
            }
        }
        
    }
}
</script>