import { nextTick, onMounted, onUnmounted, ref } from 'vue';
import { ScrollSmoother } from 'gsap/ScrollSmoother';

export function useSmoother(config) {
  if (typeof window !== 'undefined') {
    window.scrollTo(0, 0);
  }
  let smoother = ref();

  onMounted(async () => {
    await nextTick();
    smoother.value = ScrollSmoother.create(config);
  });

  onUnmounted(() => {
    smoother.value && smoother.value.kill();
  });

  return { smoother };
}
