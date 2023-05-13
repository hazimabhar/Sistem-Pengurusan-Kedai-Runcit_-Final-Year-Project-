<script setup>
import MyButton from '../components/MyButton.vue';
import { RouterLink } from 'vue-router';
import NavBar from '../components/NavBar.vue';
import { ref } from 'vue';
import PocketBase, { Record } from 'pocketbase';


const imageUrl = ref(null);


 const pb = new PocketBase('http://127.0.0.1:8090');

document.title="Update Product";

    const namaProduk = ref("")
    const hargaProduk = ref("")
    const berat = ref("")
    const unit = ref("")
    const kuantitiProduk = ref("")
    const kategoriProduk = ref("")
    const barkodProduk = ref("")

    async function registerProduct()
    {
        const data = 
        {
            "nama": namaProduk.value,
            "harga": hargaProduk.value,
            "berat": (berat.value+" "+unit.value),
            "kuantiti": kuantitiProduk.value,
            "kategori": kategoriProduk.value,
            "kodbar": barkodProduk.value
        };
        const record = await pb.collection('produk').create(data);
        isOpen.value=!isOpen.value;

        namaProduk.value=""
        hargaProduk.value=""
        berat.value=""
        unit.value=""
        kuantitiProduk.value=""
        kategoriProduk.value=""
        barkodProduk.value=""
    }
    const isOpen = ref(false)

    function toggleDialog()
    {
        isOpen.value=!isOpen.value;
    }


</script>
<template>
<div>
    <NavBar/>
    <div class="bg-slate-100 min-h-screen max-md:bg-white ">
        <div>
            <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Maklumat Produk</p>
        </div>
            <div class="w-9/12 mx-auto mr-16 bg-white max-lg:w-11/12 max-lg:mx-auto max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <RouterLink to="/manageinventory" class="text-blue-500 hover:underline">Urus Inventori</RouterLink> 
                    <span class="px-2">></span>
                    <li>Kemaskini Maklumat Produk</li>
                </ul>
                <div class="w-full px-10 max-sm:p-0">
                    <p class=" text-xl font-semibold mb-4">Sila Masukkan Maklumat Produk</p>
                    <form class="" @submit.prevent="registerProduct()">
                        <div class="flex justify-between max-sm:block">
                            <div class="">
                                <label class="text-gray-500" for="Nama Produk">Nama Produk</label><br>
                                <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-4 focus:outline focus:outline-blue-500" type="text" placeholder="Milo 3 in 1" id="namaproduk" v-model="namaProduk"><br>
                                <label class="text-gray-500" for="Nama Produk">Harga Produk</label><br>
                                <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-4 focus:outline focus:outline-blue-500" type="text" placeholder="88.88" id="hargaproduk" v-model="hargaProduk"><br>
                                <label class="text-gray-500" for="Nama Produk">Berat Produk</label><br>
                                <div class="flex gap-4">
                                    <div>
                                        <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-4 focus:outline focus:outline-blue-500" type="text" placeholder="500" id="beratproduk" v-model="berat">
                                    </div>
                                    <div class="py-4">
                                        <select class=" w-full cursor-pointer" name="berat" id="berat" v-model="unit">
                                        <option value="">Unit</option>
                                        <option value="G">Gram</option>
                                        <option value="Kg">Kg</option>
                                        <option value="Kg">Mililiter</option>
                                        <option value="Kg">Liter</option>
                                        </select>
                                    </div>
                                </div>
                                <label class="text-gray-500" for="Nama Produk">Kuantiti Produk</label><br>
                                <input class="outline-gray-300 outline outline-2 w-full p-2 rounded-md mt-2 mb-4 focus:outline focus:outline-blue-500" type="text" placeholder="Kuantiti Produk" id="kuantitiproduk" v-model="kuantitiProduk"><br>
                                <label class="text-gray-500" for="Nama Produk">Sila Pilih Kategori</label><br>
                                <div class="flex gap-5 mb-4">
                                    <div>
                                        <input type="radio" name="Kategori" value="Tin">
                                        <label class="pl-2" for="tin">Tin</label><br>
                                        <input type="radio" name="Kategori" value="Sabun">
                                        <label class="pl-2" for="sabun">Sabun</label><br>
                                        <input type="radio" name="Kategori" value="Minuman">
                                        <label class="pl-2" for="minuman">Minuman</label><br>
                                        <input type="radio" name="Kategori" value="Rempah">
                                        <label class="pl-2" for="rempah">Rempah</label><br>
                                    </div>
                                    <div>
                                        <input type="radio" name="Kategori" value="Roti">
                                        <label class="pl-2" for="roti">Roti</label><br>
                                        <input type="radio" name="Kategori" value="Sos">
                                        <label class="pl-2" for="sos">Sos dan Kicap</label><br>
                                        <input type="radio" name="Kategori" value="Makanan">
                                        <label class="pl-2" for="makanan">Makanan</label><br>
                                        <input type="radio" name="Kategori" value="Alatan">
                                        <label class="pl-2" for="alatan">Alatan</label><br>
                                    </div>
                                </div>
                                <label class="text-gray-500" for="Nama Produk">Kodbar Produk</label><br>
                                <input class="outline-gray-300 outline outline-2 w-1/5 p-2 rounded-md mt-2 mb-4 focus:outline focus:outline-blue-500 absolute max-lg:w-1/3 max-sm:w-4/5" type="text" placeholder="Barkod Produk" id="barkod" v-model="barkodProduk"><br>
                                <i class="fa-solid fa-camera relative bottom-2 left-3/4 pl-10 hover:opacity-50 cursor-pointer max-lg:left-2/3 max-sm:left-3/4"></i>
                            </div>
                            <div class="w-2/12 mx-auto max-lg:w-4/12 max-sm:w-full">
                                <div class="pb-6 max-sm:pt-6">
                                    <label class="text-gray-500" for="Nama Produk">Gambar Produk</label><br>
                                </div>
                                <image-input-reviewer v-model="selectedImage" />
                            </div>
                        </div>
                        <div class="w-max mx-auto flex gap-10 mt-5 max-sm:gap-5">
                            <div>
                                <MyButton txt="Batal" class="bg-red-600 max-sm:px-8" @click.prevent="toggleDialog('open')"/>
                            </div>
                            <div>
                                <MyButton txt="Daftar" class="max-sm:px-8" @click.prevent="toggleDialog('open')"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>
</template>

<script>
import ImageInputReviewer from '../components/ImageInputReviewer.vue'
export default {
  components: {
    ImageInputReviewer
  },
  data() {
    return {
      selectedImage: null
    }
  },
  methods: {
    submitForm() {
      // Do something with the selected image
      console.log(this.selectedImage)
    }
  }
}
</script>