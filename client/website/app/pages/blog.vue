<script setup>
    import { nextTick, onMounted } from 'vue';
    import { useSmoother } from '../composables/useSmoother';

    const { smoother } = useSmoother({
        smooth: 2,
        effects: true,
    });

    onMounted(async () => {
    await nextTick();
    });
</script>

<template>
    <div class="w-full min-h-screen max-w-md sm:max-w-lg md:max-w-2xl lg:max-w-3xl mx-auto flex flex-col justify-start px-8">

        <span id="the-beginning" class="flex flex-row gap-2 text-xl md:text-3xl lg:text-4xl font-bold mt-24 md:mt-32 mb-5 md:mb-8 text-left">
            <h1>How It All</h1>
            <h1 class="text-[#05df72]">Began</h1>
        </span>

        <p class="text-sm md:text-lg text-justify indent-8">
            Spending time with friends—whether to eat, drink, or simply hang out—is one of my favorite things to do.
            But the moment the bill arrives, everything suddenly becomes complicated. Who ordered what? Who shared which item?
            And how much does each person actually owe?
        </p>

        <br />
        
        <p class="text-sm md:text-lg text-justify indent-8">
            Most groups have that one friend who becomes the unofficial accountant, manually splitting the bill every time.
            Fortunately, for the longest time, we relied on a tool that made this entire process painless:
            <b>LINE’s Split Bill</b> feature.
        </p>
        
        <br />

        <p class="text-sm md:text-lg text-justify indent-8">
            <b>Unfortunately</b>, on July 30, 2025, LINE announced that the Split Bill feature would be discontinued.
            It genuinely felt like losing a reliable friend. Sure, there are alternatives out there—but none felt quite right,
            especially for groups like ours.
        </p>

        <blockquote class="border-l-4 border-[#05df72] pl-4 italic my-8 bg-black/20 p-4 text-sm md:text-lg backdrop-blur-md">
            “Why not build my own bill-splitting app?”
        </blockquote>

        <p class="text-sm md:text-lg text-justify indent-8">
            And that simple question marked the beginning of <b class="text-[#05df72]">Sepurito</b>.  
            A lightweight, intuitive, and fair bill-splitting tool built to bring back the joy of going out with friends—
            without the stress of calculating who owes what.
        </p>

        <hr class="my-8">

        <span id="problem-understanding" class="flex flex-col md:flex-row gap-0 md:gap-2 text-xl md:text-3xl lg:text-4xl font-bold mb-5 md:mb-8 text-left">
            <h1 class="text-[#05df72]">Step 1</h1>
            <h1 class="hidden md:flex text-white/70">-</h1>
            <h1>Problem Understanding</h1>
        </span>

        <p class="text-sm md:text-lg text-justify">
            At first, building a bill-splitting app sounded straightforward.
        </p>
        <p class="text-sm md:text-lg text-justify mt-2">
            You scan a bill → get some numbers → divide among people → done.
        </p>

        <p class="text-sm md:text-lg text-justify mt-4">
            The more I dug into it, the more edge cases started showing up—except they weren’t actually edge cases. They were normal, everyday situations:
        </p>

        <ul class="list-disc pl-6 text-sm md:text-lg leading-relaxed mt-4">
            <li>Some people eat more than others.</li>
            <li>Some items are shared, some are not.</li>
            <li>How should tax and service charges be fairly distributed?</li>
            <li>What if the bill needs to be split unevenly?</li>
        </ul>

        <p class="text-sm md:text-lg text-justify mt-4">
            These aren’t edge cases—they’re everyday scenarios.  
            Addressing them properly is the key to building a bill-splitting app that works in real life,
            not just on paper.
        </p>

        <hr class="my-8">

        <span id="first-attempt" class="flex flex-col md:flex-row gap-0 md:gap-2 text-xl md:text-3xl lg:text-4xl font-bold mb-5 md:mb-8 text-left">
            <h1 class="text-[#05df72]">Step 2</h1>
            <h1 class="hidden md:flex text-white/70">-</h1>
            <h1>First Attempt: PaddleOCR + LLM</h1>
        </span>

        <p class="text-sm md:text-lg text-justify indent-8">
            Well, my initial thought on how the flow of the app would go was to take a picture of the bill,
            analyze it, and somehow extract the relevant data to split it among friends. Pretty straightforward, right?
        </p>

        <p class="text-sm md:text-lg text-justify indent-8 mt-4">
            In order to do that, I need to first extract the text from the image. After some research, I found out about
            <a href="https://www.paddleocr.ai/latest/en/index.html" class="text-[#05df72] underline" target="_blank" rel="noopener noreferrer">PaddleOCR</a>,
            an open-source OCR tool that supports multiple languages. I integrated it into a simple Python script to test its capabilities.
            I know that OCR alone won’t solve the entire problem, since I need to extract the relevant data from the text into a structured format.
            So, I decided to leverage a Large Language Model (LLM) to help with that. And I’ve decided to use
            <a href="https://ai.google.dev/gemini-api/docs/models#gemini-2.5-flash" class="text-[#05df72] underline" target="_blank" rel="noopener noreferrer">Gemini 2.5 Flash</a>.
        </p>
        
        <p class="text-sm md:text-lg text-justify indent-8 mt-4">
            After setting everything up, I ran a few tests with sample bills. Well, it did not go as planned.
            It’s not the fault of PaddleOCR or Gemini, but it was me all along. I do believe that these tools are powerful to solve the problem.
            Since I can not get good results with my initial prompts and code, I decided to switch my strategy.
        </p>

        <p class="text-sm md:text-lg text-justify mt-8 text-white/60">
            <b class="text-white/80">Future Plans:</b> I plan to revisit this approach later, refining the text recognition and prompt engineering.
        </p>

        <hr class="my-8">

        <span id="swtiching-things-up" class="flex flex-col md:flex-row gap-0 md:gap-2 text-xl md:text-3xl lg:text-4xl font-bold mb-5 md:mb-8 text-left">
            <h1 class="text-[#05df72]">Step 3</h1>
            <h1 class="hidden md:flex text-white/70">-</h1>
            <h1>Switching Things Up</h1>
        </span>

        <p class="text-sm md:text-lg text-justify indent-8">
            While I was exploring the first approach, a buddy of mine asked
            "Is there any OCR that can run fully on mobile? So it doesn’t need to hit an API."
            Then he sent me a link to a blog post about <a href="https://medium.com/@frojho/flutter-projects-05-building-an-optical-character-recognition-ocr-app-639c165f857d" target="_blank" rel="noopener noreferrer">Building an Optical Character Recognition (OCR) App</a>.
        </p>

        <p class="text-sm md:text-lg text-justify indent-8 mt-4">
            And that’s when I discovered <a href="https://pub.dev/packages/google_mlkit_text_recognition" class="text-[#05df72] underline" target="_blank" rel="noopener noreferrer">ML Kit’s on-device text recognition</a>.
            This package allows me to perform OCR directly on the user’s device, in other words it’s fully offline.
            This highly improves the speed of text recognition and also enhances user privacy since no data is sent to external servers.
            And also last but not least, it’s free to use!
        </p>

        <p class="text-sm md:text-lg text-justify indent-8 mt-4">
            OCR alone can only turn an image into text, but it doesn’t understand the context or structure of the bill.
            To extract meaningful data from the recognized text, I decided to use Firebase’s AI Logic to access the
            <a href="https://ai.google.dev/gemini-api/docs/models#gemini-2.5-flash-lite" class="text-[#05df72] underline" target="_blank" rel="noopener noreferrer">Gemini 2.5 Flash-Lite</a>.
            By sending the recognized text to the model with carefully crafted prompts, I can extract structured information such as the total amount, individual items, and their prices.
        </p>

        <hr class="my-8">

        <div id="to-be-continued" class="flex flex-col gap-2 my-8 md:my-16 text-center">
            <h1 class="text-white/75 text-xl md:text-3xl lg:text-4xl font-bold">To Be Continued...</h1>
            <p class="text-white/50 text-xs md:text-lg">Next up: The Design and Implementation of the User Interface</p>
        </div>

        <footer class="w-full flex justify-center items-center py-8">
            <p class="text-sm text-white/50">© 2025 Sepurito. All rights reserved.</p>
        </footer>
    </div>
</template>
