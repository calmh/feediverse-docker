#!/bin/bash
set -euo pipefail

# We expect initial config to be in environment variables
if [ ! -f feediverse.conf ] ; then
cat <<EOF > feediverse.conf
access_token: $FEEDIVERSE_ACCESS_TOKEN
client_id: $FEEDIVERSE_CLIENT_ID
client_secret: $FEEDIVERSE_CLIENT_SECRET
feeds:
- template: '{title} {summary}'
  url: $FEEDIVERSE_FEED_URL
name: $FEEDIVERSE_NAME
url: $FEEDIVERSE_MASTODON_URL
EOF
fi

exec /usr/local/bin/feediverse -v -c feediverse.conf
