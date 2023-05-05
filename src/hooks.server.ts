import type { Handle } from '@sveltejs/kit';

export const handle = (async ({ event, resolve }) => {
  const cookieTheme = event.cookies.get('theme');

  return await resolve(event, {
    // dark mode ssr
    transformPageChunk: ({ html }) =>
      cookieTheme === 'dark' ? html.replace('data-theme=""', 'data-theme="dark"') : html
  });
}) satisfies Handle;
