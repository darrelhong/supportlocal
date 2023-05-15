import type { PageServerLoad } from './$types';

export const load = (async ({ locals: { supabase } }) => {
  const { data, error } = await supabase
    .from('listings')
    .select('id, title, description_short, description_long, hero_image_url, verified')
    .order('inserted_at', { ascending: false })
    .limit(10);

  console.error(error);
  return {
    listings: data
  };
}) satisfies PageServerLoad;
