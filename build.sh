#!/bin/bash

set -e

if [ -z "$BUILD" ]; then echo "set BUILD" exit 1; fi

ctr=`buildah from docker.io/library/node:alpine`
trap "buildah rm $ctr" EXIT

for i in package.json package-lock.json index.js views content; do
	buildah add $ctr $i /usr/src/app/$i
done

buildah config --workingdir /usr/src/app --cmd '["/usr/local/bin/node", "index.js"]' $ctr
buildah run $ctr npm i

buildah commit $ctr localhost/example-app
podman push localhost/example-app oci-archive:$BUILD/example-app
