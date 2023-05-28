<script lang="ts">
  import { PUBLIC_SUPABASE_URL } from '$env/static/public';
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ listings, page } = data);
</script>

<h2 class="text-center">Discover your favourite local businesses</h2>

<form class="flex justify-center" action="./">
  <input
    name="q"
    class="input mb-6 mt-2 w-full max-w-md border-2 border-black text-base-content dark:border-white"
    placeholder="Enter a search term e.g. 'coffee'"
  />
</form>

{#if !listings}
  <p>Failed to load listings</p>
{:else if listings.length === 0}
  <h4>No listings found!</h4>
  <a href="/">Home</a>
{:else}
  <!-- listing grid -->
  <div class="not-prose grid gap-1.5 sm:grid-cols-2 sm:gap-y-3">
    {#each listings.slice(0, 10) as listing}
      <!-- listing card -->
      <a href="details/{listing.id}">
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
      </a>
    {/each}
  </div>
  <!-- pagination -->
  <div class="mt-4 flex">
    {#if page > 1}
      <a href="?page={page - 1}" class="btn-secondary btn self-start">Prev page</a>
    {/if}
    {#if listings.length > 10}
      <a href="?page={page + 1}" class="btn-accent btn ms-auto">Next page</a>
    {/if}
  </div>
{/if}
