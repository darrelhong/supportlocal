import { redirect, type RequestHandler } from '@sveltejs/kit';

export const handleAuthCallback = ({ signup }: { signup: boolean }) =>
  (async ({ url, locals: { supabase } }) => {
    const code = url.searchParams.get('code');

    if (code) {
      const { error } = await supabase.auth.exchangeCodeForSession(code);
      console.error(error);
      if (error) {
        throw redirect(303, '/login');
      }

      throw redirect(303, `/biz/dashboard${signup ? '?signup=true' : ''}`);
    }

    throw redirect(303, '/');
  }) satisfies RequestHandler;
