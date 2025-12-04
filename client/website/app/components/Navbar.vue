<template>
    <div class="fixed w-full flex justify-center items-center">
        <nav class="w-full max-w-sm mx-auto mt-4 px-3 py-3 gap-2 flex justify-around items-center rounded-full bg-gray-500/10 backdrop-blur-md border border-gray-200/20">
            <NuxtLink to="/" class="text-md font-semibold self-center py-1" active-class="border-b-2 border-primary" exact>
                Home
            </NuxtLink>
            <NuxtLink to="/documentation" class="text-md font-semibold self-center py-1" active-class="border-b-2 border-primary" exact>
                Documentation
            </NuxtLink>
            <NuxtLink to="/blog" class="text-md font-semibold self-center py-1" active-class="border-b-2 border-primary" exact>
                Blog
            </NuxtLink>
        </nav>
    </div>
</template>