<script lang="ts">
  import { onMount } from 'svelte';
  import { goto, invalidate } from '$app/navigation';

  import Layout from '$lib/components/Layout.svelte';
  import type { LayoutData } from './$types';

  export let data: LayoutData;

  $: ({ supabase, session } = data);

  onMount(() => {
    const {
      data: { subscription }
    } = supabase.auth.onAuthStateChange((_, _session) => {
      if (_session?.expires_at !== session?.expires_at) {
        invalidate('supabase:auth');
      }
    });

    return () => subscription.unsubscribe();
  });
</script>

<Layout>
  <slot />

  <svelte:fragment slot="menu">
    <li>
      <a href="/biz/dashboard">Dashboard</a>
    </li>
    <li>
      <button
        on:click={async () => {
          const { error } = await supabase.auth.signOut();

          if (error) {
            console.error(error);
            return;
          }

          goto('/');
        }}>Log out</button
      >
    </li>
  </svelte:fragment>
</Layout>
