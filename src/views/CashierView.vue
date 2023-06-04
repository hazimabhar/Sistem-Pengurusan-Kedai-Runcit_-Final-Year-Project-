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
                                    <td class="w-[5%] text-slate-500 border-b-2 font-medium text-center select-none"> <i class="fa-solid fa-plus text-blue-500 font-medium text-sm cursor-pointer text-center" @click="addQuantity(item)"></i> {{ item.quantity }} <i class="fa-solid fa-minus text-sm text-red-500 cursor-pointer" @click="decreaseQuantity(item)"></i></td>
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
                            <MyButton txt="Bayar" @click="completeSale"/>
                        </div>
                    </div>
                </div>
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
        return {
        barkodProduk: '',
        itemDetail:'',
        exisitngItem:null,
        listItem:[],
        idItems:[],
        price:[],
        quantity:[],
        paymentType:'',
        worker:'',
        }
    } ,
    mounted()
    {
        this.$refs.barkodProduk.focus()
        this.worker=JSON.parse(sessionStorage.getItem("idAccount"))
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
            .catch(error=>console.log(error))
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



            const totalSale = this.totalPrice

            const report = "8d9fad17-1230-407e-aad9-f38641d40f9d"

            const saleData= {
                price : totalSale,
                paymentMethod: this.paymentType,
                idWorker:this.worker,
                idReport : report
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
            

            // await axios.post("http://localhost:3000/salebuylist",{saleData,itemData})
            // .then(response=>console.log(response))
            // .catch(error=>console.log(error))

            this.listItem=[]

        }
    }
}

</script>