create table if not exists user_keys (
    id UUID primary key default gen_random_uuid(),
    user_id UUID not null references users(id),
    key_type text not null,
    public_key text not null,
    fingerprint text not null unique,
    is_primary boolean not null default false,
    created_at TIMESTAMPTZ not null default now(),
    revoked_at TIMESTAMPTZ null,

    check (key_type in ('ed25519', 'pgp'))
);

create index idx_user_keys_user_id on user_keys (user_id);

alter table user_keys set LOCALITY global;
