#!/usr/bin/env bash
set -euo pipefail

# Usage: bash docker-build-image.sh <version> [image] [build-date]
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
version="${1:?Usage: bash docker-build-image.sh <version> [image] [build-date]}"
image="${2:-cpa-manager-plus}"
build_date="${3:-$(date -u +%Y-%m-%dT%H:%M:%SZ)}"

docker build \
  --file "$root/Dockerfile.manager-server" \
  --tag "${image}:${version}" \
  --build-arg "VERSION=$version" \
  --label "org.opencontainers.image.version=$version" \
  --label "org.opencontainers.image.created=$build_date" \
  "$root"
