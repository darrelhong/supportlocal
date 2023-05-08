<script lang="ts">
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ supabase } = data);

  let isError = false;
  let message = '';
</script>

<h2 class="mt-2">Login as business owner</h2>

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
      isError = true;
      message = 'An error occurred. Please try again later.';
    } else {
      message = "We've sent you a login link. Please click on it to login.";
    }
  }}
>
  <div class="grid">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" required class="input-custom w-full" />
  </div>
  <button class="btn-primary btn mt-4">Get login link</button>
  <p class={`text-sm ${isError ? 'text-error' : 'text-success'}`}>{message}</p>
</form>

<a href="/biz/signup" class="mt-8 inline-block text-sm text-neutral">Sign up as business owner</a>
