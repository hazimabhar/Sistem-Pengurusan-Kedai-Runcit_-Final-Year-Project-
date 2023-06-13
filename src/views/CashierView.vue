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
                <div class="flex max-lg:hidden min-h-[300px]">
                    <div class="h-fit w-3/5 mx-9">
                    <div>
                        <table>
                            <thead>
                                <tr>
                                    <th class="w-[5%] text-[#b3b3b3] border-b-2 font-medium" >No.</th>
                                    <th class="w-[60%] text-[#b3b3b3] border-b-2 font-medium">Nama Produk</th>
                                    <th class="w-[5%] text-[#b3b3b3] border-b-2 font-medium">Kuantiti</th>
                                    <th class="w-[20%] text-[#b3b3b3] border-b-2 font-medium">Harga</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in listItem" v-bind:key="item.idItem">
                                    <td class="w-[5%] text-slate-500 border-b-2 font-medium py-2" >{{ index+1 }}</td>
                                    <td class="w-[60%] text-slate-500 border-b-2 font-medium text-center" >{{ item.name }}</td>
                                    <td class="w-[5%] text-slate-500 border-b-2 font-medium text-center select-none"> <i class="fa-solid fa-plus text-blue-500 font-medium text-xs cursor-pointer text-center px-1" @click="addQuantity(item)"></i> {{ item.quantity }} <i class="fa-solid fa-minus text-xs text-blue-500 cursor-pointer px-1" @click="decreaseQuantity(item)"></i></td>
                                    <td class="text-slate-500 border-b-2 font-medium text-end" >RM {{ item.price * item.quantity }}</td>
                                    <td><i class="fa-solid fa-trash text-[#ff0000] cursor-pointer ml-5" @click="deleteItem(index)"></i></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                        <br>
                        <form @submit.prevent="scanBarcode" autocomplete="off" >
                            <div class="bg-white shadow-product p-5 rounded-2xl border ">
                                <input ref="barkodProduk" v-model="barkodProduk" class="w-full outline-none" type="text" placeholder="Imbas Kod Bar" id="kodbar">
                            </div>
                        </form>
                    </div>
                    <div class="w-3/12 h-fit bg-white shadow-product p-4 rounded-xl fixed right-20">
                        <div class="flex justify-between p-2">
                            <p>Barang:</p>
                            <p>{{ totalQuantity }}</p>
                        </div>
                        <div class="flex justify-between p-2">
                            <p>Jumlah Harga:</p>
                            <p>RM {{ totalPrice.toFixed(2) }}</p> 
                        </div>
                        <hr>
                        <div class="p-2">
                            <p class="text-center">Jenis Pembayaran</p>
                            <div class="p-2">
                                <input type="radio" name="jenispembayaran" id="jenispembayaran" value="Tunai" v-model="paymentType">
                                <label for="Tunai">Tunai</label>
                            </div>
                            <div class="p-2">
                                <input type="radio" name="jenispembayaran" id="jenispembayaran" value="Online" v-model="paymentType">
                                <label for="DalamTalian">Dalam Talian</label>
                            </div>
                        </div>
                        <div class="w-max mx-auto">
                            <MyButton txt="Bayar" @click="toggleDialog"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
    <div id="overlay" class="fixed z-40 w-screen h-screen inset-0 bg-gray-900 bg-opacity-50" v-bind:class="{'hidden': !isOpen}"></div>
    <dialog class="w-2/6 mx-auto shadow-product rounded-2xl px-5 absolute top-44 z-50" v-bind:open="isOpen">
        <div class="">
            <div class="py-2" >
                <table>
                            <thead>
                                <tr>
                                    <th class="w-[5%] text-[#b3b3b3] border-b-2 font-medium" >No.</th>
                                    <th class="w-[60%] text-[#b3b3b3] border-b-2 font-medium">Nama Produk</th>
                                    <th class="w-[5%] text-[#b3b3b3] border-b-2 font-medium">Kuantiti</th>
                                    <th class="w-[20%] text-[#b3b3b3] border-b-2 font-medium">Harga</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in listItem" v-bind:key="item.idItem">
                                    <td class="w-[5%] text-slate-500 font-medium py-2" >{{ index+1 }}</td>
                                    <td class="w-[60%] text-slate-500 font-medium text-center" >{{ item.name }}</td>
                                    <td class="w-[5%] text-slate-500 font-medium text-center select-none">{{ item.quantity }}</td>
                                    <td class="text-slate-500 font-medium text-end" >RM {{ item.price * item.quantity }}</td>
                                </tr>
                            </tbody>
                    </table>
                    <div class="flex justify-between mt-5">
                        <div>
                            <p>Kuantiti</p>
                            <p>Jenis Pembayaran</p>
                        </div>
                        <div>
                            <p>{{ totalQuantity }}</p>
                            <p>{{ paymentType }}</p>
                        </div>
                    </div>
                    <hr class="border-[#b3b3b3] my-2">
                    <div class="flex justify-between">
                        <div>
                            <p class="font-medium text-lg" >Jumlah</p>
                        </div>
                        <div>
                            <p class="font-medium text-lg">RM {{ totalPrice }}</p>
                        </div>
                    </div>
            </div>
            <div class="flex justify-evenly">
                <div>
                    <button class="w-max bg-red-600 text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black " @click="closeDialog">Batal</button>
                </div>
                <div >
                    <button class="w-max bg-blue-600 text-white p-2 px-10 rounded-xl hover:bg-white hover:text-black hover:outline hover:outline-black" @click="completeSale">Sah</button>
                </div>
            </div>
        </div>
    </dialog>
    <ToastMessageVue ref="toast"/>
</template>

<script>
import axios from 'axios';
import ToastMessageVue from "../components/ToastMessage.vue";


export default

{
    data() 
    {
        return {
        barkodProduk: '',
        itemDetail:'',
        exisitngItem:null,
        listItem:[],
        idItems:[],
        price:[],
        quantity:[],
        item:[],
        idDatabase:[],
        quantityDatabase:[],
        report:[],
        idReport:'',
        paymentType:'',
        worker:'',
        isOpen: false,
        }
    } ,
    mounted()
    {
        this.$refs.barkodProduk.focus()
        this.worker=JSON.parse(sessionStorage.getItem("idAccount"))

        axios.get("http://localhost:3000/report/today")
        .then(response=>{
            this.report=response.data
            console.log(this.report)
            this.idReport = this.report[0].idReport
        })
        .catch(error=>console.log(error))
    },
    computed:{
        totalQuantity()
        {
            return this.listItem.reduce((total, item)=> total + item.quantity,0)
        },
        totalPrice()
        {
           return this.listItem.reduce((total, item)=> total+(item.price*item.quantity),0)
        },
    },
    methods:
    {
        async scanBarcode(){
            console.log(this.barkodProduk)   

            await axios.get("http://localhost:3000/item/cashier/"+ this.barkodProduk)
            .then(response=>{
                this.itemDetail = response.data
                console.log(this.itemDetail)
                this.barkodProduk=''

                this.existingItem = this.listItem.find(item=> item.idItem === this.itemDetail.idItem)

                if(this.existingItem)
                {
                    this.existingItem.quantity++
                }
                else
                {
                    this.listItem.push({...this.itemDetail,quantity:1})

                }
                window.scrollTo({
                top: document.body.scrollHeight,
                behavior: 'smooth' // Optional: Add smooth scrolling animation

                
            })
            })
            .catch(error=>{
                if (error.response && error.response.data.error === "Item not found")
                {
                    const message ='Produk Tidak Wujud'
                    const status = 'Ralat'
                    this.$refs.toast.toast(message,status,'error')   
                }
            })
        },
        async addQuantity(item)
        {
            item.quantity++
        },
        async decreaseQuantity(item)
        {
            if(item.quantity>1)
            {
                item.quantity--
            }else
            {
                const index = this.listItem.indexOf(item);
                if (index !== -1) {
                this.listItem.splice(index, 1);
                }
            }
        },
        async deleteItem(index)
        {
            this.listItem.splice(index, 1);
        },
        async completeSale()
        {
            console.log(this.worker)
            console.log(this.listItem)
            console.log(this.totalPrice)
            console.log(this.totalQuantity)
            console.log(this.paymentType)
            console.log(this.idReport)

            const totalSale = this.totalPrice


            const saleData= {
                price : totalSale,
                paymentMethod: this.paymentType,
                idWorker:this.worker,
                idReport : this.idReport
            }

            console.log(saleData)

            this.listItem.forEach((item)=>{
                this.idItems.push(item.idItem)
                this.price.push(item.price*item.quantity)
                this.quantity.push(item.quantity)
            })

            console.log(this.idItems)
            console.log(this.price)
            console.log(this.quantity)

            const itemData={
                idItem : this.idItems,
                quantity : this.quantity,
                totalPrice : this.price
            }


            await axios.post("http://localhost:3000/salebuylist",{saleData,itemData})
            .then(response=>{
                console.log(response)
                this.listItem = [];
                this.isOpen = !this.isOpen; // Toggle the isOpen property

                const message = 'Pembelian Telah Direkodkan';
                const status = 'Berjaya';

                this.$refs.toast.toast(message, status, 'success');
                })
            .catch(error=>console.log(error))  

            await axios.get("http://localhost:3000/item/quantity/"+ this.idItems)
            .then(response=>
            {
                this.item = response.data
                console.log(this.item)
            })
            .catch(error=>console.log(error))

            this.item.forEach((item)=>{
                this.idDatabase.push(item.idItem)
                this.quantityDatabase.push(item.quantity)
            })

            const data ={
                listItems:[
                    {
                        idItem : this.idItems,
                        quantity : this.quantity,
                    }
                ],
                item:[
                    {
                        idItem:this.idDatabase,
                        quantity:this.quantityDatabase
                    }
                ]
            }

            console.log(data)

            const newQuantity = {};

            for (let i = 0; i < data.item[0].idItem.length; i++) {
            const idItem = data.item[0].idItem[i];
            const itemQuantity = data.item[0].quantity[i];
            const listItemQuantity = data.listItems[0].quantity[i];
            
            newQuantity[idItem] = itemQuantity - listItemQuantity;
            }

            console.log(newQuantity);

            await axios.put("http://localhost:3000/item/cashier/updatequantity",newQuantity)
            .then(response=>console.log(response))
            .catch(error=>console.log(error))

            this.idItems=[]
            this.price=[]
            this.quantity=[]
            this.idDatabase=[]
            this.quantityDatabase=[]

        },
        toggleDialog() {

            if(this.listItem.length===0 || this.paymentType === '')
            {
                const message ='Sila Masukkan Kodbar dan Jenis Pembayaran'
                const status = 'Ralat'
                this.$refs.toast.toast(message,status,'error')   
            }
            else
            {
                this.isOpen = !this.isOpen; // Toggle the isOpen property
            }
        },
        closeDialog()
        {
            this.isOpen = !this.isOpen; // Toggle the isOpen property

            const message ='Pembelian Dibatalkan'
            const status = 'Batal'
            
            this.$refs.toast.toast(message,status,'error')   

            this.listItem=[]
            this.paymentType=''
        },
    }
}

</script>