<script>
  import '../app.css';
  import { themeStore, toggleTheme } from '$lib/dark-mode';
  import { Sun, SunFilled } from '$lib/icons';
  import { PUBLIC_HIDE_DEV_BANNER } from '$env/static/public';
  import MenuIcon from '$lib/icons/menu-icon.svelte';
  console.log(PUBLIC_HIDE_DEV_BANNER);

  let theme = '';
  themeStore.subscribe((value) => (theme = value));
</script>

<header
  class="min-h-12 sticky top-0 flex items-center bg-base-100 px-2 py-1 shadow dark:shadow-neutral-900/60"
>
  <div class="container mx-auto my-auto flex items-center gap-2">
    <a href="/" class="text-2xl font-bold text-red-500">#supportlocal</a>
    <button class="ml-auto grid" on:click={toggleTheme}>
      <Sun
        class={`col-start-1 row-start-1 transition-transform duration-300 ${
          theme === 'dark' ? 'rotate-0 opacity-0' : 'rotate-45'
        }`}
      />
      <SunFilled
        class={`col-start-1 row-start-1 transition-transform duration-300 ${
          theme === 'light' ? ' rotate-45 opacity-0' : 'rotate-0'
        }`}
      />
    </button>
    <div class="dropdown-end dropdown">
      <button class="btn-ghost btn-sm btn">
        <MenuIcon />
      </button>
      <ul class="dropdown-content menu rounded-box mt-4 w-52 bg-base-100 p-2 shadow">
        <li><a href="/biz/login">Business login</a></li>
      </ul>
    </div>
  </div>
</header>

<div class="prose mx-auto p-2">
  <slot />
</div>

<footer class="footer">
  {#if !PUBLIC_HIDE_DEV_BANNER}
    <div class="w-full bg-error">
      <p class="text-xs">This site is currently in development. Data may not be accurate</p>
    </div>
  {/if}
</footer>
