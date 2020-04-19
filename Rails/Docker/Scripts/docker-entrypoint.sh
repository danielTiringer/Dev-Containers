#!/bin/bash
# Interpreter identifier

set -e
# Exit on fail

# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.
bundle check || bundle install --binstubs="$BUNDLE_BIN"

# Finally call command issued to the docker service
exec "$@"
