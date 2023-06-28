# Materialize's CockroachDB Homebrew Tap

This is a Homebrew tap for CockroachDB, for use when developing [Materialize],
the streaming data warehouse.

Unless you are a Materialize developer, you probably want the
[official CockroachDB Homebrew tap][official-tap] instead.

## Usage

```shell
$ brew uninstall cockroachdb/tap/cockroach
$ brew uninstall cockroachdb/tap/cockroach-sql
$ brew uninstall cockroachdb/tap/ccloud
$ brew untap cockroachdb/tap
$ brew uninstall cockroachdb/cockroach/cockroach
$ brew untap cockroachdb/cockroach
$ brew install materializeinc/cockroach/cockroach
$ brew services start cockroach
```

## Details

This tap is equivalent to the upstream tap, except that the CockroachDB
cluster started by `brew services` is configured to use an in-memory store.
For reasons we have not tracked down in full, CockroachDB is much slower
when run on macOS, and Materialize's usage of CockroachDB magnifies the
effect. See [MaterializeInc/materialize#16963] for some discussion. The leading
theory is slow filesystem operations on macOS.

## Contributor instructions

To update to the latest CockroachDB version:

```bash
git remote add upstream https://github.com/cockroachdb/homebrew-tap.git
git fetch upstream
git merge upstream/master
# Resolve any conflicts.
git push origin
```

[Materialize]: https://github.com/MaterializeInc/materialize
[official-tap]: https://github.com/cockroachdb/homebrew-tap
[MaterializeInc/materialize#16963]: https://github.com/MaterializeInc/materialize/issues/16963#issuecomment-1385500542
