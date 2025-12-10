<script setup lang="ts">
  useHead({
    title: 'Sepurito',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { name: 'description', content: 'Split bills quickly and fairly with Sepurito.' },
      { name: 'robots', content: 'index, follow' },

      { property: 'og:type', content: 'website' },
      { property: 'og:title', content: 'Sepurito — Split bills with friends' },
      { property: 'og:description', content: 'Fair, fast, and clean bill splitting for groups.' },
      { property: 'og:image', content: '/images/sepurito-og.png' },

      { name: 'twitter:card', content: 'summary_large_image' },
      { name: 'twitter:title', content: 'Sepurito — Split bills with friends' },
      { name: 'twitter:description', content: 'Clean, fast, and fair bill splitting.' },
      { name: 'twitter:image', content: '/images/sepurito-og.png' },
    ],
    link: [
      { rel: 'canonical', href: 'https://sepurito.vercel.app' }
    ]
  })

  import gsap from 'gsap';
  import { ScrollTrigger } from 'gsap/ScrollTrigger';
  import { ScrollSmoother } from 'gsap/ScrollSmoother';
  import { ScrollToPlugin } from 'gsap/ScrollToPlugin';

  if (typeof window !== 'undefined') {
    gsap.registerPlugin(ScrollTrigger, ScrollSmoother, ScrollToPlugin);
  }

</script>

<template>
  <main id="smooth-wrapper" class="bg-[#171717] text-white w-full min-h-screen font-display">
    <Navbar />
    <Spotlight />
    <div id="smooth-content">
    <Transition name="page" mode="out-in">
        <NuxtPage />
      </Transition>
    </div>
  </main>
</template>