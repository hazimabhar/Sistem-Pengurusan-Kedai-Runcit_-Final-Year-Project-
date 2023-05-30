<template>
   <transition name="toast">
    <div v-if="isVisible" class="fixed top-20 right-4 z-50">
        <div :class="toastClasses" class="w-64">
             <div class="flex items-center">
          <span class="mr-2">
            <!-- Add appropriate icon based on the status -->
            <i v-if="type === 'success'" class="fa-solid fa-circle-check text-3xl text-green-700"></i>
            <i v-else-if="type === 'error'" class="fas fa-exclamation-circle text-xl"></i>
            <i v-else class="fa-solid fa-circle-check text-3xl"></i>
          </span>
          <div class="ml-2">
            <!-- Display the status text -->
            <div class="text-sm font-medium">{{ message.status }}</div>
            <!-- Display the message text -->
            <div class="mb-1 font-light">{{ message.text }}</div>
          </div>
        </div>
        </div>
    </div>
    </transition>
</template>

<style>
   /* enter transitions */
   .toast-enter-from {
    opacity: 0;
    transform: translateX(100%);
  }
  .toast-enter-to {
    opacity: 1;
    transform: translateX(0);
  }
  .toast-enter-active {
    transition: all 0.3s ease;
  }
  
  /* leave transitions */
  .toast-leave-from {
    opacity: 1;
    transform: translateX(0);
  }
  .toast-leave-to {
    opacity: 0;
    transform: translateX(100%);
  }
  .toast-leave-active {
    transition: all 0.3s ease;
  }
</style>

<script>
    export default
    {
        data()
        {
            return{
                isVisible:false,
                message:{
                    text:'',
                    status:'',
                },
                type:'',
                
            }
        },
        computed:{
            toastClasses()
            {
                return[
                    'px-4 py-4 rounded-lg  text-sm font-medium drop-shadow-2xl',
                    {
                        'bg-[#c5f7dd]': this.type==='success',
                        'bg-red-500': this.type === 'error',
                        'bg-green-400 ': this.type === 'info' 
                    },
                ]
            }
        },
        methods:{
            toast(message,status, type='info')
            {
                this.message={
                    text:message,
                    status:status,
                }
                this.type = type,
                this.isVisible = true
                setTimeout(()=>{
                    this.isVisible = false
                }, 2000)
            }
        }

    }
</script>