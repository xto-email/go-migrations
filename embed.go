// Package migrations embeds the numbered SQL schema migrations so the migration
// runner can apply them without the files being present at runtime.
package migrations

import "embed"

// embedded holds every NNN_*.up.sql / NNN_*.down.sql migration file.
//
//go:embed *.up.sql *.down.sql
var embedded embed.FS

// Files returns the embedded migration filesystem.
func Files() embed.FS {
	return embedded
}
