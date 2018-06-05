# Tau Project
## Certificate provisioning service container

[![Release status: Pre-production][release-status]](#release-status)
![Classification: UNRESTRICTED][classification]
[![Apache 2.0-licensed][license]](#copyright)
[![Current Travis CI build status][travis]](https://travis-ci.org/tauproject/certbot)

This project builds a [Docker container image](https://hub.docker.com/r/tauproject/certbot/) for provisioning TLS certificates from certificate authorities conforming to the [ACME protocol](https://en.wikipedia.org/wiki/Automated_Certificate_Management_Environment), such as [Let’s Encrypt](https://letsencrypt.org/), by providing an encapsulated version of the [`certbot`](https://github.com/letsencrypt/letsencrypt) tool.

### Release status

| Release track           | Tag/branch    |
|-------------------------|---------------|
| Long-term support (LTS) | Not available |
| Stable                  | Not available |
| Pre-production          | [`shimmer`](https://github.com/tauproject/certbot/tree/shimmer/master) |
| Legacy                  | Not available |

### Usage

It is assumed that you are familiar with using `certbot`.

#### Pull the appropriate release image

Refer to the [*Release status*](#release-status) table above for information on available releases.

These examples will use the pre-production release tag, `shimmer`:

```
$ docker pull tauproject/certbot:shimmer
```

#### Create the `/etc/letsencrypt` directory

By default, `certbot` stores its files in a directory named `/etc/letsencrypt`.

If you have previously used `certbot` (either directly, or as part of this container), then it is likely that this directory already exists. If not, create it with:

```
$ sudo mkdir -p /etc/letsencrypt
```

#### Arguments are passed to `letsencrypt-auto` directly

```
$ docker run -v /etc/letsencrypt -it tauproject/certbot:shimmer help
```

#### Issuing a certificate

Note that in order for provisioning to succeed, you must either expose TCP port 80 of the container, or you should forward any requests for `/.well-known/acme` (and any descendant paths) directly to it. This example assumes the host is not currently running a web server:

```
$ docker run -v /etc/letsencrypt -p 80:80 -it tauproject/certbot:shimmer certonly -d mydomain.example.com
```

### Development

This section is intended for developers and administrators who may wish to contribute to the project or produce custom variants.

#### Source control

The public repository for this project is hosted on [Github](https://github.com/tauproject/certbot/). It may be cloned with:

```
$ git clone -b shimmer/master git://github.com/tauproject/certbot.git
```

or, if you prefer HTTPS:

```
$ git clone -b shimmer/master https://github.com/tauproject/certbot.git
```

#### Automated builds

##### Travis CI

[Travis CI](https://travis-ci.org/tauproject/certbot) performs a complete build using `docker` at least once per day on each release branch and is configured to push the resulting images to [Docker Hub](https://hub.docker.com/r/tauproject/certbot/). These images constitute the official releases.

##### Docker Cloud

Docker Cloud is also configured to perform an automated build. This is to ensure that the information presented on [Docker Hub](https://hub.docker.com/r/tauproject/certbot/) is up to date. The resulting `cloudbuild` tag should be ignored.

### Copyright

Copyright © 2018.

Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0) (the "License"); you may not use
this file except in compliance with the License.

You may obtain a copy of the License at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an **"as-is" basis, without warranties or
conditions of any kind**, either express or implied.  See the License for the
specific language governing permissions and limitations under the License.

```
@(#) $Tau: certbot/README.md $
```

[travis]: https://img.shields.io/travis/tauproject/certbot.svg?style=flat-square
[license]: https://img.shields.io/badge/license-Apache%202.0-blue.svg?style=flat-square
[release-status]: https://img.shields.io/badge/release%20status-Pre--production-yellow.svg?style=flat-square
[classification]: https://img.shields.io/badge/classification-UNRESTRICTED-brightgreen.svg?style=flat-square
