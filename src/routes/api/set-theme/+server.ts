import type { RequestHandler } from '@sveltejs/kit';

export const PUT: RequestHandler = async ({ request, cookies }) => {
  const { theme } = await request.json();
  cookies.set('theme', theme, { path: '/', maxAge: 60 * 60 * 24 * 365 });
  return new Response(null, { status: 204 });
};
