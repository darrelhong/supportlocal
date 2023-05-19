<script lang="ts">
  import { onMount } from 'svelte';
  import { page } from '$app/stores';
  import { goto } from '$app/navigation';
  import { PUBLIC_SUPABASE_URL } from '$env/static/public';
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ session, listings } = data);
  $: ({ user } = session);

  onMount(() => {
    const params = $page.url.searchParams;
    // remove signup param from url
    params.delete('signup');
    if (params.toString()) goto(`?${params.toString()}`);
    else goto('dashboard');
  });
</script>

<h3>{`${user.email}'s dashboard`}</h3>

{#if $page.url.searchParams.get('signup')}
  <p class="text-sm text-success">Successfully verified email</p>
{/if}

<div class="mb-2 flex items-center justify-between">
  <h2 class="m-0">Your listings</h2>
  <a href="dashboard/create" class="btn-neutral btn">Create new listing</a>
</div>

{#if !listings}
  <p>Failed to load listings</p>
{:else}
  <div class="not-prose grid grid-cols-1 gap-2 sm:block sm:columns-2">
    {#each listings as listing}
      <a href="/details/{listing.id}">
        <div class="mb-2 rounded-md bg-black dark:bg-white">
          <div
            class="overflow-hidden rounded-md border-2 border-black bg-base-100 pb-2 transition-transform hover:-translate-x-1 hover:-translate-y-1 dark:border-white"
          >
            <img
              src={listing.hero_image_url?.includes('http')
                ? listing.hero_image_url
                : `${PUBLIC_SUPABASE_URL}/storage/v1/object/public/listing-images/${listing.hero_image_url}`}
              alt="Listing"
              class="w-full object-cover"
            />
            <div class="px-2 pt-2">
              <h3 class="text-xl font-semibold text-base-content">{listing.title}</h3>
              <p class="text-base-content">{listing.description_short}</p>
              <p class="truncate text-sm">{listing.description_long}</p>
              <div class="mt-1 flex items-end">
                {#if !listing.verified}
                  <span class="text-sm text-error">Pending approval</span>
                {/if}
                <a href="" class="btn-accent btn-sm btn ms-auto opacity-50">Edit</a>
              </div>
            </div>
          </div>
        </div>
      </a>
    {/each}
  </div>
{/if}
