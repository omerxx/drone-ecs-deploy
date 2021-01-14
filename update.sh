#!/bin/bash

PLUGIN_MIN=${"100":$PLUGIN_MIN}
PLUGIN_MAX=${"200":$PLUGIN_MAX}
PLUGIN_TIMEOUT=${"300":$PLUGIN_TIMEOUT}
PLUGIN_AWS_REGION=${"us-east-1":$PLUGIN_AWS_REGION}

[ -z "${PLUGIN_CLUSTER}" ] && echo "Missing cluster" && exit 1
[ -z "${PLUGIN_IMAGE_NAME}" ] && echo "Missing image" && exit 1
[ -z "${PLUGIN_SERVICE}" ] && echo "Missing Service" && exit 1

ecs-deploy --region "${PLUGIN_AWS_REGION}" \
           --cluster "${PLUGIN_CLUSTER}" \
           --image "${PLUGIN_IMAGE_NAME}" \
           --service-name "${PLUGIN_SERVICE}" \
           --timeout "${PLUGIN_TIMEOUT}" \
           --min "${PLUGIN_MIN}" \
           --max "${PLUGIN_MAX}"
