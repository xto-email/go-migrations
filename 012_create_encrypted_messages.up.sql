create table if not exists encrypted_messages (
    id UUID primary key default gen_random_uuid(),
    sender_id UUID not null,
    recipient_id UUID not null references users(id),
    encrypted_payload BYTEA not null,
    encrypted_key BYTEA not null,
    iv BYTEA not null,
    recipient_fingerprint text not null,
    sent_at TIMESTAMPTZ not null default now()
);

create index idx_encrypted_messages_recipient on encrypted_messages (recipient_id, sent_at desc);
create index idx_encrypted_messages_sender on encrypted_messages (sender_id, sent_at desc);

alter table encrypted_messages set LOCALITY REGIONAL by row;
