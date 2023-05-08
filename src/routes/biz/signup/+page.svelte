<script lang="ts">
  import type { PageData } from './$types';
  import { goto } from '$app/navigation';

  export let data: PageData;

  $: ({ supabase } = data);

  let errorMessage = '';
</script>

<h2 class="mt-2">Sign up as business owner</h2>

<form
  class="sm:w-96"
  on:submit|preventDefault={async (e) => {
    const formData = new FormData(e.currentTarget);

    const email = formData.get('email');

    if (!email || typeof email !== 'string') {
      console.info('Email is missing');
      return;
    }

    const { error } = await supabase.auth.signInWithOtp({
      email,
      options: { emailRedirectTo: `${window.location.origin}/biz/logging-in` }
    });

    if (error) {
      errorMessage = 'An error occurred. Please try again later.';
    } else {
      goto('/biz/signup/success');
    }
  }}
>
  <div class="grid">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" required class="input-custom w-full" />
  </div>
  <button class="btn-primary btn mt-4">Get verify email link</button>
  {#if errorMessage}
    <p class="text-sm text-error">{errorMessage}</p>
  {/if}
</form>

<a href="/biz/login" class="mt-8 inline-block text-sm text-neutral"
  >Already have and account? Click here to sign in</a
>
