import type { PageServerLoad } from './$types';

export const load = (async ({ parent, locals: { supabase } }) => {
  const { session } = await parent();

  const { data, error } = await supabase
    .from('listings')
    .select('id, title, description_short, description_long, hero_image_url, verified')
    .eq('profile_id', session.user.id)
    .order('inserted_at', { ascending: false });

  if (error) {
    console.error(error);
  }

  return {
    listings: data
  };
}) satisfies PageServerLoad;
