create table if not exists team_members (
    id UUID primary key default gen_random_uuid(),
    team_id UUID not null references teams(id),
    user_id UUID not null references users(id),
    role text not null check (role in ('owner', 'admin', 'member')),
    encrypted_team_key BYTEA not null,
    joined_at TIMESTAMPTZ not null default now(),

    unique (team_id, user_id)
);

create index idx_team_members_team on team_members (team_id);
create index idx_team_members_user on team_members (user_id);

alter table team_members set LOCALITY global;
