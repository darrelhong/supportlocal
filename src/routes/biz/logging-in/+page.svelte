<script lang="ts">
  import { browser } from '$app/environment';
  import { goto } from '$app/navigation';

  export let data;
  $: {
    if (browser) {
      if (data.session) {
        goto('/biz/dashboard');
      } else {
        goto('/biz/login');
      }
    }
  }
</script>

<p>Redirecting, do not close this page</p>
