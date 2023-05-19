<script lang="ts">
  import { PUBLIC_SUPABASE_URL } from '$env/static/public';
  import ExternalLink from '$lib/icons/external-link.svelte';
  import { MapPinFilled } from '$lib/icons';
  import type { PageData } from './$types';
  export let data: PageData;

  $: ({ listing } = data);
</script>

<div
  class="not-prose -mx-[var(--content-padding-x)] -mt-[var(--content-padding-y)] mb-5 flex max-h-[55vh] min-h-[max(12rem,_30vh)] justify-center"
>
  <img
    src={listing.hero_image_url?.includes('http')
      ? listing.hero_image_url
      : `${PUBLIC_SUPABASE_URL}/storage/v1/object/public/listing-images/${listing.hero_image_url}`}
    alt="Listing main"
    class="object-cover"
  />
</div>

{#if !listing.verified}
  <p class="text-error">This listing is pending approval. It is only visible to you.</p>
{/if}
<h1>{listing.title}</h1>
<h3>{listing.description_short}</h3>
<p>{listing.description_long}</p>
<a href={listing.website_url} target="_blank" class="break-all"
  >{listing.website_url}<ExternalLink class="mb-0.5 ms-1 inline" /></a
>

<a href={listing.google_maps_url} class="mt-2 block" target="_blank"
  ><MapPinFilled class="mb-0.5 me-1 inline" />Open in Google Maps</a
>

{#if listing.images?.length}
  <h4>More images</h4>
  {#each listing.images as url}
    <img
      src={url?.includes('http')
        ? url
        : `${PUBLIC_SUPABASE_URL}/storage/v1/object/public/listing-images/${url}`}
      alt="Supplementary "
    />
  {/each}
{/if}
