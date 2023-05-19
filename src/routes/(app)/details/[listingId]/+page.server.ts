import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';

export const load = (async ({ params, locals: { supabase } }) => {
  const { listingId } = params;
  const { data, error: fetchListingError } = await supabase
    .from('listings')
    .select(
      'id, title, description_short, description_long, hero_image_url, images, verified, website_url, google_maps_url, verified'
    )
    .eq('id', listingId)
    .single();

  if (fetchListingError) {
    console.error(fetchListingError);
    if (fetchListingError.code === 'PGRST116') {
      throw error(404, {
        message: 'These are not the droids you are looking for.'
      });
    } else {
      throw error(500, {
        message: 'Something went wrong. Please try again later.'
      });
    }
  }

  return {
    listing: data
  };
}) satisfies PageServerLoad;
