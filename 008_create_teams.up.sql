create table if not exists teams (
    id UUID primary key default gen_random_uuid(),
    owner_id UUID not null references users(id),
    name text not null check (length(name) between 1 and 128),
    created_at TIMESTAMPTZ not null default now()
);

alter table teams set LOCALITY global;
