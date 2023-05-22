<script lang="ts">
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ supabase } = data);

  let isError = false;
  let message = '';
  let loading = false;
</script>

<h2 class="mt-2">Login as business owner</h2>

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
      options: {
        emailRedirectTo: `${window.location.origin}/biz/logging-in`,
        shouldCreateUser: false
      }
    });

    loading = false;

    if (error) {
      isError = true;
      message = 'An error occurred. Please try again later.';
    } else {
      message = "We've sent you a login link. Please click on it to login.";
      isError = false;
    }
  }}
>
  <div class="grid">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" required class="input-custom w-full" />
  </div>
  <button class="btn-primary btn mt-4" class:loading>Get login link</button>
  <p class="text-sm" class:text-error={isError} class:text-success={!isError}>{message}</p>
</form>

<a href="/biz/signup" class="mt-8 inline-block text-sm text-neutral">Sign up as business owner</a>
<p class="text-xs text-error">
  Note: While this project is in development phase, you can freely create an account and post
  listings to test out the features.
</p>
