<script lang="ts">
  import type { PageData } from './$types';

  export let data: PageData;

  $: ({ session } = data);
</script>

<h4>{`${session?.user.email}'s dashboard`}</h4>
