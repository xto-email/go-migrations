create table if not exists user_proofs (
    id UUID primary key default gen_random_uuid(),
    user_id UUID not null references users(id),
    proof_type text not null,
    proof_value text not null,
    sig_hash text not null,
    verified_at TIMESTAMPTZ null,
    expires_at TIMESTAMPTZ null,

    check (proof_type in ('twitter', 'github', 'domain', 'mastodon')),
    unique (user_id, proof_type, proof_value)
);

create index idx_user_proofs_user_verified on user_proofs (user_id, verified_at);

alter table user_proofs set LOCALITY global;
