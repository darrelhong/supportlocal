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