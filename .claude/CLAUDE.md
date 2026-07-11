# go-migrations

The xto.email database schema: the numbered `NNN_*.up.sql` / `NNN_*.down.sql` CockroachDB migrations, embedded via `migrations.Files()` (an `embed.FS`) so consumers apply them without files on disk. Consumed by `xtoctl migrate` (the runner) and `xtod`'s `internal/testutil` (integration test DB setup). Extracted from `xto`'s `migrations/` when the repo split into `xtod`/`xtoctl` (see `_projects/specs/repo-split/`).

- Library repo (`library.go` marker); flat single-package layout at the root; stdlib only (`embed`).
- The schema is the contract: change it only by ADDING a numbered up/down pair — never edit an existing migration.
- Gate: shared Makefile from `nicerobot/tools.repository` — gofumpt, vet, staticcheck, golangci-lint, govulncheck, gocognit ≤ 7, 100% coverage. Never edit the distributed `Makefile`/`.golangci.yaml`/`.github` in-tree.
- Public docs live in `docs.go-migrations`; the README is exactly badges + the docs link.
