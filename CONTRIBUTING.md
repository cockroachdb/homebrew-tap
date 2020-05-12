In most cases, all you need to do for a new release of CockroachDB is update the `url`, `version`, and `sha256` fields. To test, you can run `brew reinstall ./Formula/cockroach.rb`.

There are tests available with `brew test ./Formula/cockroach.rb` and a linter with `brew audit --strict --online ./Formula/cockroach.rb`. 
