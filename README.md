# docker-tor-clientonly

Dockerfile to download and compile tor software.
When run, tor starts with a SOCKS5 server accessible on port 9150.  
This does not set up a tor relay or exit node.

### To build using the Dockerfile:

```bash
$ git clone https://github.com/np1/docker-tor-clientonly.git
$ cd docker-tor-clientonly
$ docker build -t nagev/tor .
```

### Or pull the image from the Docker repository:

```bash
$ docker pull nagev/tor
```

### To run:

```bash
$ docker run -d --name tor_instance -p 127.0.1.1:9150:9150 nagev/tor
```

### To view the Tor log:

```bash
    docker logs tor_instance
```

### To use, configure your browser/client to use a SOCKS server:

    Server IP: 127.0.1.1
    Server port: 9150

### To stop:

```bash
$ docker stop tor_instance
```
