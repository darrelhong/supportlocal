create table listings (
  id bigint generated by default as identity primary key,
  profile_id uuid references profiles on delete cascade not null,
  enabled boolean default true,
  inserted_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  verified boolean default false,
  title varchar(140) not null check (title <> ''),
  description_short varchar(35) not null check (description_short <> ''),
  description_long text,
  website_url varchar(140),
  google_maps_url text,
  hero_image_url text,
  proof_of_ownership_doc_url text,
  images text []
);
--
alter table listings enable row level security;
