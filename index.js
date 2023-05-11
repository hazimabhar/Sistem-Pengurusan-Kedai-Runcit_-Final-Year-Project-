const express = require('express')
const app = express()
const {PrismaClient} = require ("@prisma/client")
const { parse } = require("vue/compiler-sfc")
const cors = require ('cors')

const prisma = new PrismaClient()


app.use(cors({
  origin:'*'
}))
app.use(express.json())

 
//crud user
app.get("/", async (req, res)=>{

    const allUsers = await prisma.user.findMany({
      include :{
        Worker:true,
        Manager: true,
        Sale:true,
      }
    })
    res.json(allUsers)
})
 
app.post("/", async (req, res)=>{
  const newUser = await prisma.user.create({data: req.body})
  res.json(newUser)
})

  
app.put("/:id", async (req, res)=>{
  const id = req.params.id
  res.json(updateUser)
}) 
 
app.delete("/:id", async (req, res)=>{
  const id = req.params.id
  const deleteUser = await prisma.user.delete({where: {id: id }})
  res.json(deleteUser)
})

//crud worker
app.get("/worker", async (req, res)=>{

  const allWorker = await prisma.worker.findMany()
  res.json(allWorker)
}) 

app.post("/worker", async (req, res)=>{
  const newWorker = await prisma.worker.create({data: req.body})
  res.json(newWorker) 
})
 
app.put("/worker/:id", async (req, res)=>{
  const id = req.params.id
  const newName = req.body.name
  const newAddress = req.body.address
  const newPhoneNumber = req.body.phoneNumber
  const newEmail = req.body.email 
  const newPassword = req.body.password
  const updateWorker = await prisma.worker.update({
    where: {idWorker: id }, 
    data: {
      name :newName,
      password:newPassword,
      address : newAddress,
      phoneNumber : newPhoneNumber,
      email:newEmail
    }})
  res.json(updateWorker)
})

app.delete("/worker/:id", async (req, res)=>{ 
  const id = req.params.id
  const deleteWorker = await prisma.worker.delete({where: {idWorker:id}})
  res.json(deleteWorker) 
})

//crud manager
app.get("/manager", async (req, res)=>{
  const allManager = await prisma.manager.findMany()
  res.json(allManager)
})

app.post("/manager", async (req, res)=>{
  const newManager = await prisma.manager.create({data: req.body})
  res.json(newManager)
})
 
app.put("/manager/:id", async (req, res)=>{
  const id = req.params.id
  const newName = req.body.name
  const newAddress = req.body.address
  const newPhoneNumber = req.body.phoneNumber
  const newEmail = req.body.email  
  const newPassword = req.body.password
  const updateManager = await prisma.manager.update({
    where: {idManager: id }, 
    data: {
      name :newName,
      password:newPassword,
      address : newAddress,
      phoneNumber : newPhoneNumber,
      email:newEmail
    }})
  res.json(updateManager)
})

app.delete("/worker/:id", async (req, res)=>{ 
  const id = req.params.id
  const deleteWorker = await prisma.manager.delete({where: {idManager:id}})
  res.json(deleteWorker) 
})
  
//crud item 

//getallitem
app.get("/item", async (req, res)=>{
  const allItem = await prisma.item.findMany({
    orderBy:{
      name:'asc'
    }
  })
  res.json(allItem)
})

//getcanned
app.get("/item/canned",async (req,res)=>{
  const canned = await prisma.item.findMany(
    {
      where:{
        category : "Tin"
      },
      orderBy:{
        name:'asc'
      }
    })
    res.json(canned)
})

//getdetergent
app.get("/item/detergent",async (req,res)=>{
  const detergent = await prisma.item.findMany(
    {
      where:{
        category : "Sabun"
      },
      orderBy:{
        name:'asc'
      }
    })
    res.json(detergent)
})

//getdrink
app.get("/item/drink",async (req,res)=>{
  const drink = await prisma.item.findMany(
    {
      where:{
        category : "Minuman"
      },
      orderBy:{
        name:'asc'
      }
    })
    res.json(drink)
})

//getspice 
app.get("/item/spice",async (req,res)=>{
  const spice = await prisma.item.findMany(
    {
      where:{
        category : "Rempah"
      },
      orderBy:{
        name:'asc'
      }
    })
    res.json(spice)
})

//getbread
app.get("/item/bread",async (req,res)=>{
  const bread = await prisma.item.findMany(
    {
      where:{
        category : "Roti"
      },
      orderBy:{
        name:'asc'
      }
    })
    res.json(bread)
})
  
//getsauce 
app.get("/item/sauce",async (req,res)=>{
  const sauce = await prisma.item.findMany(
    {
      where:{
        category : "Sos"
      },
      orderBy:{
        name:'asc'
      }
    })
    res.json(sauce)
})

//getfood
app.get("/item/food",async (req,res)=>{
  const food = await prisma.item.findMany(
    {
      where:{
        category : "Makanan"
      },
      orderBy:{
        name:'asc'
      }
    })
    res.json(food)
})

//gettools
app.get("/item/tool",async (req,res)=>{
  const tool = await prisma.item.findMany(
    {
      where:{
        category : "Alatan"
      },
      orderBy:{
        name:'asc'
      }
    })
    res.json(tool)
})

app.post("/item", async (req, res)=>{
  const newItem = await prisma.item.create({data: req.body})
  res.json(newItem)
})
 
app.put("/item/:id", async (req, res)=>{
  const id = req.params.id
  const newName = req.body.name
  const newCategory = req.body.category
  const newPrice = req.body.price
  const newBarcode = req.body.barcode
  const newWeight = req.body.weight
  const newQuantity = req.body.quantity
  const updateItem = await prisma.item.update({
    where: {idItem: id }, 
    data: {
      name :newName,
      category : newCategory,
      price :newPrice, 
      barcode : newBarcode,
      weight : newWeight,
      quantity : newQuantity
    }})
  res.json(updateItem)
})

app.delete("/item/:id", async (req, res)=>{ 
  const id = req.params.id
  const deleteItem = await prisma.item.delete({where: {idItem:id}})
  res.json(deleteItem) 
})

//crud buylist 
app.get("/buylist", async (req, res)=>{
  const allBuyList = await prisma.buyList.findMany()
  res.json(allBuyList)
})

app.post("/buylist", async (req, res)=>{
  const newBuyList = await prisma.buyList.create({data: req.body})
  res.json(newBuyList) 
})  
 
app.put("/buylist/:id", async (req, res)=>{
  const id = req.params.id
  const newBuyList = req.body.buyList
  const updateBuyList = await prisma.buyList.update({
    where: {idBuyList: id }, 
    data: {
      buyList :newBuyList,
    }})
  res.json(updateBuyList)
})

app.delete("/buylist/:id", async (req, res)=>{ 
  const id = req.params.id
  const deleteBuyList = await prisma.buyList.delete({where: {idItem:id}})
  res.json(deleteBuyList) 
})


//crud sale
app.get("/sale", async (req, res)=>{
  const allSale = await prisma.sale.findMany()
  res.json(allSale)
})  

app.post("/sale", async (req, res)=>{
  const newSale = await prisma.sale.create({data: req.body})
  res.json(newSale)
}) 
 
app.put("/sale/:id", async (req, res)=>{
  const id = req.params.id
  const newPrice = req.body.price
  const newPaymentMethod = req.body.paymentMethod
  const updateSale = await prisma.sale.update({
    where: {idSale: id }, 
    data: {
      price :newPrice,
      paymentMethod : newPaymentMethod
    }})
  res.json(updateSale) 
})  
 
app.delete("/sale/:id", async (req, res)=>{ 
  const id = req.params.id
  const deleteSale = await prisma.sale.delete({where: {idSale:id}})
  res.json(deleteSale) 
})
 
//crud report
app.get("/report", async (req, res)=>{ 
  const allReport = await prisma.report.findMany()
  res.json(allReport)
})
 
app.post("/report", async (req, res)=>{
  const newReport = await prisma.report.create({data: req.body})
  res.json(newReport)
}) 
  
app.put("/report/:id", async (req, res)=>{
  const id = req.params.id
  const newNumberSale = req.body.numberSale
  const newSaleRevenue = req.body.saleRevenue
  const updateReport = await prisma.report.update({
    where: {idReport: id }, 
    data: {
      numberSale :newNumberSale,
      saleRevenue : newSaleRevenue,
    }})
  res.json(updateReport)
})

app.delete("/report/:id", async (req, res)=>{ 
  const id = req.params.id
  const deleteReport = await prisma.report.delete({where: {idReport:id}})
  res.json(deleteReport) 
})

//itembuylist
app.get("/itembuylistuser", async (req, res)=>{
  const allItemBuyList = await prisma.itembuylistuser.findMany()
  res.json(allItemBuyList)
})
 
app.post("/itembuylistuser", async (req, res)=>{
  const newItemBuyList = await prisma.ItemBuyListUser.create({data: req.body})
  res.json(newItemBuyList)
})
 
app.put("/itembuylistuser/:id", async (req, res)=>{
  const id = req.params.id
  const newNumberSale = req.body.numberSale
  const newSaleRevenue = req.body.saleRevenue
  const updateReport = await prisma.itembuylistuser.update({
    where: {idReport: id }, 
    data: {
      numberSale :newNumberSale,
      saleRevenue : newSaleRevenue,
    }})
  res.json(updateReport)
})

app.delete("/itembuylistuser/:id", async (req, res)=>{ 
  const id = req.params.id
  const deleteItemBuyList = await prisma.itembuylistuser.delete({where: {idBuyList:id}})
  res.json(deleteItemBuyList) 
})

app.listen (3000, () => {
  console.log("Now listening on port 3000")  
})