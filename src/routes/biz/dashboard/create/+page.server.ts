import type { Actions } from './$types';
import { fail, redirect } from '@sveltejs/kit';

const ERROR_MESSAGE = 'An error occurred while creating your listing. Please try again.';

export const actions = {
  default: async ({ request, locals: { supabase, getSession } }) => {
    const session = await getSession();

    // verify that the user is logged in
    if (!session) {
      throw redirect(303, '/biz/login');
    }

    const formData = await request.formData();

    // validate that form has proof of ownership document
    const proof_of_ownership_doc = formData.get('proof_of_ownership_doc') as File;
    if (!proof_of_ownership_doc) {
      return fail(422, {
        error: 'Proof of ownership document is required.'
      });
    }
    const images = formData.getAll('images') as File[];
    if (images.length > 3) {
      return fail(422, {
        error: 'You can only upload up to 3 additional images.'
      });
    }

    const title = formData.get('title') as string;
    const description_short = formData.get('description_short') as string;
    const description_long = formData.get('description_long') as string;
    const website_url = formData.get('website_url') as string;
    const google_maps_url = formData.get('google_maps_url') as string;

    // write listing to database to obtain listingId
    const { error, data } = await supabase
      .from('listings')
      .insert([
        {
          title,
          description_short,
          description_long,
          website_url,
          google_maps_url,
          profile_id: session.user.id
        }
      ])
      .select();

    if (error) {
      console.error(error);
      return fail(500, {
        error: ERROR_MESSAGE
      });
    }

    const listingId = data[0].id;

    // store proof of ownership document
    const proofOfOwnershipDocStorageResp = await supabase.storage
      .from('proof-of-ownership')
      .upload(`${listingId}/${proof_of_ownership_doc.name}`, proof_of_ownership_doc);

    if (proofOfOwnershipDocStorageResp.error) {
      console.error(proofOfOwnershipDocStorageResp.error);
      return fail(500, {
        error: ERROR_MESSAGE
      });
    }

    // store hero iamge
    const hero_image = formData.get('hero_image') as File;
    let heroImagePath;
    if (hero_image) {
      const heroImageExt = hero_image.name.split('.').pop();
      const heroImageStorageResp = await supabase.storage
        .from('listing-images')
        .upload(`${listingId}/hero-image.${heroImageExt}`, hero_image);

      if (heroImageStorageResp.error) {
        console.error(heroImageStorageResp.error);
        return fail(500, {
          error: ERROR_MESSAGE
        });
      }

      heroImagePath = heroImageStorageResp.data.path;
    }

    // store additional images
    const imagesPaths: string[] = [];
    for (const [index, image] of images.entries()) {
      const imageExt = hero_image.name.split('.').pop();

      const imageStorageResp = await supabase.storage
        .from('listing-images')
        .upload(`${listingId}/image-${index}.${imageExt}`, image);

      if (imageStorageResp.error) {
        console.error(imageStorageResp.error);
        return fail(500, {
          error: ERROR_MESSAGE
        });
      }

      imagesPaths.push(imageStorageResp.data.path);
    }

    // update listing with file urls
    const updateListingWithFilesResp = await supabase
      .from('listings')
      .update({
        proof_of_ownership_doc_url: proofOfOwnershipDocStorageResp.data.path,
        ...(heroImagePath && { hero_image_url: heroImagePath }),
        images: imagesPaths
      })
      .eq('id', listingId);

    if (updateListingWithFilesResp.error) {
      console.error(updateListingWithFilesResp.error);
      return fail(500, {
        error: ERROR_MESSAGE
      });
    }

    return { success: true };
  }
} satisfies Actions;
