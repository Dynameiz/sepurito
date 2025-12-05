<template>
    <div class="w-full min-h-screen max-h-screen max-w-6xl mx-auto px-16 py-32 grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
        
        <div class="flex flex-col text-center md:text-left">
            <h1 class="text-5xl md:text-6xl lg:text-7xl font-bold text-center md:text-left text-[#05df72]">
                Sepurito
            </h1>
            <p class="mt-6 text-base md:text-lg text-white/70 md:text-justify">
                Split bills quickly and fairly with Sepurito. Sepurito makes it easy to divide expenses among friends, ensuring everyone pays their fair share without the hassle.
            </p>
            <div class="flex flex-col sm:flex-row gap-4 mt-10 mx-auto md:mx-0">
                
                <button
                    class="w-full sm:w-48 flex flex-row justify-center gap-2 items-center px-4 py-3 bg-primary/80 text-white font-semibold rounded-md hover:bg-primary/50 shadow-lg shadow-transparent hover:shadow-primary-950 transition duration-300 cursor-pointer">
                    <Icon name="mdi:android" size="24" />
                    <p>Download Apk</p>
                </button>

                <a
                    href="https://github.com/Dynameiz/sepurito"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="w-full sm:w-48 flex flex-row justify-center gap-2 items-center px-4 py-3 bg-gray-700/60 text-white font-semibold rounded-md hover:bg-gray-700/50 shadow-lg shadow-transparent hover:shadow-black/80 transition duration-300">
                    <Icon name="mdi:github" size="24" />
                    <p class="mr-1">GitHub</p>
                </a>
            </div>
        </div>
        <div class="flex justify-center">
            <img
                src="/image/mockup.png"
                alt="Sepurito App Mockup"
                class="w-64 sm:w-80 md:w-full h-auto drop-shadow-xl animate-float"
            />
        </div>
    </div>
</template>