<script lang="ts">
  import type { PageData } from './$types';
  import { goto } from '$app/navigation';

  export let data: PageData;

  $: ({ supabase } = data);

  let errorMessage = '';
  let loading = false;
</script>

<h2 class="mt-2">Sign up as business owner</h2>

<form
  class="sm:w-96"
  on:submit|preventDefault={async (e) => {
    loading = true;
    const formData = new FormData(e.currentTarget);

    const email = formData.get('email');

    if (!email || typeof email !== 'string') {
      console.info('Email is missing');
      return;
    }

    const { error } = await supabase.auth.signInWithOtp({
      email,
      options: { emailRedirectTo: `${window.location.origin}/auth/callback-signup` }
    });

    loading = false;

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
  <button class="btn-primary btn mt-4" class:loading>Get verify email link</button>
  <p class="text-sm text-error">{errorMessage}</p>
</form>

<a href="/biz/login" class="mt-8 inline-block text-sm text-neutral"
  >Already have and account? Click here to sign in</a
>
<p class="text-xs text-error">
  Note: While this project is in development phase, you can freely create an account and post
  listings to test out the features
</p>
