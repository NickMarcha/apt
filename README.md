# apt

The apt repository for [Bragi](https://github.com/NickMarcha/bragi) and the
[headless Deskflow server](https://github.com/NickMarcha/deskflow/tree/headless),
for Raspberry Pi OS / Debian trixie (arm64). Served at
<https://nickmarcha.github.io/apt/>, which has the install instructions.

## How it's built

`.github/workflows/publish.yml` runs hourly (and from the Actions tab). It
downloads the `.deb` files of the newest three releases of each package
(`bragi-v*` in NickMarcha/bragi, `headless-v*` in NickMarcha/deskflow),
indexes them with `apt-ftparchive`, signs the index with the key in the
`APT_SIGNING_KEY` secret and publishes the result on GitHub Pages. Nothing
built is committed here.

Releasing a new version is therefore just publishing a release in one of
those repositories; it's in the repository within the hour.

## Signing key

`keys/bragi-archive-keyring.asc`, fingerprint
`753F 00FA D4D7 15C2 CB5B 6FFD EE31 EA61 CD9C F9A5` (ed25519, signing only,
no expiry). The private key exists only as the `APT_SIGNING_KEY` Actions
secret. To replace it: make a new key, set the secret, replace the public
key here, and have boxes fetch the new `bragi-archive-keyring.gpg`.
