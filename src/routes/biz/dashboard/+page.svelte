<script lang="ts">
  import { page } from '$app/stores';
  import { onMount } from 'svelte';
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ session } = data);
  $: ({ user } = session);

  onMount(() => {
    const params = $page.url.searchParams;
    params.delete('signup');
    history.replaceState(
      null,
      '',
      `${$page.url.pathname}${params.toString() && `?${params.toString()}`}`
    );
  });
</script>

<h3>{`${user.email}'s dashboard`}</h3>

{#if $page.url.searchParams.get('signup')}
  <p class="text-sm text-success">Successfully verified email</p>
{/if}

<div class="flex items-center justify-between p-2">
  <h2 class="m-0">Your listings</h2>
  <a href="dashboard/create" class="btn-neutral btn">Create new listing</a>
</div>

<div class="gap-2 sm:columns-2 sm:grid-cols-2">
  {#each Array(10).fill(0) as _, i}
    <div
      class="mb-2 overflow-hidden rounded-md border-2 border-black pb-2 prose-img:m-0 dark:border-white sm:border-2"
    >
      <img
        src="https://picsum.photos/seed/{i + 1}/{Math.floor(
          Math.random() * (500 - 200) + 200
        )}/{Math.floor(Math.random() * (400 - 300) + 300)}"
        alt="Listing"
        class="w-full object-cover"
      />
      <div class="px-2 pt-2 prose-h3:m-0 prose-p:leading-5">
        <h3 class="text-xl font-semibold">Listing title</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.</p>
        <div class="flex justify-end">
          <a href="edit" class="btn-accent btn-sm btn">Edit</a>
        </div>
      </div>
    </div>
  {/each}
</div>
