<script lang="ts">
  import { page } from '$app/stores';
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ session } = data);
</script>

<h3>{`${session?.user.email}'s dashboard`}</h3>
{#if $page.url.searchParams.get('signup')}
  <p class="text-sm text-success">Successfully verified email</p>
{/if}
