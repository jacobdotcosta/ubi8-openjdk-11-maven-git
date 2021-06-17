# ubi8-openjdk-11-maven-git
Extend the ubi8/openjdk-11 image with git to be ran on Jenkins

- [ubi8-openjdk-11-maven-git](#ubi8-openjdk-11-maven-git)
  - [Build](#build)
  - [Deploy](#deploy)
  - [Check images](#check-images)

## Build

Create the container image.

```bash
$ buildah bud -f ./Dockerfile -t ubi8-openjdk11:maven-3.8-git
```

## Deploy

To deploy the container image to [quay.io](https://quay.io/) first login into quay.

```bash
$ buildah login quay.io
Username: xxx
Password:  xxx
Login Succeeded!
```

Then push the image to quay.io as a new version.

```bash
$ buildah push localhost/ubi8-openjdk11:maven-3.8-git docker://quay.io/snowdrop/ubi8-openjdk11:maven-3.8-git-<version>
```

Also push as the latest version.

```bash
$ buildah push localhost/ubi8-openjdk11:maven-3.8-git docker://quay.io/snowdrop/ubi8-openjdk11:latest
```

## Check images

List the images.

```bash
$ buildah images
REPOSITORY                                    TAG                   IMAGE ID       CREATED          SIZE
localhost/ubi8-openjdk11                      maven-3.8-git         2c0d5ec1a027   23 seconds ago   724 MB
```
