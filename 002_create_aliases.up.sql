create table aliases (
    subdomain text primary key,
    domain text not null,
    sender_domain text not null,
    user_id UUID not null references users (id),
    active boolean not null default true,
    created_at TIMESTAMPTZ not null default now(),
    disabled_at TIMESTAMPTZ null,
    expires_at TIMESTAMPTZ null,

    constraint chk_domain_allowed check (
        domain in ('xto.email', 'nix.contact', '83g.one')
    ),
    constraint chk_expires_at_by_domain check (
        (domain = 'xto.email' and expires_at is null)
        or (domain != 'xto.email' and expires_at is not null)
    )
);

create index idx_aliases_user_active on aliases (user_id, active);

alter table aliases set LOCALITY global;
