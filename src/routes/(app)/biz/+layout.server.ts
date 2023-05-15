import type { LayoutServerLoad } from './$types';

export const load = (async ({ locals }) => {
  return {
    session: (await locals.supabase.auth.getSession()).data.session
  };
}) satisfies LayoutServerLoad;
