<script lang="ts">
  import { browser } from '$app/environment';
  import { goto } from '$app/navigation';
  import { page } from '$app/stores';

  export let data;

  $: {
    if (browser) {
      if (data.session) {
        goto(`/biz/dashboard${$page.url.searchParams.get('signup') ? '?signup=true' : ''}`);
      } else {
        goto('/biz/login');
      }
    }
  }
</script>

<p>Redirecting, do not close this page</p>
