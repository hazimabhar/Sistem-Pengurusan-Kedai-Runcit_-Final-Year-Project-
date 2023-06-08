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
                <dialog class="w-7/12 mx-auto shadow-product rounded-2xl outline absolute top-44 z-50" v-bind:open="isOpen">
                    <form method="dialog" class="max-sm:text-xs max-md:text-sm">
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
                        <div class="w-max mx-auto">
                            <button class="w-max bg-black text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="closeSale">Laporan Jualan</button>
                        </div>
                    </form>
                </dialog>
            </div>
        </div>
  </div>
</template>
<script>
import axios from 'axios';
import jsPDF from 'jspdf';


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
            updateReport:[],
            listItem:[],
            idItems:[],
            reportIdItems:[],
            price:[],
            quantity:[],
            item:[],
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

            axios.put("http://localhost:3000/report/"+this.report[0].idReport, reportData)
            .then(response=>console.log(response))
            .catch(error=>console.log(error))



        },
        closeSale()
        {

            axios.get("http://localhost:3000/report")
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

            axios.get("http://localhost:3000/sale/" + idSale)
            .then(response => {
                this.listItem = response.data;
                console.log(this.listItem);


                const idItemsSet = new Set(); // Use a Set to store unique idItems

                this.listItem.forEach(sale => {
                const listItemArray = sale.ListItem;
                // console.log(listItemArray);

                const idItemsArray = listItemArray.map(item => item.idItem);
                const itemPrice = listItemArray.map(item => item.price);
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

                axios.get("http://localhost:3000/item/report/" + this.idItems)
                .then(response => {
                    this.item = response.data;


                    console.log(this.item);

                    console.log('Number Sale:',this.updateReport[0].numberSale)
                    console.log('Total Sale',this.updateReport[0].saleRevenue)
                    console.log('idAccounts:', idAccounts);
                    console.log('paymentMethods:', paymentMethods);
                    console.log('prices:', prices);
                    console.log('all item id',this.reportIdItems)
                    console.log('Price',this.price)
                    console.log('Quantity',this.quantity)

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


            // const doc = new jsPDF();



            // // Set font size and style
            // doc.setFont('helvetica', 'bold');
            // doc.setFontSize(8);
            
            // // Set text color
            // doc.setTextColor('#FF0000');

            // doc.text('Hello world! \nHazim Hensem', 10, 10);
            // doc.save('Laporan Jualan.pdf');

            this.totalSale=[]
            this.isOpen=!this.isOpen



        }
    }
}
</script>

