# fly-proxy

Run `fly proxy` on your github action.

## Usage

## Publish

In order to push the docker image to ghcr, you need to login first:

```sh
echo "GITHUB_PERSONAL_ACCESS_TOKEN" | docker login ghcr.io -u GITHUB_USERNAME --password-stdin
```

Learn how to get your github personal access token
[here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token),
make sure your personal access token have `write:packages` permission.

Build and push the image:

```sh
docker buildx build -f Dockerfile --platform linux/amd64 --push -t ghcr.io/pyk/fly-proxy:VERSION .
```

Run docker container locally:

```sh
docker run --rm \
    --name proxy-postgres \
    -p 5432:8000 \
    -e FLY_API_TOKEN=$(fly auth token) \
    -e FLY_APP="APP_NAME" \
    -e FLY_PORT=5432 \
    ghcr.io/pyk/fly-proxy:VERSION
```
