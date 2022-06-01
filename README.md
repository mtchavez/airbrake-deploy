# Airbrake Deploy Github Action

Github action to create Airbrake Deploys for a project

## Inputs

### `project-id`

**Required** Airbrake Project ID.
Can be set up in env `$AIRBRAKE_PROJECT_ID`.

### `project-key`

**Required** Airbrake Project Key.
Can be set up in up in env `$AIRBRAKE_PROJECT_KEY`.

### `environment`

**Required** Airbrake Deploy Environment.
Can be set up in up in env `$AIRBRAKE_ENVIRONMENT`.
Example: `staging`

### `repository`

**Required** Airbrake Project Repository.
Can be set up in up in env `$AIRBRAKE_REPO`.
Example: `https://github.com/${{ github.repository }}`.

### `revision`

**Required** Airbrake Deploy Revision.
Can be set up in up in env `$AIRBRAKE_REVISION`.
Example: Set as the commit SHA `${{ github.sha }}`.

### `user`

**Required** Airbrake Deploy User.
Can be set up in up in env `$AIRBRAKE_DEPLOY_USER`.
Example: Set as the committer `${{ github.actor }}`.

## Outputs

### `response`

The API response from Airbrake `{"id": "asdf1234asdf1234"}`

## Example usage

```yaml
uses: actions/airbrake-deploy-github-action@v1
with:
  project-id: ${{ env.AIRBRAKE_PROJECT_ID }}
  project-key: ${{ secret.AIRBRAKE_PROJECT_KEY }}
  environment: ${{ env.AIRBRAKE_ENVIRONMENT }}
  repository: https://github.com/${{ github.repository }}
  revision: ${{ github.sha }}
  user: ${{ github.actor }}
```
