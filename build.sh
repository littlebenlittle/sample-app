#!/bin/bash

set -e

ctr=`buildah from docker.io/library/node:alpine`
trap "buildah rm $ctr" EXIT

for i in package.json package-lock.json views index.js; do
	buildah add $ctr $i /usr/src/app/$i
done

buildah config --workingdir /usr/src/app --cmd '["/usr/local/bin/node", "index.js"]' $ctr
buildah run $ctr npm i

buildah commit $ctr localhost/example-app
