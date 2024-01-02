# Get your 🍱 bento.me custom domain with 🎈 Fly.io

This project provides a script that deploys a [Fly.io](https://fly.io) app acting as a reverse proxy for serving your [bento.me](https://bento.me) site under your custom domain (i.e., `bento.me/<username> -> mydomain.tld`).

💸 This app can be deployed on [Fly.io's free tier](https://fly.io/plans/personal) (Hobby Plan), at no cost.

🤓 More specifically, the script will deploy an NGINX reverse proxy as a Fly.io app, pre-configured to serve your bento.me site on your custom domain (with built-in HTTPS redirect), and handle SSL certificate issuing and auto-renewal.

## Prerequisites

This script is intended to be run on GNU/Linux or macOS. It should also work under Windows Subsystem for Linux (WSL) on Windows.

- [Fly.io](https://fly.io) account
- [Fly.io CLI](https://fly.io/docs/getting-started/installing-flyctl/) installed and [authenticated](https://fly.io/docs/flyctl/auth-login/)
- [bento.me](https://bento.me) username (e.g., `ivanvmoreno` for `bento.me/ivanvmoreno`)
- Custom domain (e.g., `ivan.build`), and access to its DNS configuration (recommended: [Cloudflare](https://www.cloudflare.com/))

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

**Note:** after the SSL certificate is issued, you will need to point your domain to the Fly.io app's IP address. To do so, add an `A` and `AAAA` record to your domain's DNS configuration, pointing to the Fly.io app's IP address, which will be displayed in the script's output. Fly will not issue the SSL certificate until the domain is pointing to the app's IP address. Take into account that DNS propagation may take a few minutes.
