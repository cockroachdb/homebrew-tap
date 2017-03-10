# Homebrew CockroachDB

A [Homebrew] formula to install [CockroachDB], a scalable, survivable,
strongly-consistent SQL database.

See our complete [installation instructions] for alternative installation
methods, including support for Linux and Windows.

## Installation with Homebrew

To install the latest release of CockroachDB through this Homebrew tap, run:

```bash
$ brew install cockroachdb/cockroach/cockroach
```

This will drop a `cockroach` binary on your `$PATH`. Make sure it installed
correctly by running:

```bash
$ cockroach version
```

Next, follow our [cluster quick-start guide], check out [the docs], or view the
[upstream source repository].

[cluster quick-start guide]: https://github.com/cockroachdb/cockroach#quickstart
[the docs]: https://cockroachlabs.com/docs/
[upstream source repository]: https://github.com/cockroachdb/cockroach

## Upgrading to the Latest Version

If you've installed through Homebrew, you can upgrade to the latest
released version of CockroachDB by running:

```bash
$ brew upgrade cockroach
```

[CockroachDB]: https://cockroachlabs.com
[Homebrew]: https://brew.sh
[installation instructions]: https://www.cockroachlabs.com/docs/install-cockroachdb.html