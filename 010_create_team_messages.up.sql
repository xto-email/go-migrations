create table if not exists team_messages (
    id UUID primary key default gen_random_uuid(),
    team_id UUID not null references teams(id),
    sender_id UUID not null,
    encrypted_message BYTEA not null,
    sent_at TIMESTAMPTZ not null default now()
);

create index idx_team_messages_team on team_messages (team_id, sent_at desc);

alter table team_messages set LOCALITY REGIONAL by row;
