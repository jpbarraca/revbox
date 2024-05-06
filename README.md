# Reverse Engineering Box

A basic VM and docker container with some tools for basic reverse engineering.
Built to facilitate some repetitive tasks during training sessions.

Contributions are welcome!

## Usage with Vagrant

You will need:

- Virtualbox 
- Other hypervisor supported by Vagrant (need to modify the Vagrantfile)

```
vagrant up
vagrant ssh
```

You will get a VM with tools and the `host` folder mapped into `/host`.
This version will also include `docker.io`

## Usage with Docker

```
docker build -t revbox .
docker run -it -v ./host:/host revbox
```

You will get a Docker container with tools and the `host` folder mapped into `/host`.

## Credits

- All contributors
- Everyone that developed the tools included
- https://hub.docker.com/u/nasmre/rebox
- Rootfs files belong to their respective owners and are packed for convenience
