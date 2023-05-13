<script setup>
import MyButton from '../components/MyButton.vue';
import MyLabel from '../components/MyLabel.vue';
import MyInput from '../components/MyInput.vue';
import NumberInput from '../components/NumberInput.vue';
import { RouterLink } from 'vue-router';
import router from "../router"
import { ref } from '@vue/reactivity';


async function submit()
{
    console.log(nric.value)
    console.log(password.value)

    if (nric.value == "")
    {
        document.getElementById("nricError").innerText="Please enter your identification number"
    }
    else if (nric.value != "123")
    {
        document.getElementById("nricError").innerText="Wrong identification number"
        document.getElementById("nric").value=""
    }
    else
    {
        document.getElementById("nricError").innerText=""
    }
    if (password.value == "")
    {
        document.getElementById("passError").innerText="Please enter your passowrd"
    }
    else if (password.value != "123")
    {
        document.getElementById("passError").innerText="Wrong Password"
        document.getElementById("password").value=""
    }
    else
    {
        document.getElementById("passError").innerText=""
    }

    // try {
    //     const resultList = await pb
    //         .collection("pengguna")
    //         .getFirstListItem(`ic =  "${nric.value}"`);
    //     if (password.value !== resultList.katalaluan) {
    //         alert("password error");
    //         return;
    //     }
    //     redirectHome();
    // } 
    // catch (error) {
    //     alert("error");
    // }
}

function redirectHome() {
    router.push("/home");
}

document.title="Login"
</script>
<template>
    <div class="bg-teal-500 w-screen min-h-screen  grid place-items-center">
        <form class="bg-white w-2/4 rounded-3xl shadow-login max-md:w-4/5" @submit.prevent="submit">
            <img class="mx-auto px-4 py-4" src="../assets/logo.png" alt="">
            <h1 class="font-bold tracking-wider text-xl text-center pb-3">Log Masuk</h1>
            <div class="w-4/5 mx-auto">
                <MyLabel text="Nombor Kad Pengenalan" />
                <MyInput placeholder="888888888888" value="" type="text" id="nric"/>
                <div>
                    <label for="" id="nricError" class="text-red-600 font-light text-sm"></label>
                </div>
                <MyLabel text="Kata Laluan"/>
                <MyInput placeholder="Katalaluan..." value="" type="password" id="password"/>
                <div>
                    <label for="" id="passError" class="text-red-600 font-light text-sm"></label>
                </div>
            </div>
  
            <div class="w-max mx-auto">            
                <MyButton txt="Log Masuk"/>
            </div>
            <div class="text-center py-4 underline">
                <RouterLink to="/about">Tukar Kata Laluan</RouterLink>
            </div>
        </form>
    </div>
</template>