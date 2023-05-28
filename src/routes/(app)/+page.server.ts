import type { PageServerLoad } from './$types';

const PAGE_SIZE = 10;

export const load = (async ({ locals: { supabase }, url }) => {
  const page = parseInt(url.searchParams.get('page') || '1');
  const searchQuery = url.searchParams.get('q');

  let data, error;

  if (!searchQuery) {
    const { data: defaultData, error } = await supabase
      .from('listings')
      .select('id, title, description_short, description_long, hero_image_url, verified')
      .order('inserted_at', { ascending: false })
      .range((page - 1) * PAGE_SIZE, page * PAGE_SIZE);

    console.error(error);

    data = defaultData;
  } else {
    const { data: searchData } = await supabase.rpc('search_listings', {
      term: url.searchParams.get('q') || ''
    });

    console.error(error);

    data = searchData;
  }

  return {
    page,
    listings: data
  };
}) satisfies PageServerLoad;
