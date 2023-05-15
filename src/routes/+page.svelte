<script lang="ts">
  import { PUBLIC_SUPABASE_URL } from '$env/static/public';
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ listings } = data);
</script>

<h2 class="text-center">Discover your favourite local businesses</h2>

{#if !listings}
  <p>Failed to load listings</p>
{:else}
  <div class="not-prose grid gap-1.5 sm:grid-cols-2 sm:gap-y-3">
    {#each listings as listing}
      <div class="rounded-md bg-black dark:bg-white">
        <div
          class="h-full overflow-hidden rounded-md border-2 border-black bg-base-100 pb-2 transition-transform hover:-translate-x-1 hover:-translate-y-1 dark:border-white"
        >
          <img
            src={listing.hero_image_url?.includes('http')
              ? listing.hero_image_url
              : `${PUBLIC_SUPABASE_URL}/storage/v1/object/public/listing-images/${listing.hero_image_url}`}
            alt="Listing"
            class="aspect-[3/2] w-full object-cover"
          />
          <div class="px-2 pt-2">
            <h3 class="text-xl font-semibold text-base-content">{listing.title}</h3>
            <p class="text-base-content">{listing.description_short}</p>
            <div class="mt-1 flex items-end">
              {#if !listing.verified}
                <span class="text-sm text-error">Only visible to you</span>
              {/if}
            </div>
          </div>
        </div>
      </div>
    {/each}
  </div>
{/if}
