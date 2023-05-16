import type { PageServerLoad } from './$types';

const PAGE_SIZE = 10;

export const load = (async ({ locals: { supabase }, url }) => {
  const page = parseInt(url.searchParams.get('page') || '1');

  const { data, error } = await supabase
    .from('listings')
    .select('id, title, description_short, description_long, hero_image_url, verified')
    .order('inserted_at', { ascending: false })
    .range((page - 1) * PAGE_SIZE, page * PAGE_SIZE);

  console.error(error);
  return {
    page,
    listings: data
  };
}) satisfies PageServerLoad;
