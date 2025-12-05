<template>
    <div class="fixed w-full flex justify-center items-center z-50">
        <nav class="w-full max-w-2xs sm:max-w-sm mx-auto mt-4 px-2 py-2 sm:px-3 sm:py-3 gap-2 flex justify-around items-center rounded-full bg-gray-500/10 backdrop-blur-md border border-gray-200/20 shadow-xl shadow-primary/10 hover:shadow-primary/20 transition duration-300">
            <NuxtLink to="/" class="text-sm sm:text-base font-semibold self-center py-0 sm:py-1" active-class="border-b-2 border-primary" exact>
                Home
            </NuxtLink>
            <NuxtLink to="/documentation" class="text-sm sm:text-base font-semibold self-center py-0 sm:py-1" active-class="border-b-2 border-primary" exact>
                Documentation
            </NuxtLink>
            <NuxtLink to="/blog" class="text-sm sm:text-base font-semibold self-center py-0 sm:py-1" active-class="border-b-2 border-primary" exact>
                Blog
            </NuxtLink>
        </nav>
    </div>
</template>