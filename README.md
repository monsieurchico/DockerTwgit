# DockerTwgit

Dockerisation of the awesome project [Twgit](https://github.com/Twenga/twgit)

## Presentation

Twgit is a free and open source assisting tools for managing features, hotfixes and releases on Git repositories. It provides simple, high-level commands to adopt the branching model describes in our documentation. Supported OS: Debian/Ubuntu Linux, Mac OS X 10.8 (Mountain Lion) or lower.

*Source* [Twgit Github page](https://github.com/Twenga/twgit)

With the docker solution, you can enhance your experience of twgit without polluting your host system.

## Compatibility

* Git 1.7+
* Docker 1.2+
* Bash 4+


## Install

### Default install

If you decide to go with the default install, the script will try to recover on its own your *id_rsa* key and your *git global configuration*.
These informations will be stored on the *res* directory and shared with the Docker.

```bash
sudo ./bin/build.sh default
```

### Normal install

You'll have to copy on the *res* directory both your id_rsa and .gitconfig files.

```bash
sudo ./bin/build.sh
```

## Usage

In a git project :

```bash
twgit
```
