import type { Handle } from '@sveltejs/kit';
import { PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY } from '$env/static/public';
import { createSupabaseServerClient } from '@supabase/auth-helpers-sveltekit';

export const handle = (async ({ event, resolve }) => {
  event.locals.supabase = createSupabaseServerClient({
    supabaseUrl: PUBLIC_SUPABASE_URL,
    supabaseKey: PUBLIC_SUPABASE_ANON_KEY,
    event
  });

  const cookieTheme = event.cookies.get('theme');

  return await resolve(event, {
    // dark mode ssr
    transformPageChunk: ({ html }) =>
      cookieTheme === 'dark' ? html.replace('data-theme="light"', 'data-theme="dark"') : html
  });
}) satisfies Handle;
