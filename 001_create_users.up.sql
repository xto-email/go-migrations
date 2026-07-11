create table users (
    id UUID primary key default gen_random_uuid(),
    username text unique not null,
    email text unique not null,
    password_hash text not null,
    recovery_codes_hash text not null,
    created_at TIMESTAMPTZ not null default now(),
    updated_at TIMESTAMPTZ not null default now(),
    deleted_at TIMESTAMPTZ null,

    constraint chk_username_format check (username ~ '^[a-z0-9_]{3,64}$')
);

alter table users set LOCALITY global;
