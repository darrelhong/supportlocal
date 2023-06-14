import type { PageServerLoad } from './$types';

const PAGE_SIZE = 10;

export const load = (async ({ locals: { supabase }, url }) => {
  const pageNum = parseInt(url.searchParams.get('page') || '1');
  const searchQuery = url.searchParams.get('q') || undefined;
  const sort = url.searchParams.get('sort') || undefined;

  const { data, error } = searchQuery
    ? await supabase
        .rpc('search_listings', { term: searchQuery })
        .select(
          'id, title, description_short, description_long, hero_image_url, verified, inserted_at'
        )
        .order('inserted_at', { ascending: sort === 'oldest' ? true : false })
        .range((pageNum - 1) * PAGE_SIZE, pageNum * PAGE_SIZE)
    : await supabase
        .from('listings')
        .select('id, title, description_short, description_long, hero_image_url, verified')
        .order('inserted_at', { ascending: sort === 'oldest' ? true : false })
        .range((pageNum - 1) * PAGE_SIZE, pageNum * PAGE_SIZE);

  console.error(error);

  const currentParams = {
    ...(sort && { sort }),
    ...(searchQuery && { q: searchQuery })
  };

  let prevPageParams;
  if (pageNum > 1) {
    prevPageParams = new URLSearchParams({
      ...currentParams,
      page: (pageNum - 1).toString()
    }).toString();
  }

  let nextPageParams;
  if (data && data.length > 10) {
    nextPageParams = new URLSearchParams({
      ...currentParams,
      page: (pageNum + 1).toString()
    }).toString();
  }

  return {
    prevPageParams,
    nextPageParams,
    listings: data
  };
}) satisfies PageServerLoad;
