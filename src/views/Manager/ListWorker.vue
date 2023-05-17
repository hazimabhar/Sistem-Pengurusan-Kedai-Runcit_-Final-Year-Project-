<script setup>
import ManagerNavBar from '../../components/ManagerNavBar.vue';
import MyButton from '../../components/MyButton.vue';
import { RouterLink } from 'vue-router';



document.title='Home Page'
</script>

<template>
    <div >
        <ManagerNavBar/>
        <div class="bg-slate-100 max-md:bg-white max-lg:bg-white ]">
            <div>
                <p class="font-bold w-1/2 mx-auto text-4xl pt-24 pb-8 max-md:text-3xl ">Senarai Pekerja</p>
            </div>
            <div class="w-9/12 mx-auto mr-16 bg-white pt-4 max-sm:w-11/12 max-sm:mx-auto rounded-3xl pb-5 min-h-screen ">
                <ul class="inline-flex list-none px-8 pb-10">
                    <RouterLink to="/manager" class="text-blue-500 hover:underline">Laman Utama</RouterLink> 
                    <span class="px-2">></span>
                    <li>Senarai Pekerja </li>
                </ul>
                <div class="w-full px-10 max-sm:p-0">
                    <p class=" text-xl font-semibold mb-4">Senarai Pekerja</p>
                    <table class="border-2 border-slate-600 w-full" >
                        <thead class="h-10 border-b-2 border-slate-600">
                            <th class="border-r-2 border-slate-600">Nama</th>
                            <th class="border-r-2 border-slate-600" >Nombor Telefon</th>
                            <th class="border-r-2 border-slate-600" >Tindakan</th>
                        </thead>
                        <tbody >
                            <tr class=" text-center border-b-2 border-black">
                                <td class="border-r-2 border-slate-600">Muhammed Hazim Abhar bin Mohamed Azahar</td>
                                <td class="border-r-2 border-slate-600">0129126107</td>
                                <td class="border-r-2 border-slate-600">
                                    <div class="flex justify-evenly">
                                        <div>
                                            <button class="bg-red-500 rounded-lg p-2 text-white hover:bg-red-600 hover:outline hover:outline-black">Delete</button>
                                        </div>
                                        <div>
                                            <RouterLink to="/manager/updateworker">
                                                <Button class="bg-blue-500 rounded-lg p-2 text-white hover:bg-blue-600 hover:outline hover:outline-black">Kemaskini</Button>
                                            </RouterLink>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class=" text-center border-b-2 border-black">
                                <td class="border-r-2 border-slate-600">Muhammed Hazim Abhar bin Mohamed Azahar</td>
                                <td class="border-r-2 border-slate-600">0129126107</td>
                                <td class="border-r-2 border-slate-600">
                                    <div class="flex justify-evenly">
                                        <div>
                                            <button class="bg-red-500 rounded-lg p-2 text-white hover:bg-red-600 hover:outline hover:outline-black">Delete</button>
                                        </div>
                                        <div>
                                            <RouterLink to="/manager/updateworker">
                                                <Button class="bg-blue-500 rounded-lg p-2 text-white hover:bg-blue-600 hover:outline hover:outline-black">Kemaskini</Button>
                                            </RouterLink>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class=" text-center border-b-2 border-black">
                                <td class="border-r-2 border-slate-600">Muhammed Hazim Abhar bin Mohamed Azahar</td>
                                <td class="border-r-2 border-slate-600">0129126107</td>
                                <td class="border-r-2 border-slate-600">
                                    <div class="flex justify-evenly">
                                        <div>
                                            <button class="bg-red-500 rounded-lg p-2 text-white hover:bg-red-600 hover:outline hover:outline-black">Delete</button>
                                        </div>
                                        <div>
                                            <RouterLink to="/manager/updateworker">
                                                <Button class="bg-blue-500 rounded-lg p-2 text-white hover:bg-blue-600 hover:outline hover:outline-black">Kemaskini</Button>
                                            </RouterLink>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class=" text-center border-b-2 border-black">
                                <td class="border-r-2 border-slate-600">Muhammed Hazim Abhar bin Mohamed Azahar</td>
                                <td class="border-r-2 border-slate-600">0129126107</td>
                                <td class="border-r-2 border-slate-600">
                                    <div class="flex justify-evenly">
                                        <div>
                                            <button class="bg-red-500 rounded-lg p-2 text-white hover:bg-red-600 hover:outline hover:outline-black">Delete</button>
                                        </div>
                                        <div>
                                            <RouterLink to="/manager/updateworker">
                                                <Button class="bg-blue-500 rounded-lg p-2 text-white hover:bg-blue-600 hover:outline hover:outline-black">Kemaskini</Button>
                                            </RouterLink>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            </div>
        </div>
</template>