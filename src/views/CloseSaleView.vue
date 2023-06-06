<script setup>
import { ref } from '@vue/reactivity';
import MyButton from '../components/MyButton.vue';
import NavBar from '../components/NavBar.vue';

document.title="Tutup Jualan"

</script>

<template>
  <div >
    <NavBar/>
    <div class="bg-slate-100 min-h-screen max-md:bg-white max-lg:bg-white ">
        <div>
            <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">
                Hasil Jualan
            </p>
        </div>
            <div class="w-9/12 mx-auto mr-16 bg-white max-sm:w-11/12 max-sm:mx-auto rounded-3xl p-5">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/home" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <li>Tutup Jualan</li>
                </ul>
                <div class="text-center relative">
                    <button class=" bg-black text-white p-5 rounded-2xl hover:bg-red-600 hover:scale-125" @click="toggleDialog()" >Tutup Jualan</button>
                </div>
                <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
                <dialog class="w-4/5 mx-auto shadow-product rounded-2xl outline absolute top-44 z-50" v-bind:open="isOpen">
                    <form method="dialog" class="max-sm:text-xs max-md:text-sm">
                        <div class="flex justify-between p-5">
                            <p>Hasil Jualan</p>
                            <p>RM{{ parseFloat(totalSale.Online + totalSale.Tunai).toFixed(2) }}</p>
                        </div>
                        <div class="flex justify-between p-5">
                            <p>Pembayaran dalam Talian</p>
                            <p>RM {{ parseFloat(totalSale.Online).toFixed(2) }}</p>
                        </div>
                        <div class="flex justify-between p-5">
                            <p>Pembayaran Tunai</p>
                            <p>RM {{ parseFloat(totalSale.Tunai).toFixed(2) }}</p>
                        </div>
                        <div class="flex justify-between p-5">
                            <p>Jumlah Wang Tunai</p>
                            <p>RM {{ (parseFloat(totalSale.Tunai) + 300).toFixed(2) }}</p>
                        </div>
                        <div class="flex justify-between p-5">
                            <p>Tarikh</p>
                            <p>{{ currentDate }}</p>
                        </div>
                        <div class="w-max mx-auto">
                            <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="closeSale">Sah</button>
                        </div>
                    </form>
                </dialog>
            </div>
        </div>
  </div>
</template>
<script>
import axios from 'axios';

export default
{
    data()
    {
        return{
            isOpen:false,
            report:[],
            allSale:[],
            totalSale:[],
            currentDate: '',
        }
    },
    mounted()
    {
        axios.get("http://localhost:3000/report")
        .then(response=>{
            this.report = response.data
            console.log(this.report)
            this.allSale=(this.report[0].Sale)
            console.log(this.allSale)
        })
        .catch(error=>console.log(error))

        const currentDate = new Date();
        const day = String(currentDate.getDate()).padStart(2, '0');
        const month = String(currentDate.getMonth() + 1).padStart(2, '0');
        const year = String(currentDate.getFullYear());
        this.currentDate = `${day}/${month}/${year}`;

    },
    methods:
    {
        toggleDialog()
        {
            this.isOpen=!this.isOpen

            this.allSale.forEach((sale)=>
            {
                const paymentMethod = sale.paymentMethod
                const price = sale.price

                if(this.totalSale.hasOwnProperty(paymentMethod))
                {
                    this.totalSale[paymentMethod] += price
                }
                else{
                    this.totalSale[paymentMethod] = price
                }
            })

            console.log(this.allSale.length)
            console.log(this.totalSale)



        },
        closeSale()
        {

            this.totalSale=[]
            this.isOpen=!this.isOpen

        }
    }
}
</script>
