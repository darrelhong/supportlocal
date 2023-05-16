INSERT INTO auth.users (
        instance_id,
        id,
        aud,
        role,
        email,
        encrypted_password,
        email_confirmed_at,
        invited_at,
        confirmation_token,
        confirmation_sent_at,
        recovery_token,
        recovery_sent_at,
        email_change_token_new,
        email_change,
        email_change_sent_at,
        last_sign_in_at,
        raw_app_meta_data,
        raw_user_meta_data,
        is_super_admin,
        created_at,
        updated_at,
        phone,
        phone_confirmed_at,
        phone_change,
        phone_change_token,
        phone_change_sent_at,
        email_change_token_current,
        email_change_confirm_status,
        banned_until,
        reauthentication_token,
        reauthentication_sent_at,
        is_sso_user,
        deleted_at
    )
VALUES (
        '00000000-0000-0000-0000-000000000000',
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'authenticated',
        'authenticated',
        'test@example.com',
        '$2a$10$y0Izvd6N/T56s5743rnAOulNghS/pmEkTQPMONizxxEiMvrTa3fwK',
        '2023-05-11 01:46:49.005348+00',
        NULL,
        '',
        '2023-05-11 01:45:11.984632+00',
        '',
        '2023-05-11 13:23:21.751985+00',
        '',
        '',
        NULL,
        '2023-05-11 13:23:33.43882+00',
        '{"provider": "email", "providers": ["email"]}',
        '{}',
        NULL,
        '2023-05-11 01:43:10.930954+00',
        '2023-05-12 00:13:01.125675+00',
        NULL,
        NULL,
        '',
        '',
        NULL,
        '',
        0,
        NULL,
        '',
        NULL,
        false,
        NULL
    );
--
INSERT INTO auth.identities (
id,
user_id,
identity_data,
provider,
last_sign_in_at,
created_at,
updated_at
)
VALUES (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        '{"sub": "b1a503db-0793-4f36-8b58-ac8af8c20648", "email": "test@example.com"}',
        'email',
        '2023-05-11 01:43:10.939733+00',
        '2023-05-11 01:43:10.939754+00',
        '2023-05-11 01:43:10.939754+00'
    );
--
--
UPDATE profiles
SET listing_limit = 20
WHERE id = 'b1a503db-0793-4f36-8b58-ac8af8c20648';
--
-- insert 8 mock listings
insert into listings (
        profile_id,
        title,
        description_short,
        description_long,
        website_url,
        google_maps_url,
        hero_image_url,
        images,
        inserted_at
    )
values (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Natter Coffee & Gelato',
        'Gelato cafe',
        'Specialty cafe that offers coffee and artisanal gelatos with carefully crafted flavours.',
        'https://danielfooddiary.com/2022/04/22/natter/',
        'https://www.google.com/maps/place/Natter+Coffee+%26+Gelato/@1.2777153,103.8434897,15z/data=!4m6!3m5!1s0x31da19c274b310f7:0xe1a05eb982c44561!8m2!3d1.2777153!4d103.8434897!16s%2Fg%2F11swmd6x2f',
        'https://eatbook.sg/wp-content/uploads/2023/02/natter-coffee-and-gelato-storefront.jpg',
        array ['https://picsum.photos/seed/1/478/379', 'https://picsum.photos/seed/2/389/490', 'https://picsum.photos/seed/3/367/347'],
        current_timestamp
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Cafe Monochrome',
        'Cafe',
        'Singapore''s first 2D cafe. Serving mains, specialty coffee, ice cream desserts and more.',
        'https://www.cafemonochrome.sg/',
        'https://goo.gl/maps/tooVYueCzH1hGryr7',
        'https://danielfooddiary.com/wp-content/uploads/2021/06/cafemonochrome20.jpg',
        array ['https://picsum.photos/seed/4/423/312', 'https://picsum.photos/seed/5/320/400', 'https://picsum.photos/seed/6/423/503'],
        current_timestamp - interval '1 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'The Social Space',
        'Cafe and retail store',
        'A socially conscious multi-concept store that houses a cafe, a fair trade retail area, a nail salon and a refillery.',
        'https://thesocialspace.co/',
        'https://goo.gl/maps/6Y5Y1Z4Z6Y5Y1Z4Z6',
        'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2047&q=80',
        array ['https://picsum.photos/seed/7/290/340', 'https://picsum.photos/seed/8/534/234', 'https://picsum.photos/seed/9/343/290'],
        current_timestamp - interval '2 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Creamier',
        'Ice cream cafe',
        'Ice cream cafe that serves handcrafted ice cream and freshly baked waffles.',
        'https://creamier.com.sg/',
        'https://goo.gl/maps/6Y5Y1Z4Z6Y5Y1Z4Z6',
        'https://i1.wp.com/creamier.com.sg/app/uploads/2019/10/WhatsApp-Image-2019-10-06-at-12.47.51-PM.jpeg?zoom=2&fit=1174%2C877&ssl=1',
        array ['https://media-cdn.tripadvisor.com/media/photo-p/1a/01/75/57/photo1jpg.jpg', 'https://danielfooddiary.com/wp-content/uploads/2016/03/creamier1.jpg'],
        current_timestamp - interval '3 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'HYSSES',
        'Aromatherapy',
        'HYSSES offers a wide range of essential oils, aromatherapy products and natural skincare.',
        'https://sg.hysses.com/',
        'https://goo.gl/maps/FY2cWFujqjW9MeNS9',
        'https://lh3.ggpht.com/p/AF1QipP8yIh2GRJX7qsEqImWeNLVobPFPI31rhxwvrfL=s1536',
        array ['https://cdn.shopify.com/s/files/1/0095/3745/4144/products/essential-oil-essential-oil-bergamot-10ml-5202953273408_1800x.jpg?v=1643139712', 'https://www.capitaland.com/content/dam/capitaland-media-library/retail/Singapore/Singapore/Junction%208/tenant_storefront/HYSSES.jpg.transform/cap-midres/image.jpg'],
        current_timestamp - interval '4 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Gryphon Tea Company',
        'Tea products',
        'Gryphon Tea Company traces its origins to a family-owned tea importer founded in Singapore almost 100 years ago. In 2006, a fourth-generation member of the family struck out on his own and the company quickly gained a following for its maverick ideas and heady enthusiasm. Gryphon Teas''s growing selection of tea recipes has received numerous industry awards and is now available to consumers worldwide through online shopping and our network of dedicated distribution partners.',
        'https://www.gryphontea.com/',
        null,
        'https://scontent.fsin15-1.fna.fbcdn.net/v/t39.30808-6/327115658_520814699901511_268616325478005554_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=W4x28xTcGO0AX-9BHRP&_nc_ht=scontent.fsin15-1.fna&oh=00_AfCxD-Ts8d2eCBLhQ3JCPlOkAqhJ3hqfzEh-QshEptNpcA&oe=6464B1D7',
        array ['https://www.gryphontea.com/pub/media/homepage-slider-1.jpg', 'https://www.gryphontea.com/pub/media/homepage-summary-coldbrew.jpg'],
        current_timestamp - interval '5 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Birds of Paradise',
        'Gelato boutique',
        'Eestablished in 2016, Birds of Paradise is on a perpetual mission to create the most awesome local ice-cream flavours. By inventing botanical gelato inspired by the flavours of nature and made from scratch using local produce like lemongrass, pandan leaves and roses, the brand has won the hearts of gelato aficionados in Singapore.',
        'https://birdsofparadise.sg/',
        'https://goo.gl/maps/fKmrbNynUycEtoL1A',
        'https://cdn.shopify.com/s/files/1/0365/9110/8140/files/WhatsApp_Image_2021-05-05_at_9.42.32_AM_2048x2048.jpg?v=1620178983',
        array ['https://cdn.shopify.com/s/files/1/0365/9110/8140/files/WhatsApp_Image_2021-05-05_at_9.41.08_AM_2048x2048.jpg?v=1620178896','https://cdn.shopify.com/s/files/1/0365/9110/8140/files/IMG-1026_1024x1024.jpg?v=1683439822', 'https://cdn.shopify.com/s/files/1/0365/9110/8140/files/WhatsApp_Image_2022-06-13_at_11.15.58_PM_600x600.jpg?v=1655133384'],
        current_timestamp - interval '6 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'PPP Coffee',
        'Coffee roaster',
        'PPP Coffee is a specialty coffee company and academy dedicated to the craft of specialty coffee. We are the official distributor of the iconic La Marzocco espresso machines and grinders in Singapore and Malaysia. We also operate the PPP Coffee Academy, a SCA-certified training centre that offers a wide range of coffee courses for coffee enthusiasts and professionals alike.',
        'https://pppcoffee.com/',
        'https://goo.gl/maps/2UGCDLyZmopCksc69',
        'https://burpple.imgix.net/venue_images/hires_5000px_space_overall_046-min-jpg_6680_original',
        array ['https://cdn.shopify.com/s/files/1/1628/1923/files/TB_250g_Feb23_1512x.jpg?v=1683256413', 'https://cdn.shopify.com/s/files/1/1628/1923/products/07-WEB_1512x.jpg?v=1646977155'],
        current_timestamp - interval '7 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Kele Pineapple Tarts',
        'Pastry shop',
        'One of Singapore''s most popular pineapple tart brands, Kele balances tradition with contemporary offerings to appeal to modern consumers with its gift-worthy tarts encased in gold tin cans. ',
        'https://www.kelepineappletarts.com.sg/',
        'https://goo.gl/maps/23oE8V5epHxzjuPh7',
        'https://www.visitsingapore.com/content/dam/vs/made-with-passion/brand-profiles/batch-2/kele/kele-gallery-1-1670x940.jpg',
        array ['https://www.visitsingapore.com/content/dam/vs/made-with-passion/brand-profiles/batch-2/kele/kele-gallery-2-1670x940.jpg'],
        current_timestamp - interval '8 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'The Golden Duck',
        'Snack brand',
        'The Golden Duck is a Singaporean snack brand that specialises in salted egg yolk snacks. The brand was founded in 2015 by Jonathan Shen and Christopher Hwang, who were inspired by the salted egg yolk trend in Singapore at the time. The Golden Duck''s first product was a salted egg yolk potato chip, which was launched in 2016. The Golden Duck has since expanded its product range to include other salted egg yolk snacks such as salted egg yolk fish skin and salted egg yolk cookies.',
        'https://www.thegoldenduck.co/',
        null,
        'https://dsgcp.com/assets/Uploads/Golden-Duck-snacks__FitMaxWzE1MzAsODAwXQ.jpg',
        array ['https://eatbook.sg/wp-content/uploads/2019/05/The-Golden-Duck-Ma-la-fish-skin-819x1024.jpg'],
        current_timestamp - interval '9 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 1',
        'Random shop type 1',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliqua',
        'https://example.com',
        null,
        'https://picsum.photos/seed/10/500/500',
        array ['https://picsum.photos/seed/11/500/500', 'https://picsum.photos/seed/12/500/500'],
        current_timestamp - interval '10 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 2',
        'Random shop type 2',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliqua',
        'https://example.com',
        null,
        'https://picsum.photos/seed/13/500/500',
        array ['https://picsum.photos/seed/14/500/500', 'https://picsum.photos/seed/15/500/500'],
        current_timestamp - interval '11 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 3',
        'Random shop type 3',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliqua',
        'https://example.com',
        null,
        'https://picsum.photos/seed/16/500/500',
        array ['https://picsum.photos/seed/17/500/500', 'https://picsum.photos/seed/18/500/500'],
        current_timestamp - interval '12 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 4',
        'Random shop type 4',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliqua',
        'https://example.com',
        null,
        'https://picsum.photos/seed/19/500/500',
        array ['https://picsum.photos/seed/20/500/500', 'https://picsum.photos/seed/21/500/500'],
        current_timestamp - interval '13 second'
    );
--
UPDATE listings
SET verified = true
WHERE id IN (1, 2, 3, 4);