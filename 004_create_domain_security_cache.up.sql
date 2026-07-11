create table domain_security_cache (
    domain text primary key,
    has_spf boolean not null,
    spf_policy text null,
    has_dkim boolean not null,
    dkim_selector text null,
    has_dmarc boolean not null,
    dmarc_policy text null,
    recommended boolean not null,
    assessed_at TIMESTAMPTZ not null,
    expires_at TIMESTAMPTZ not null
);

alter table domain_security_cache set LOCALITY global;
