# docker-pretix

A custom Pretix Docker image with various useful plugins.

## Base image updates

`renovate.json` keeps the `pretix/standalone` base image in the `Dockerfile`
current. A new Pretix release is held for a two day grace period, after which
Renovate opens a pull request and merges it automatically. The merge to `main`
triggers the CI workflow, which builds and pushes the updated image.

Renovate itself is run externally against this repository; there is no Renovate
workflow here. Whatever runs it needs a token with `contents` and
`pull-requests` write access — note that a push made with an Actions
`GITHUB_TOKEN` does not trigger workflows, so an automerge performed with it
would never build a new image.
