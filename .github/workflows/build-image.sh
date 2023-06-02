#!/bin/bash
set -e

RELEASE_VERSION="${RELEASE_VERSION:="latest-$GH_BUILD_NUMBER"}"
ECR_URL="${ECR_URL:=}"
COMPANY_IDENTIFIER="${COMPANY_IDENTIFIER:=}"
APPLICATION_NAME="${APPLICATION_NAME:=}"

if [[ -z $COMPANY_IDENTIFIER ]]; then
  echo "expected env COMPANY_IDENTIFIER to be set but was empty"
  exit 1
fi

if [[ -z $APPLICATION_NAME ]]; then
  echo "expected env APPLICATION_NAME to be set but was empty"
  exit 1
fi

if [[ -z $ECR_URL ]]; then
  echo "expected env ECR_URL to be set but was empty"
  exit 1
fi

imageTagWithVersion="$ECR_URL:$COMPANY_IDENTIFIER-$APPLICATION_NAME-$RELEASE_VERSION"

echo "Image tag is '$imageTagWithVersion'"

echo "image_tag=$COMPANY_IDENTIFIER-$APPLICATION_NAME-$RELEASE_VERSION" >> $GITHUB_OUTPUT

if [[ "$APPLICATION_NAME" == "APP1" ]]; then
    echo "building container image..."
    docker build -f app1/Dockerfile -t $imageTagWithVersion .
fi

if [[ "$APPLICATION_NAME" == "APP2" ]]; then
    echo "building container image..."
    docker build -f app2/Dockerfile -t $imageTagWithVersion .
fi

echo "pushing container image to '$imageTagWithVersion'..."
docker push $imageTagWithVersion
