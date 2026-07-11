create table if not exists devices (
    id UUID primary key default gen_random_uuid(),
    user_id UUID not null references users(id),
    device_name text not null,
    device_type text not null,
    device_key_id text not null,
    provisioned_by_id UUID null references devices(id),
    provisioned_at TIMESTAMPTZ not null default now(),
    provisioned_sig BYTEA not null,
    last_seen_at TIMESTAMPTZ not null default now(),
    revoked_at TIMESTAMPTZ null,

    check (device_type in ('desktop', 'mobile', 'web'))
);

create index idx_devices_user_id on devices (user_id);

alter table devices set LOCALITY global;
