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
  google_maps_url varchar(300),
  hero_image_url text,
  proof_of_ownership_doc_url text,
  images text []
);
--
alter table listings enable row level security;
--
create policy "Verified listings are viewable by everyone." on listings for
select using (verified = true);
--
create policy "Users can view own unverified listings." on listings for
select using (
    verified = false
    and auth.uid() = profile_id
  );
--
create policy "Disabled listings are not viewable." on listings as restrictive for
select using (enabled = true);
--
create policy "Users can insert up to their listing limit." on listings for
insert with check (
    (
      select count(*)
      from listings
      where profile_id = auth.uid()
    ) < (
      select listing_limit
      from profiles
      where id = auth.uid()
    )
  );
--
create policy "Users can update own listings." on listings for
update using (auth.uid() = profile_id);
--
--
insert into storage.buckets (id, name)
values ('listing-images', 'listing-images');
--
update storage.buckets set public = true where id = 'listing-images';
--
create policy "Users can upload listing images under subfolder of name equals listing id" on storage.objects for
insert with check (
    bucket_id = 'listing-images'
    and auth.uid() = (
      select profile_id
      from listings
      where cast(listings.id as TEXT) = (storage.foldername(name)) [1]
    )
  );
--
--
insert into storage.buckets (id, name)
values ('proof-of-ownership', 'proof-of-ownership');
--
create policy "Users can upload proof of ownership under subfolder of name equals listing id" on storage.objects for
insert with check (
    bucket_id = 'proof-of-ownership'
    and auth.uid() = (
      select profile_id
      from listings
      where cast(listings.id as TEXT) = (storage.foldername(name)) [1]
    )
  );