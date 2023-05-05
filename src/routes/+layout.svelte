<script>
  import '../app.css';
  import { toggleTheme } from '$lib/dark-mode';
</script>

<header
  class="min-h-12 sticky top-0 flex items-center bg-base-100 px-2 py-1 shadow dark:shadow-neutral-900/60"
>
  <div class="container mx-auto my-auto flex items-center">
    <a href="/" class="text-2xl font-bold text-red-500">#supportlocal</a>
    <button class="ml-auto" on:click={toggleTheme}>
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="24"
        height="24"
        viewBox="0 0 24 24"
        stroke-width="2"
        stroke="currentColor"
        fill="none"
        stroke-linecap="round"
        stroke-linejoin="round"
      >
        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
        <path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" />
        <path
          d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7"
        />
      </svg>
    </button>
  </div>
</header>

<slot />
