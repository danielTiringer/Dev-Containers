#!/bin/bash
set -e

: ${APP_PATH:="/app"}
: ${APP_TEMP_PATH:="$APP_PATH/tmp"}
: ${APP_SETUP_LOCK:="$APP_TEMP_PATH/setup.lock"}
: ${APP_SETUP_WAIT:="5"}

# 1: Define the functions to lock and unlock our app container's setup
# processes:
function lock_setup { mkdir -p $APP_TEMP_PATH && touch $APP_SETUP_LOCK; }
function unlock_setup { rm -rf $APP_SETUP_LOCK; }
function wait_setup { echo "Waiting for app setup to finish..."; sleep $APP_SETUP_WAIT; }

# 2: 'Unlock' the setup process if the script exits prematurely:
trap unlock_setup HUP INT QUIT KILL TERM EXIT

# 3: Wait for postgres to come up
echo "DB is not ready, sleeping..."
until nc -vz postgres 5432 &>/dev/null; do
sleep 1
done
echo "DB is ready, starting Rails."

# 4: Specify a default command, in case it wasn't issued:
if [ -z "$1" ]; then set -- bundle exec rails server -p 3000 -b 0.0.0.0 "$@"; fi

# 5: Run the checks only if the app code is executed:
if [[ "$3" = "rails" ]]
then
# Clean up any orphaned lock file
unlock_setup
# 6: Wait until the setup 'lock' file no longer exists:
while [ -f $APP_SETUP_LOCK ]; do wait_setup; done

# 7: 'Lock' the setup process, to prevent a race condition when the
# project's app containers will try to install gems and set up the
# database concurrently:
lock_setup
# 8: Check if dependencies need to be installed and install them
bundle install

yarn install
# 9: Run migrations or set up the database if it doesn't exist
# Rails >= 6
bundle exec rails db:prepare
# Rails < 6
# bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

# 10: 'Unlock' the setup process:
unlock_setup

# 11: If the command to execute is 'rails server', then we must remove any
# pid file present. Suddenly killing and removing app containers might leave
# this file, and prevent rails from starting-up if present:
if [[ "$4" = "s" || "$4" = "server" ]]; then rm -rf /app/tmp/pids/server.pid; fi
fi
# 12: Replace the shell with the given command:
exec "$@"
