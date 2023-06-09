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
-- insert mock listings
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
        'MONAN Pork Soup',
        'Hawker stall',
        'We have an innovative, uniquely Singapore taste to share! Fusing the taste of various Asian recipes that we localised to make it uniquely our very own, Singapore pork soup.',
        'https://www.facebook.com/monanporksoup/',
        'https://goo.gl/maps/8suud8Y71Jj76dcH9',
        'https://live.staticflickr.com/65535/49413276712_cd8dce72ad_h.jpg',
        array ['https://sethlui.com/wp-content/uploads/2020/04/MONAN-9.jpg', 'https://www.misstamchiak.com/wp-content/uploads/2020/01/monan-pork-soup.jpg'],
        current_timestamp + interval '2 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'WOKE Ramen @ Changi',
        'Ramen restaurant',
        'Singapore''s first-ever wok hei ramen is a cultural crossover between Japanese ramen broth and Chinese lamian noodles, presenting a bowl of delicious ramen noodle soup that is laced with ample wok hei smoke-kissed savouriness. For the uninitiated, wok hei literally translates to “breath of the wok”, a prized smokiness derived from cooking in an Asian bowed wok. WOKE''s noodles are first stir-fried in seasoned woks that singe them just right for that prized wok hei before being doused and served in hearty bowls of creamy chicken collagen and sweet prawn paste broths. The result is an unbeatable combination of smoke, depth and umami – a wonderful alchemy of culture, deliciousness and wok(e).',
        'https://bit.ly/m/wokeramen',
        'https://goo.gl/maps/ahEADhHHH4gjeUEP6',
        'https://sgmagazine.com/wp-content/uploads/2023/02/Screenshot-2023-02-21-at-11.02.59-AM.png',
        array ['https://live.staticflickr.com/65535/52715321608_26a36dd1a2_b.jpg', 'https://www.misstamchiak.com/wp-content/uploads/2023/04/DSCF8632-2048x1365.jpg'],
        current_timestamp + interval '1 second'
    ),
    (
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
        'https://cdn.shopify.com/s/files/1/0095/3745/4144/articles/Blog-Hysses_3500x.jpg?v=1544549325',
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
        'https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/32ac75a7a1b13cfd848c82ffed6f937a.png',
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
        'https://picsum.photos/seed/10/120/500',
        array ['https://picsum.photos/seed/11/122/500', 'https://picsum.photos/seed/12/500/500'],
        current_timestamp - interval '10 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 2',
        'Random shop type 2',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliqua',
        'https://example.com',
        null,
        'https://picsum.photos/seed/13/732/330',
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
        'https://picsum.photos/seed/16/432/789',
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
        'https://picsum.photos/seed/19/347/683',
        array ['https://picsum.photos/seed/20/323/564', 'https://picsum.photos/seed/21/764/233'],
        current_timestamp - interval '13 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 5',
        'Random shop type 5',
        'Integer ante nisl, aliquam sed dignissim cursus, pulvinar a lectus. Suspendisse varius est enim, a accumsan magna dignissim a. Maecenas dictum velit vitae tempor blandit. Cras laoreet justo nec nibh rutrum, vel varius purus ultricies. Nunc odio justo, maximus sit amet neque ut, lacinia euismod dui. Sed consectetur nisi id ex suscipit varius. Praesent nec blandit est. Proin porta nibh eget tempus suscipit. Aliquam erat volutpat.',
        'https://example.com',
        'https://goo.gl/maps/6Y5Y1Z4Z6Y5Y1Z4Z6',
        'https://picsum.photos/seed/22/1100/200',
        array ['https://picsum.photos/seed/23/434/323', 'https://picsum.photos/seed/24/675/564', 'https://picsum.photos/seed/25/344/788'],
        current_timestamp - interval '14 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random very long shop branc name that is very loooooooooooooooooong',
        'Random type that is also very long',
        'Aliquam auctor ullamcorper nisl, sed lobortis nulla auctor in. Vivamus sit amet tellus non leo pharetra mollis. Vivamus eu sodales ante. Quisque et est eu arcu sodales maximus vel non mi. Vivamus nec purus sit amet velit maximus porta quis eget nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sem risus, tempus id nisl ut, laoreet tristique diam. Mauris pulvinar turpis id quam interdum suscipit. Cras sollicitudin ex neque, eu facilisis risus commodo ut. Nullam metus nunc, volutpat venenatis tincidunt sed, lacinia nec diam.',
        'https://example.com',
        'https://goo.gl/maps/6Y5Y1Z4Z6Y5Y1Z4Z6',
        'https://picsum.photos/seed/26/200/1200',
        array ['https://picsum.photos/seed/27/434/323', 'https://picsum.photos/seed/28/675/564', 'https://picsum.photos/seed/29/344/788'],
        current_timestamp - interval '15 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 6',
        'Random shop type 6',
        'Ut at ex eget felis aliquam vulputate. Morbi imperdiet, est ut tristique convallis, lectus nulla tempor arcu, non elementum dolor arcu sed urna. Cras eget dui a risus aliquet viverra quis quis metus. Sed condimentum augue finibus sodales congue. Integer vehicula, magna vitae sagittis suscipit, odio dui aliquet eros, sed commodo lectus mauris tristique elit. Donec faucibus venenatis rutrum. Cras pharetra, odio a vulputate pretium, massa lacus malesuada nisl, non dictum velit magna ac enim. Integer tempus, erat at ultricies fringilla, lorem ligula interdum velit, sed dapibus orci metus lacinia magna. Nulla facilisi. Nunc lobortis molestie aliquam.',
        'https://example.com',
        'https://goo.gl/maps/6Y5Y1Z4Z6Y5Y1Z4Z6',
        'https://picsum.photos/seed/30/230/899',
        array ['https://picsum.photos/seed/31/434/323', 'https://picsum.photos/seed/32/675/564', 'https://picsum.photos/seed/33/344/788'],
        current_timestamp - interval '15 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 7',
        'Random shop type 7',
        'Duis cursus odio sed dui mollis, non rhoncus turpis tincidunt. Aliquam dignissim nisi at metus scelerisque, non elementum nisl aliquet. Donec laoreet orci et velit dignissim, vitae fermentum lorem sagittis. Aenean vel augue luctus, iaculis purus et, pharetra felis. Vivamus sed velit tristique, ornare arcu in, sodales urna. Nullam nunc libero, sodales at tincidunt a, sagittis eget nunc. Nulla urna quam, condimentum id metus nec, tempor pulvinar sem. Fusce pharetra, leo non lobortis dapibus, velit turpis pretium est, a aliquet libero odio vel nulla. Curabitur mattis lorem vel tortor porttitor lacinia. Phasellus fringilla mi in venenatis varius. Nam cursus mattis ligula, at faucibus dolor vulputate vitae. Vivamus semper feugiat fermentum.',
        'https://example.com',
        'https://goo.gl/maps/6Y5Y1Z4Z6Y5Y1Z4Z6',
        'https://picsum.photos/seed/34/809/202',
        array ['https://picsum.photos/seed/35/1233/323', 'https://picsum.photos/seed/36/234/345', 'https://picsum.photos/seed/37/678/456'],
        current_timestamp - interval '16 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 8',
        'Random shop type 8',
        'Sed euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl',
        'https://example.com',
        'https://goo.gl/maps/6Y5Y1Z4Z6Y5Y1Z4Z6',
        'https://picsum.photos/seed/38/234/345',
        array ['https://picsum.photos/seed/39/123/456', 'https://picsum.photos/seed/40/123/456', 'https://picsum.photos/seed/41/123/456'],
        current_timestamp - interval '17 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 9',
        'Random shop type 9',
        'Sed euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl nisl eget ultricies ultrices, nunc nisl aliquam nunc, quis aliquet nisl',
        'https://example.com',
        null,
        'https://picsum.photos/seed/42/123/456',
        array ['https://picsum.photos/seed/43/123/456', 'https://picsum.photos/seed/44/123/456', 'https://picsum.photos/seed/45/123/456'],
        current_timestamp - interval '17 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 10',
        'Random shop type 10',
        'Nam ultricies, felis in commodo sollicitudin, diam lectus gravida lacus, volutpat feugiat purus velit non nisl. Praesent non mollis ipsum. Pellentesque ultrices nibh mattis diam eleifend condimentum. Curabitur a fringilla leo, sed consequat nisi. Aenean imperdiet sollicitudin mi, ut cursus justo pulvinar at. Nunc urna sapien, cursus a scelerisque ac, lacinia eget purus. Quisque congue cursus nunc nec tincidunt. Etiam nec odio sit amet turpis tempor hendrerit. Donec facilisis nunc sem, non consequat nisl blandit ut. Praesent nec tristique augue, ut faucibus ante.',
        'https://example.com',
        null,
        'https://picsum.photos/seed/46/423/783',
        array ['https://picsum.photos/seed/47/678/456', 'https://picsum.photos/seed/48/348/934', 'https://picsum.photos/seed/49/892/234'],
        current_timestamp - interval '18 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 11',
        'Random shop type 11',
        'Nam ultricies, felis in commodo sollicitudin, diam lectus gravida lacus, volutpat feugiat purus velit non nisl. Praesent non mollis ipsum. Pellentesque ultrices nibh mattis diam eleifend condimentum. Curabitur a fringilla leo, sed consequat nisi. Aenean imperdiet sollicitudin mi, ut cursus justo pulvinar at. Nunc urna sapien, cursus a scelerisque ac, lacinia eget purus. Quisque congue cursus nunc nec tincidunt. Etiam nec odio sit amet turpis tempor hendrerit. Donec facilisis nunc sem, non consequat nisl blandit ut. Praesent nec tristique augue, ut faucibus ante.',
        'https://example.com',
        null,
        'https://picsum.photos/seed/50/423/783',
        array ['https://picsum.photos/seed/51/678/456', 'https://picsum.photos/seed/52/348/934', 'https://picsum.photos/seed/53/892/234'],
        current_timestamp - interval '19 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 12',
        'Random shop type 12',
        'Nunc molestie tortor non volutpat lobortis. Quisque vitae libero finibus justo placerat facilisis. Aliquam ut velit at nunc cursus tincidunt a non nisi. Proin porta sit amet nisi vitae feugiat. Curabitur sollicitudin accumsan turpis, sit amet fermentum turpis dictum et. Curabitur vel pharetra leo. Etiam id lacus magna. Etiam rutrum ut ligula eget porta. Donec nec mattis erat, at gravida mi. In rutrum lorem ac felis sodales, eu cursus libero consectetur. Ut laoreet eros molestie sollicitudin tincidunt.',
        'https://example.com',
        null,
        'https://picsum.photos/seed/54/423/783',
        array ['https://picsum.photos/seed/55/678/456', 'https://picsum.photos/seed/56/348/934', 'https://picsum.photos/seed/57/892/234'],
        current_timestamp - interval '20 second'
    ),
    (
        'b1a503db-0793-4f36-8b58-ac8af8c20648',
        'Random brand name 13',
        'Random shop type 13',
        'Nulla quam odio, auctor eu maximus nec, commodo consectetur lacus. Vivamus lacinia ligula eleifend est sodales euismod. Vestibulum pellentesque velit eu suscipit porta. Ut turpis lacus, congue a sapien id, malesuada auctor massa. Maecenas aliquam ex sit amet quam varius semper. Nullam dignissim egestas nibh ornare malesuada. In tristique risus ex, eu mollis neque dapibus sed.',
        'https://example.com',
        null,
        'https://picsum.photos/seed/58/423/783',
        array ['https://picsum.photos/seed/59/678/456', 'https://picsum.photos/seed/60/348/934', 'https://picsum.photos/seed/61/892/234'],
        current_timestamp - interval '21 second'
    );
UPDATE listings
SET verified = true
WHERE id IN (
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
        20,
        21,
        22,
        23
    );