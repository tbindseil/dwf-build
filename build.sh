#!/bin/bash

# TODO check out via a tag,
# will need to be a tag because multipulte repos will not have same commit hash

# for now, just making auth role to do what is being done currently
BUILD_ARTIFACTS="build_artifacts"
GIT_HUB_URL_BASE="https://github.com/tbindseil/"
CDK_REPO="dwf-cdk"

# pull down cdk repo if its not there yet
if [ ! -d "$BUILD_ARTIFACTS/" ]; then
    mkdir $BUILD_ARTIFACTS
    if [ ! -d "$BUILD_ARTIFACTS/$CDK_REPO/" ]; then
        git clone "$GIT_HUB_URL_BASE$CDK_REPO.git" "$BUILD_ARTIFACTS/$CDK_REPO/"
    fi
fi

# build and deploy cdk
cd "$BUILD_ARTIFACTS/$CDK_REPO"
npm i @aws-cdk/core
npm run build && cdk synth && cdk deploy
