import { redirect, type Handle } from '@sveltejs/kit';
import { PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY } from '$env/static/public';
import { createSupabaseServerClient } from '@supabase/auth-helpers-sveltekit';

export const handle = (async ({ event, resolve }) => {
  event.locals.supabase = createSupabaseServerClient({
    supabaseUrl: PUBLIC_SUPABASE_URL,
    supabaseKey: PUBLIC_SUPABASE_ANON_KEY,
    event
  });

  // protect biz/dashboard routes
  if (event.url.pathname.startsWith('/biz/dashboard')) {
    const session = (await event.locals.supabase.auth.getSession()).data.session;
    if (!session) {
      throw redirect(303, '/biz/login');
    }
  }

  const cookieTheme = event.cookies.get('theme');

  return await resolve(event, {
    // dark mode ssr
    transformPageChunk: ({ html }) =>
      cookieTheme === 'dark' ? html.replace('data-theme="light"', 'data-theme="dark"') : html
  });
}) satisfies Handle;
