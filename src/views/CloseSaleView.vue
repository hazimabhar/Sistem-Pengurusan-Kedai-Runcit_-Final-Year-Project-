<script setup>
import { ref } from '@vue/reactivity';
import MyButton from '../components/MyButton.vue';
import NavBar from '../components/NavBar.vue';

document.title="Closing"

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
                <div class=" flex text-center gap-5 justify-center items-center">
                    <div>
                        <button class=" bg-black text-white p-5 px-14 rounded-2xl hover:bg-red-600 hover:scale-105" @click="toggleDialog()" >Tutup Jualan</button>
                    </div>
                    <div>
                        <button class=" bg-black text-white p-5 rounded-2xl hover:bg-red-600 hover:scale-105"  :class="[tutupJualan ? '' : 'opacity-50 cursor-not-allowed']" :disabled="!tutupJualan" @click="downloadReport">Muat Turun Laporan</button>
                    </div>
                </div> 
                <div class="w-[20%] h-fit bg-white shadow-product p-5 rounded-xl fixed right-20 top-[250px]">
                    <p class="font-semibold text-base text-center">Sila Muat Naik Laporan Jualan</p>
                    <div class="flex justify-center mt-5">
                        <label class="text-blue-500" for="">{{fileName}}</label>
                    </div>
                    <div class="flex mt-2 justify-center">
                        <UploadPicture   id="upload" v-on:upload="handleUploaderEvent"/>
                    </div>
                </div>
                   

                <div class="mt-10" id="Report" >
                    <div class="flex justify-center items-center">
                        <h1 class="text-center text-2xl text-blue-600 font-bold">Laporan Jualan Harian</h1> 
                    </div>
                    <div class="flex justify-between w-[69%] mx-auto my-5">
                        <p class="font-bold text-sm">Jumlah Jualan: {{ allSale.length }}</p>
                        <p class="font-bold text-sm ">Hasil Jualan: RM {{ total }}</p>
                        <h2 class="font-bold text-sm" >Tarikh: {{ currentDate }}</h2>
                    </div>
                    <div class="pb-5" v-for="(sale, index) in allSaleReport" :key="index">
                        <div class="flex justify-between w-9/12 mx-auto bg-[#D9D9D9] p-3 px-10 rounded-3xl text-sm">
                            <p class="font-semibold">Number Sale: {{ index+1 }}</p>
                            <p class="font-semibold ml-16">Total Sale: RM {{ sale.price }}</p>
                            <p class="font-semibold" >Worker Incharge: {{ sale.workerName.substring(0, 15) }}</p>
                        </div>
                        <div class="flex justify-between w-9/12 mx-auto p-3 px-10 text-sm">
                            <p class="font-semibold">List Item </p>
                            <p class="font-semibold ml-16">Quantity</p>
                            <p class="font-semibold">Price Per Quantity</p>
                        </div>
                        <hr class="border-[#D9D9D9] w-[72%] mx-auto">
                        <div class="flex justify-between w-9/12 mx-auto p-3 px-10 text-sm">
                            <div>
                            <p class="text-center pb-2" v-for="item in sale.itemName" :key="item">
                                {{ item }}
                            </p>
                            </div>
                            <div>
                            <p  class="text-center pb-2 " v-for="qty in sale.quantity" :key="qty">
                                {{ qty }}
                            </p>
                            </div>
                            <div>
                            <p  class="text-center pb-2" v-for="(price, priceIndex) in sale.itemPrice" :key="priceIndex">
                                RM {{ (price / sale.quantity[priceIndex]).toFixed(2) }}
                            </p>
                            </div>
                        </div>
                        <hr class="flex justify-between border-[#D9D9D9] w-[72%] mx-auto">
                        <div class="w-9/12 mx-auto p-3 px-10 text-sm" >
                            <p class="text-right font-semibold">Total Quantity: {{ calculateTotalQuantity(sale.quantity) }}</p>
                            <p class="text-right font-semibold">Payment Method: {{ sale.paymentMethod }}</p>
                            <p class="text-right font-semibold">Total: RM {{ sale.price }}</p>
                        </div>
                    </div>
                </div>
                <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
                <dialog class="w-7/12 mx-auto shadow-product rounded-2xl outline absolute top-44 z-50" v-bind:open="isOpen">
                    <form method="dialog" class="max-sm:text-xs max-md:text-sm">
                        <div class="w-fit" @click="closeDialog">
                            <p class=" text-sm text-red-600 cursor-pointer hover:text-black pb-5">
                                <span class="text-sm">&lt;</span> 
                                Kembali
                            </p>
                        </div>
                        <div class="flex justify-between p-5">
                            <p>Hasil Jualan</p>
                            <p>RM {{ parseFloat(totalSale.Online + totalSale.Tunai).toFixed(2) }}</p>
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
                        <div class="flex w-max mx-auto">
                            <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="closeSale">Laporan Jualan</button>
                        </div>
                    </form>
                </dialog>
            </div>
        </div>
  </div>
  <ToastMessageVue ref="toast"/>
  <div v-if="loading" class="fixed inset-0 flex items-center bg-black bg-opacity-50 justify-center z-50">
        <div class="loader-wrapper">
            <div class="loader animate-spin rounded-full border-t-4 border-b-4 border-gray-200 h-12 w-12"></div>
        </div>
    </div>
</template>
<script>
import axios from 'axios';
import html2pdf from 'html2pdf.js';
import ToastMessageVue from "../components/ToastMessage.vue";
import UploadPicture from '../components/UploadPicture.vue';


export default {

  components: {
    ToastMessageVue,
  },
    data()
    {
        return{
            isOpen:false,
            tutupJualan:false,
            report:[],
            total:null,
            allSale:[],
            totalSale:[],
            currentDate: '',
            updateReport:[],
            workerData:[],
            workerName:[],
            listItem:[],
            idItems:[],
            reportIdItems:[],
            price:[],
            quantity:[],
            item:[],
            allSaleReport:[],

            fileName: '',
            filePath: '',

            loading:false
        }
    },
    mounted()
    {
        window.addEventListener("LR_UPLOAD_FINISH", this.handleUploadFinish);

        axios.get("https://sistemkedairuncit.onrender.com/report")
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
        handleUploadFinish(e) {
            const dataUpload = e.detail.data[0];
            this.fileName = dataUpload.name;
            this.filePath = dataUpload.cdnUrl + dataUpload.name;
            console.log(this.fileName)
            console.log(this.filePath)

            const fileData={
                filePath : this.filePath,
                fileName : this.fileName
            }
            console.log(fileData)

            axios.put("https://sistemkedairuncit.onrender.com/report/file/"+this.report[0].idReport, fileData)
            .then(response=>console.log(response))
            .catch(error=>console.log(error))

            
            const message ='Laporan Berjaya Dimuatnaik'
            const status = 'Berjaya'
            
            this.$refs.toast.toast(message,status,'success')
    },
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

            if (!this.totalSale.hasOwnProperty('Online') || isNaN(this.totalSale['Online']) || this.totalSale['Online'] === 0) {
                this.totalSale['Online'] = 0;
            }

            if (!this.totalSale.hasOwnProperty('Tunai') || isNaN(this.totalSale['Tunai']) || this.totalSale['Tunai'] === 0) {
                this.totalSale['Tunai'] = 0;
            }

            const total = this.totalSale.Tunai + this.totalSale.Online
            console.log(this.allSale.length)
            console.log(total)
            console.log(this.totalSale)
            console.log(this.report[0].idReport)

            const reportData = {
                numberSale : this.allSale.length,
                saleRevenue : total
            }

            console.log(reportData)

            axios.put("https://sistemkedairuncit.onrender.com/report/"+this.report[0].idReport, reportData)
            .then(response=>console.log(response))
            .catch(error=>console.log(error))



        },
        closeSale()
        {
            this.tutupJualan=true
            this.loading = true
            axios.get("https://sistemkedairuncit.onrender.com/report")
            .then(response=>{
                this.updateReport = response.data
                console.log(this.updateReport)
                console.log(this.updateReport[0].Sale)

                const idAccounts = this.updateReport[0].Sale.map(item => item.idAccount);
                const paymentMethods = this.updateReport[0].Sale.map(item => item.paymentMethod);
                const prices = this.updateReport[0].Sale.map(item => item.price);
                const idSale = this.updateReport[0].Sale.map(item => item.idSale);


                console.log('idAccounts:', idAccounts);
                console.log('paymentMethods:', paymentMethods);
                console.log('prices:', prices);
                // console.log(idSale)

                axios.get("https://sistemkedairuncit.onrender.com/report/user/"+idAccounts)
                .then(response=>
                {
                    this.workerData = response.data
                    console.log('Worker data',this.workerData)

                    this.workerData.forEach(data=>{
                        const name = data.name

                        this.workerName.push(name)
                    })

                })
                .catch(error=>console.log(error))

            axios.get("https://sistemkedairuncit.onrender.com/sale/" + idSale)
            .then(response => {
                this.listItem = response.data;
                console.log(this.listItem);


                const idItemsSet = new Set(); // Use a Set to store unique idItems

                this.listItem.forEach(sale => {
                const listItemArray = sale.ListItem;
                // console.log(listItemArray);

                const idItemsArray = listItemArray.map(item => item.idItem);
                const itemPrice = listItemArray.map(item => item.totalPrice);
                const itemQuantity = listItemArray.map(item => item.quantity);

                // console.log(idItemsArray);
                this.reportIdItems.push(idItemsArray)
                this.price.push(itemPrice)
                this.quantity.push(itemQuantity)

                // console.log('all item id',this.reportIdItems)


                idItemsArray.forEach(idItem => {
                    idItemsSet.add(idItem); // Add unique idItems to the Set
                });
                });

                this.idItems = Array.from(idItemsSet); // Convert Set to an array

                console.log(this.idItems);

                axios.get("https://sistemkedairuncit.onrender.com/item/report/" + this.idItems)
                .then(response => {
                    this.item = response.data;
                    console.log(this.item);

                    console.log('Number Sale:',this.updateReport[0].numberSale)
                    console.log('Total Sale',this.updateReport[0].saleRevenue)
                    this.total=(this.updateReport[0].saleRevenue)
                    console.log('idAccounts:', idAccounts);
                    console.log('Worker',this.workerName)
                    console.log('paymentMethods:', paymentMethods);
                    console.log('prices:', prices);
                    console.log('All Item Id',this.reportIdItems)
                    console.log('Price for each item in total',this.price)
                    console.log('Quantity',this.quantity)

                    const idToNameMap = this.item.reduce((map, item) => {
                    map[item.idItem] = item.name;
                    return map;
                    }, {});

                    // Update array id item with item names
                    const updatedIdItems = this.reportIdItems.map(ids => ids.map(id => idToNameMap[id]));

                    console.log(updatedIdItems);

                    for (let i = 0; i < this.price.length; i++) {

                        const item = {
                        workerName: this.workerName[i],
                        paymentMethod: paymentMethods[i],
                        price:prices[i],
                        itemName : updatedIdItems[i],
                        quantity : this.quantity[i],
                        itemPrice: this.price[i]

                        };
                        // console.log(item)
                        this.allSaleReport.push(item);
                    }

                    console.log(this.allSaleReport)

                    this.item = []
                    this.reportIdItems=[]
                    this.quantity=[]
                    this.price=[]
                })
                .catch(error => console.log(error));
            })
            .catch(error => console.log(error));
        })
            .catch(error=>console.log(error))
            .finally(()=>{
                this.loading = false
            })


            this.totalSale=[]
            this.allSaleReport=[]
            this.isOpen=!this.isOpen

            const message ='Perniagaan Berjaya Ditutup'
            const status = 'Berjaya'
            
            this.$refs.toast.toast(message,status,'success')

        },
        formatArray(arr) {
        return arr.join(', ');
        },
        calculateTotalQuantity(quantityArray) {
            if (Array.isArray(quantityArray) && quantityArray.length > 0) {
            return quantityArray.reduce((total, quantity) => total + quantity, 0);
            }
            return 0;
        },
        closeDialog()
        {
            this.isOpen=!this.isOpen

            const message ='Perniagaan Masih Belum Ditutup'
            const status = 'Amaran'
            
            this.$refs.toast.toast(message,status,'error')
        },
        downloadReport()
        {
            const report = document.getElementById('Report')
            const fileName = `Laporan Jualan ${this.currentDate}`

            html2pdf().from(report).save(fileName);
        }
    }
}
</script>

