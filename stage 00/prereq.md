# PREREQUISITES

Dear reader, you are:
* A windows user **with** a valid docker license. Follow the ☀️.
* A windows user **without** docker license. Follow the ☁️.
* A linux user. Follow the ❄️.

This recipe has been tested with:
* ☀️ Windows 10
* ☁️ Windows 10, Ubuntu 20.04.4 LTS installed on WSL2


This course expects the following.

## C4 model ☀️☁️❄️

Attendees have basic exposure to `C4 model`. Reading through the [C4 model series](https://supreme-happiness-8f0f8e3c.pages.github.io/) prior to the course is highly recommended.

## Git ☀️☁️❄️

A Github account and basic knowledge of [Git](https://git-scm.com)

## Docker ☀️☁️❄️

Enabling `Software model` visualization requires `docker`.

### ☀️

> `Docker desktop` now requires a valid license.

Install [Docker Desktop](https://www.docker.com/products/docker-desktop).

After that, you should be able to successfully run:
```ps1
# Powershell prompt
> docker version
# Client:
# ...
# Server: Docker Desktop
# ...
```

### ☁️

With the recent changes in `Docker desktop` pricing, one could leverage `WSL2` to power `docker` instead:
1. Install a `WSL2` distribution (warning, it won't work with `WSL1`)
1. Install docker engine on this [distribution](https://docs.docker.com/engine/install/). Optionally, you can:
    1. Allow yourself to use docker without [root privileges](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)
    1. Configure the docker service to run on boot (optional, but it needs to be started when using the `docker` extension or the `Cornifer` preview). Remember, you can start `docker daemon` using `$ sudo service docker start`.

After that, you should be able to successfully run:
```ps1
# Powershell prompt
> wsl -l -v
#  NAME                   STATE           VERSION
# * Ubuntu                Running         2
```

```sh
# WSL prompt

$ lsb_release -a
# Distributor ID: Ubuntu
# Description:    Ubuntu 20.04.4 LTS
# Release:        20.04
# Codename:       focal

$ docker version
# Client: Docker Engine - Community
# ...
# Server: Docker Engine - Community
# ...
```

### ❄️

Install docker engine on your [Linux distribution](https://docs.docker.com/engine/install/)

After that, you should be able to successfully run:
```sh
$ lsb_release -a
# Distributor ID: Ubuntu
# Description:    Ubuntu 20.04.4 LTS
# Release:        20.04
# Codename:       focal

$ docker version
# Client: Docker Engine - Community
# ...
# Server: Docker Engine - Community
# ...
```

## VS Code editor ☀️☁️❄️

An up to date installation of [VS Code editor](https://code.visualstudio.com).

## Cornifer ☀️☁️❄️

Authoring file  benefits from dedicated tooling. Main objective of such tooling is to support user with edition & validation. We all are used to leverage dedicated IDE when crafting software. Sadly, C4 DSL does not come with first class citizen tooling. To fill this gap, and enforce consistency along the whole workflow, a dedicated VS Code extension has been shaped, aka [Cornifer](https://github.com/rvr06/cornifer/blob/main/README.md). While you could certainly achieve great results by other means, `VS Code + Cornifer` is the recommended stack to draw on.

### ☀️❄️

1. Download [Cornifer extension](https://github.com/rvr06/cornifer/releases)
1. Install extension within VS Code:  
`EXTENSIONS > Views and More Options > Install from VSIX`

### ☁️

1. Install the [Remote-WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) VS Code extension
1. Start a `remote WSL2 vscode window`
    - `CTRL+SHIFT+P`
    - Type `Remote-WSL: New WSL window`
1. Download [Cornifer extension](https://github.com/rvr06/cornifer/releases)
1. Install extension in the `remote wsl2 window`:  
`EXTENSIONS > Views and More Options > Install from VSIX`

## Structurizr Lite ☀️☁️❄️

> Workshop has been successfully exercised with `structurizr/lite:3262`.

`Software model` visualization is powered by [Structurizr Lite](https://structurizr.com/help/lite), deployed as `docker` container:
1. Install docker ([see above](#docker-☀️☁️❄️))
1. Pull `Structurizr Lite` image
    ```ps
    > docker pull structurizr/lite:3262
    ```

Remember you can pick the `structurizr/lite` version you want to be used by `Cornifer` through settings:
```json
# Fallback to latest if not specified
"cornifer.structurizrLiteTag": "3262"
```
