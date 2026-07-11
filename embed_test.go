package migrations

import "testing"

func TestFiles(t *testing.T) {
	t.Parallel()

	entries, err := Files().ReadDir(".")
	if err != nil {
		t.Fatalf("ReadDir error = %v", err)
	}
	if len(entries) == 0 {
		t.Fatal("Files() embeds no migration files")
	}
}
