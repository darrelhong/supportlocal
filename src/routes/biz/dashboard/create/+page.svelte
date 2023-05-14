<script>
  import { enhance } from '$app/forms';
  import { goto } from '$app/navigation';

  export let form;

  let loading = false;
</script>

<h2 class="mt-0">Create new listing</h2>

<form
  method="POST"
  enctype="multipart/form-data"
  use:enhance={() => {
    loading = true;

    return async ({ update }) => {
      await update();
      loading = false;
    };
  }}
>
  <div class="not-prose grid items-start gap-3 sm:grid-cols-2">
    <div class="grid">
      <label for="title">Title<span class="text-error">*</span></label>
      <input type="text" required id="title" name="title" class="input-custom" maxlength="140" />
    </div>

    <div class="grid">
      <label for="description_short">Short description<span class="text-error">*</span></label>
      <input
        type="text"
        required
        id="description_short"
        name="description_short"
        class="input-custom"
        placeholder="Ice cream shop"
        maxlength="25"
      />
      <p class="mt-0.5 text-sm">What does your business sell?</p>
    </div>

    <div class="grid">
      <label for="description_long">Long description</label>
      <textarea
        id="description_long"
        name="description_long"
        class="input-custom"
        placeholder="Small and cozy cafe that has a charming and old-fashioned atmosphere."
      />
      <p class="mt-0.5 text-sm">Enter more details about your business</p>
    </div>

    <div class="grid">
      <label for="website_url">Website</label>
      <input
        type="url"
        maxlength="140"
        id="website_url"
        name="website_url"
        class="input-custom"
        placeholder="http://example.com"
      />
    </div>

    <div class="grid">
      <label for="google_maps_url">Google Maps URL</label>
      <input
        type="url"
        maxlength="300"
        id="google_maps_url"
        name="google_maps_url"
        class="input-custom w-full"
      />
      <p class="mt-0.5 text-sm">Link to your Google Maps profile for more details</p>
    </div>

    <div class="grid">
      <label for="hero_image">Main image</label>
      <input type="file" accept="image/*" id="hero_image" name="hero_image" class="input-custom" />
      <p class="mt-0.5 text-sm">This image will be displayed on the listing card</p>
    </div>

    <div class="grid">
      <label for="images">Supplementary images</label>
      <input
        type="file"
        accept="image/*"
        multiple
        id="images"
        name="images"
        class="input-custom"
        on:change={(e) => {
          if (e.currentTarget.files?.length && e.currentTarget.files.length > 3) {
            alert('Sorry, you can only select up to 3 images');
            e.currentTarget.value = '';
          }
        }}
      />
      <p class="mt-0.5 text-sm">You can upload up to 3 additional images</p>
    </div>

    <div class="grid">
      <label for="proof_of_ownership_doc">Proof of ownership<span class="text-error">*</span></label
      >
      <input
        type="file"
        accept="image/*,application/pdf"
        id="proof_of_ownership_doc"
        name="proof_of_ownership_doc"
        required
        class="input-custom"
      />
      <p class="mt-0.5 text-sm">
        Please upload a document to proof you own the business. <a
          class="link-secondary link"
          href="https://www.acra.gov.sg/how-to-guides/buying-information/certificates"
          target="_blank">Learn more</a
        >
      </p>
    </div>
  </div>
  <p class="mt-2 leading-5">
    Note: Your listing will only be visible publicly after it is verified. Please ensure that you
    have selected a valid business registration document.
  </p>

  <button class="btn-primary btn" class:loading>Create listing</button>

  {#if form?.error}
    <p class="mt-2 text-error">{form.error}</p>
  {/if}
</form>
