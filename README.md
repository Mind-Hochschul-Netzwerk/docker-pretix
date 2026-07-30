# docker-pretix

A custom Pretix Docker image with various useful plugins.

## Base image updates

`renovate.json` keeps the `pretix/standalone` base image in the `Dockerfile`
current. A new Pretix release is held for a two day grace period, after which
Renovate opens a pull request. The `PR Build` workflow then builds the image
from that branch without pushing it; only once that check is green does
Renovate merge the pull request. The merge to `main` triggers the CI workflow,
which builds and pushes the updated image.

That check is not decoration: Renovate refuses to automerge a branch with no
status checks at all, treating it as perpetually pending. Removing
`pr-build.yaml` would silently stop automerge rather than make it faster.

Automerge is deliberately scoped to `pretix/standalone` only. Any other
dependency Renovate picks up still gets a pull request to review by hand.

Renovate itself is run externally against this repository; there is no Renovate
workflow here. Whatever runs it needs a token with `contents` and
`pull-requests` write access — note that an Actions `GITHUB_TOKEN` does not
trigger workflows, so with it neither the pull request would start a `PR Build`
nor would the automerged push build a new image. A GitHub App token (such as
the Renovate App's) does trigger them.
