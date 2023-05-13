<script setup>
    import NavBar from '../components/NavBar.vue';
    import MyButton from '../components/MyButton.vue'

document.title="Cashier"
</script>

<template >
    <div>
        <NavBar/>
        <div class="bg-slate-100 min-h-screen max-md:bg-white max-lg:bg-white ">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Juruwang</p>
            </div>
            <div class="w-9/12 mx-auto mr-16 bg-white max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
            <ul class="inline-flex list-none px-8 pb-10">
                <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                <span class="px-2">></span>
                <li>Juruwang</li>
            </ul>
                <div>
                    <p class="font-bold w-3/4 mx-auto text-4xl text-center text-yellow-500 pt-8 pb-10 lg:hidden">
                        <img class="mx-auto" src="/notavailable.svg" alt="">
                        <span>Fungsi Ini Hanya Boleh Digunakan Pada Kumputer Sahaja</span> 
                    </p>
                </div>
                <div class="flex max-lg:hidden">
                    <div class=" w-3/5 mx-9" >
                        <div class="shadow-product p-4 rounded-xl mb-5 bg-white">
                            <p>Nama Produk</p>
                            <div class="flex justify-between">
                                    <p>Kuantiti</p>
                                    <p class="">MYR88.88</p>
                                    <i class="fa-solid fa-trash text-red-600 cursor-pointer text-l"></i>
                            </div>
                        </div>
                        <div class="shadow-product p-4 rounded-xl  mb-5">
                            <p>Nama Produk</p>
                            <div class="flex justify-between">
                                    <p>Kuantiti</p>
                                    <p class="">MYR88.88</p>
                                    <i class="fa-solid fa-trash text-red-600 cursor-pointer text-l"></i>
                            </div>
                        </div>
                        <div class="shadow-product p-4 rounded-xl mb-5">
                            <p>Nama Produk</p>
                            <div class="flex justify-between">
                                    <p>Kuantiti</p>
                                    <p class="">MYR88.88</p>
                                    <i class="fa-solid fa-trash text-red-600 cursor-pointer text-l"></i>
                            </div>
                        </div>
                        <div class="shadow-product p-4 rounded-xl mb-5">
                            <p>Nama Produk</p>
                            <div class="flex justify-between">
                                    <p>Kuantiti</p>
                                    <p class="">MYR88.88</p>
                                    <i class="fa-solid fa-trash text-red-600 cursor-pointer text-l"></i>
                            </div>
                        </div>
                        <div class="shadow-product p-4 rounded-xl mb-5">
                            <p>Nama Produk</p>
                            <div class="flex justify-between">
                                    <p>Kuantiti</p>
                                    <p class="">MYR88.88</p>
                                    <i class="fa-solid fa-trash text-red-600 cursor-pointer text-l"></i>
                            </div>
                        </div>
                        <br>
                        <div class="bg-white shadow-product p-5 rounded-2xl border ">
                            <input class="outline-none" type="text" placeholder="Imbas Kod Bar" id="kodbar" value="">
                        </div>
                    </div>
                    <div class="w-3/12 h-fit bg-white shadow-product p-4 rounded-xl fixed right-20">
                        <div class="flex justify-between p-2">
                            <p>Barang:</p>
                            <p>8</p>
                        </div>
                        <div class="flex justify-between p-2">
                            <p>Jumlah Harga:</p>
                            <p>8.88</p> 
                        </div>
                        <hr>
                        <div class="p-2">
                            <p class="text-center">Jenis Pembayaran</p>
                            <div class="p-2">
                                <input type="radio" name="jenispembayaran" id="jenispembayaran" value="Tunai">
                                <label for="Tunai">Tunai</label>
                            </div>
                            <div class="p-2">
                                <input type="radio" name="jenispembayaran" id="jenispembayaran" value="DalamTalian">
                                <label for="DalamTalian">Dalam Talian</label>
                            </div>
                        </div>
                        <div class="w-max mx-auto">
                            <MyButton txt="Bayar"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</template>
  


