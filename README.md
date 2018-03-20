# Tau Project
## Let's Encrypt service container

### Usage

#### Arguments are passed to `letsencrypt-auto` directly

```
$ docker run -it tauproject/certbot help
```

#### Issuing a certificate
```
$ docker run -v /etc/letsencrypt -it tauproject/certbot certonly -d mydomain.example.com
```

### Building

```
$ make

```

### Licensing

Copyright © 2018.

Licensed according to the terms of the [Apache License, version 2.0](https://www.apache.org/licenses/LICENSE-2.0). 
