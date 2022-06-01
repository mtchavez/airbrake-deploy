#!/bin/sh
#
# Notify Airbrake for a deploy
#

set -e

PROJECT_ID=${AIRBRAKE_PROJECT_ID:-$1}
PROJECT_KEY=${AIRBRAKE_PROJECT_KEY:-$2}
ENVIRONMENT=${AIRBRAKE_ENVIRONMENT:-$3}
REPOSITORY=${AIRBRAKE_REPO:-$4}
COMMIT_SHA=${AIRBRAKE_REVISION:-$5}
DEPLOY_USER=${AIRBRAKE_DEPLOY_USER:-$6}

usage() {
  echo
  echo "entrypoint.sh \$AIRBRAKE_PROJECT_ID \$AIRBRAKE_PROJECT_KEY \$AIRBRAKE_ENV \$AIRBRAKE_REPO \$AIRBRAKE_REVISION \$AIRBRAKE_DEPLOY_USER"
  echo
  echo "args:"
  echo
  echo "project-id: Airbrake project ID; Can be set from \$AIRBRAKE_PROJECT_ID"
  echo "project-key: Airbrake project key; Can be set from \$AIRBRAKE_PROJECT_KEY"
  echo "environment: Environment to track the deploy; Can be set from \$AIRBRAKE_ENV"
  echo "repository: Github repository to deploy e.g. oforce/insurance; Can be set from \$AIRBRAKE_REPO"
  echo "revision: The revision of the deploy. Defaults to latest git SHA; Can be set from \$AIRBRAKE_REVISION"
  echo "user: The user who is deploying; Can be set from \$AIRBRAKE_DEPLOY_USER"
  exit 1
}

if [ -z "$PROJECT_ID" ] || [ -z "$PROJECT_KEY" ] || [ -z "$ENVIRONMENT" ] || [ -z "$REPOSITORY" ] || [ -z "$DEPLOY_USER" ]; then
  echo "Missing required arguments!"
  usage
  exit 1
fi

curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"environment":"'"${ENVIRONMENT}"'","username":"'"${DEPLOY_USER}"'","repository":"'"${REPOSITORY}"'","revision":"'"${COMMIT_SHA}"'"}' \
  "https://airbrake.io/api/v4/projects/${PROJECT_ID}/deploys?key=${PROJECT_KEY}"
