import type { LayoutLoad } from './$types';
import { loadSupabaseSession } from '$lib/layout-load-supabase';

export const load = (async ({ fetch, data, depends }) => {
  depends('supabase:auth');

  const { supabase, session } = await loadSupabaseSession(fetch, data);

  return { supabase, session };
}) satisfies LayoutLoad;
