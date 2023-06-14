<script lang="ts">
  import { PUBLIC_SUPABASE_URL } from '$env/static/public';
  import type { PageData } from './$types';
  import { page } from '$app/stores';

  export let data: PageData;

  $: ({ listings, prevPageParams, nextPageParams } = data);
</script>

<h2 class="text-center">Discover your favourite local businesses</h2>

<form action="./">
  <div class="flex justify-center">
    <input
      name="q"
      value={$page.url.searchParams.get('q')}
      class="input mb-6 mt-2 w-full max-w-md border-2 border-black text-base-content dark:border-white"
      placeholder="Enter a search term e.g. 'coffee'"
    />
  </div>

  <div class="flex py-2">
    <select
      class="select border-2 border-black bg-accent text-base-100 dark:border-white"
      name="sort"
      value={$page.url.searchParams.get('sort') ?? ''}
    >
      <option disabled selected value="">Sort by</option>
      <option value="newest">Newest</option>
      <option value="oldest">Oldest</option>
    </select>
    <button class="btn ml-auto" type="submit">Apply</button>
  </div>
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
            <object
              class="aspect-[3/2] w-full object-cover"
              data={listing.hero_image_url?.includes('http')
                ? listing.hero_image_url
                : `${PUBLIC_SUPABASE_URL}/storage/v1/object/public/listing-images/${listing.hero_image_url}`}
              title="Listing"
              type="image/png"
            >
              <img alt="fallback" src="/fallback.png" class="aspect-[3/2] w-full object-cover" />
            </object>
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
    {#if prevPageParams}
      <a href="?{prevPageParams}" class="btn-secondary btn self-start">Prev page</a>
    {/if}
    {#if nextPageParams}
      <a href="?{nextPageParams}" class="btn-accent btn ms-auto">Next page</a>
    {/if}
  </div>
{/if}
