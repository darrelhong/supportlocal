import { redirect, type Handle } from '@sveltejs/kit';
import { PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY } from '$env/static/public';
import { createServerClient } from '@supabase/ssr';

export const handle = (async ({ event, resolve }) => {
  event.locals.supabase = createServerClient(PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY, {
    cookies: {
      get: (key) => event.cookies.get(key),
      set: (key, value, options) => {
        event.cookies.set(key, value, options);
      },
      remove: (key, options) => {
        event.cookies.delete(key, options);
      }
    }
  });

  // helper function to get session
  event.locals.getSession = async () => {
    const {
      data: { session }
    } = await event.locals.supabase.auth.getSession();
    return session;
  };

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
      cookieTheme === 'dark' ? html.replace('data-theme="light"', 'data-theme="dark"') : html,
    filterSerializedResponseHeaders: (name) => name === 'content-range'
  });
}) satisfies Handle;
