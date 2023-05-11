<script lang="ts">
  import { page } from '$app/stores';
  import { onMount } from 'svelte';
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ session } = data);
  $: ({ user } = session);

  onMount(() => {
    const params = $page.url.searchParams;
    params.delete('signup');
    history.replaceState(
      null,
      '',
      `${$page.url.pathname}${params.toString() && `?${params.toString()}`}`
    );
  });
</script>

<h3>{`${session?.user.email}'s dashboard`}</h3>
{#if $page.url.searchParams.get('signup')}
  <p class="text-sm text-success">Successfully verified email</p>
{/if}
