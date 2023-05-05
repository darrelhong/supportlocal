<script>
  import { toggleTheme } from '$lib/dark-mode';
</script>

<div class="prose mx-auto">
  <h1>Welcome to SvelteKit</h1>
  <p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
  <button class="btn" on:click={toggleTheme}>Button</button>
  <button class="btn-primary btn">Primary</button>
  <button class="btn-secondary btn">Secondary</button>
  <button class="btn-accent btn">Accent</button>
  <button class="btn-ghost btn">Ghost</button>
  <button class="btn-link btn">Link</button>
</div>
