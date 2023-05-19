<script lang="ts">
  import { toggleTheme } from '$lib/dark-mode';
  import { Sun, SunFilled } from '$lib/icons';
  import { PUBLIC_DEV_BANNER_MESSAGE } from '$env/static/public';
  import MenuIcon from '$lib/icons/menu-icon.svelte';
</script>

<header
  class="min-h-12 sticky top-0 z-10 flex items-center border-b-2 border-black bg-base-100 px-2 py-1 dark:border-white"
>
  <div class="container mx-auto my-auto flex items-center gap-2">
    <a href="/" class="text-2xl font-bold text-red-500">#supportlocal</a>
    <button class="ml-auto grid" on:click={toggleTheme}>
      <span class="sun sun-normal">
        <Sun />
      </span>
      <span class="sun sun-filled">
        <SunFilled />
      </span>
    </button>
    <div class="dropdown-end dropdown">
      <button class="btn-ghost btn-sm btn">
        <MenuIcon />
      </button>
      <ul
        class="dropdown-content menu mt-4 w-52 rounded-2xl bg-neutral-50 p-1 shadow dark:bg-neutral-700"
      >
        <slot name="menu">
          <li><a href="/biz/login">Business login</a></li>
          <li><a href="https://github.com/darrelhong/supportlocal">View on GitHub</a></li>
        </slot>
      </ul>
    </div>
  </div>
</header>

<div
  class="prose mx-auto w-full px-[var(--content-padding-x)] py-[var(--content-padding-y)] md:px-0"
>
  <slot />
</div>

<footer class="footer">
  {#if PUBLIC_DEV_BANNER_MESSAGE}
    <div class="w-full bg-error">
      <p class="text-xs">{PUBLIC_DEV_BANNER_MESSAGE}</p>
    </div>
  {/if}
</footer>

<style>
  .sun {
    grid-row-start: 1;
    grid-column-start: 1;
    transition: rotate 300ms, opacity 150ms;
  }

  :global(html[data-theme='dark']) .sun-filled {
    opacity: 0;
    rotate: 0;
  }
  :global(html[data-theme='dark']) .sun-filled {
    rotate: 45deg;
  }

  :global(html[data-theme='light']) .sun-normal {
    opacity: 0;
  }
  :global(html[data-theme='light']) .sun-normal {
    rotate: -45deg;
  }
</style>
