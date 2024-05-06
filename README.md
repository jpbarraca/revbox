# Kali Box with some tools for Reverse Engineering

## Requirements

- Virtualbox
- Other hypervisor supported by Vagrant (need to modify the Vagrantfile)

## Usage

```
vagrant up
vagrant ssh
```

## Docker

```
docker build -t revbox .
docker run -it revbox
```

## Credits

- Everyone that developed the tools included
- https://hub.docker.com/u/nasmre/rebox
- Rootfs files belong to their respective owners and are packed for convenience
