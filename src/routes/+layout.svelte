<script>
  import '../app.css';
  import { themeStore, toggleTheme } from '$lib/dark-mode';
  import { Sun, SunFilled } from '$lib/icons';

  let theme = '';
  themeStore.subscribe((value) => (theme = value));
</script>

<header
  class="min-h-12 sticky top-0 flex items-center bg-base-100 px-2 py-1 shadow dark:shadow-neutral-900/60"
>
  <div class="container mx-auto my-auto flex items-center">
    <a href="/" class="text-2xl font-bold text-red-500">#supportlocal</a>
    <button class="ml-auto" on:click={toggleTheme}>
      {#if theme === 'dark'}
        <Sun />
      {:else}
        <SunFilled />
      {/if}
    </button>
  </div>
</header>

<slot />
