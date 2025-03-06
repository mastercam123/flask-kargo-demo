#!/bin/bash
set -e

RELEASE_VERSION="${RELEASE_VERSION:="latest-$GH_BUILD_NUMBER"}"
ECR_URL="${ECR_URL:=}"
APPLICATION_NAME="${APPLICATION_NAME:=}"
PROJECT_IDENTIFIER="${PROJECT_IDENTIFIER:=}"

if [[ -z $APPLICATION_NAME ]]; then
  echo "expected env APPLICATION_NAME to be set but was empty"
  exit 1
fi

if [[ -z $PROJECT_IDENTIFIER ]]; then
  echo "expected env PROJECT_IDENTIFIER to be set but was empty"
  exit 1
fi

if [[ -z $ECR_URL ]]; then
  echo "expected env ECR_URL to be set but was empty"
  exit 1
fi

imageTagWithVersion="$ECR_URL:$RELEASE_VERSION"

echo "Image tag is '$imageTagWithVersion'"

echo "building container image..."
docker build -t $imageTagWithVersion .

echo "pushing container image to '$imageTagWithVersion'..."
docker push $imageTagWithVersion