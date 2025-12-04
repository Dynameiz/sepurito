<template>
    <div class="w-full min-h-screen max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-2 justify-center items-center">
        <div class="w-full flex flex-col">
            <h1 class="text-7xl font-bold text-[#05df72]">
                Sepurito
            </h1>
            <p class="mt-6 text-lg text-white/60 text-justify">
                Split bills quickly and fairly with Sepurito. Sepurito makes it easy to divide expenses among friends, ensuring everyone pays their fair share without the hassle.
            </p>
            <span class="flex flex-row gap-4 mt-12">
                
                <!-- <a href="https://github.com/Dynameiz/sepurito" target="_blank" rel="noopener noreferrer" -->
                    <!-- class="w-48 flex flex-row justify-center gap-2 items-center px-4 py-3 bg-primary/60 text-white font-semibold rounded-md hover:bg-primary/50 transition duration-300"> -->
                    <!-- <Icon name="mdi:android" size="24" /> -->
                    <!-- <p class="mr-1">Download Apk</p> -->
                <!-- </a> -->

                <button onclick=""
                    class="w-48 flex flex-row justify-center gap-2 items-center px-4 py-3 bg-primary/60 text-white font-semibold rounded-md hover:bg-primary/50 transition duration-300 cursor-pointer">
                    <Icon name="mdi:android" size="24" />
                    <p class="mr-1">Download Apk</p>
                </button>

                <a href="https://github.com/Dynameiz/sepurito" target="_blank" rel="noopener noreferrer"
                    class="w-48 flex flex-row justify-center gap-2 items-center px-4 py-3 bg-gray-700/60 text-white font-semibold rounded-md hover:bg-gray-700/50 transition duration-300">
                  <Icon name="mdi:github" size="24" />
                  <p class="mr-1">GitHub</p>
                </a>
            </span>
        </div>
        <div class="w-full flex flex-col">
            <img src="/image/mockup.png" alt="Sepurito App Mockup" class="w-full h-auto mt-6 md:mt-0" />
        </div>
    </div>
</template>