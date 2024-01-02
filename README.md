# bento.me custom domain – Fly.io NGINX reverse proxy

This project provides a script that deploys a [Fly.io](https://fly.io) app acting as a reverse proxy for serving your [bento.me](https://bento.me) site under your custom domain (i.e., `bento.me/<username> -> mydomain.tld`).

This app can be deployed on [Fly.io's free tier](https://fly.io/plans/personal) (Hobby Plan), at no cost.

More specifically, the script will deploy an NGINX reverse proxy as a Fly.io app, pre-configured to serve your bento.me site on your custom domain (with built-in HTTPS redirect), and handle SSL certificate issuing and auto-renewal.

## Prerequisites

This script is intended to be run on GNU/Linux or macOS. It should also work under Windows Subsystem for Linux (WSL) on Windows.

- [Fly.io](https://fly.io) account
- [Fly.io CLI](https://fly.io/docs/getting-started/installing-flyctl/) installed and authenticated
- [bento.me](https://bento.me) username

## Usage

```bash
sh deploy.sh -h

Usage: deploy.sh -u username -d mydomain.com
-e      -u bento.me username (bento.me/<username>)
-e      -d Domain name (mydomain.com)
-e      -h Prints script usage help
```

## Example

For example, to deploy a reverse proxy for `bento.me/ivanvmoreno` on `ivan.build`, run:

```bash
sh deploy.sh -u ivanvmoreno -d ivan.build
```
