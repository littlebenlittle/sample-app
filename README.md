
# Github Project Lister

## Purpose

This App is a submission for the CU Boulder CS Application for TA Interviews Fall 2021.

## Overview

This app uses the Github API to list and provide links to a user's public projects. The backing Nodejs service makes use of Postgres to store the results for usernames that have already been searched--see the function `fetchProjects` in `index.js`.

The stack is an EJS client app backed by a Nodejs service, which is in turn backed by Postgres. A script suitable for a local instance is provided in the `up.sh` script, but the [production application](https://benlittledev.com/example-app) is being run as part of my [infrastructure project](https://github.com/littlebenlittle/infrastructure).

## build

```sh
make build
make serve
```
