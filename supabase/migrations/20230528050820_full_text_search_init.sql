-- full text search on listings table title, description_short and description_long;
alter table listings
add column search_ts tsvector generated always as (
    setweight(to_tsvector('english', coalesce(title, '')), 'A') || setweight(
      to_tsvector('english', coalesce(description_short, '')),
      'B'
    ) || setweight(
      to_tsvector('english', coalesce(description_long, '')),
      'C'
    )
  ) stored;
create index search_ts_index on listings using GIN (search_ts);
create or replace function search_listings(term text) returns setof listings as $$
select *
from listings
where search_ts @@ websearch_to_tsquery('english', term)
order by ts_rank(search_ts, websearch_to_tsquery('english', term)) desc;
$$ language sql stable;