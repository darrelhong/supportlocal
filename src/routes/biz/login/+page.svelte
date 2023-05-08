<script lang="ts">
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ supabase } = data);
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

    const { data, error } = await supabase.auth.signInWithOtp({ email });

    console.log({ data, error });
  }}
>
  <div class="grid">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" required class="input-custom w-full" />
  </div>
  <button class="btn-primary btn mt-4">Get login link</button>
</form>

<a href="/biz/signup" class="mt-8 inline-block text-sm text-neutral">Sign up as business owner</a>
