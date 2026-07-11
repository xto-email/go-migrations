create table if not exists follows (
    id UUID primary key default gen_random_uuid(),
    follower_id UUID not null references users(id),
    followee_id UUID not null references users(id),
    signature BYTEA not null,
    signed_at TIMESTAMPTZ not null default now(),

    unique (follower_id, followee_id),
    check (follower_id != followee_id)
);

create index idx_follows_follower on follows (follower_id);
create index idx_follows_followee on follows (followee_id);

alter table follows set LOCALITY global;
