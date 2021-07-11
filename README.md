
# Github Project Lister

## Purpose

This App is a submission for the CU Boulder CS Application for TA Interviews Fall 2021.

## Overview

This app uses the Github API to list and provide links to a user's public projects. The backing Nodejs service makes use of Postgres to store the results for usernames that have already been searched--see the function `fetchProjects` in `index.js`.

## build

```sh
make build
make serve
```
