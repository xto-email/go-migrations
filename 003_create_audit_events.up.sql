create table audit_events (
    id UUID primary key default gen_random_uuid(),
    actor_id UUID not null,
    action text not null,
    target_type text not null,
    target_id text not null,
    result text not null,
    metadata JSONB null,
    created_at TIMESTAMPTZ not null default now(),
    region text not null,
    crdb_region crdb_internal_region not null default default_to_database_primary_region()
);

create index idx_audit_events_actor_created on audit_events (actor_id, created_at);

alter table audit_events set LOCALITY REGIONAL by row;
