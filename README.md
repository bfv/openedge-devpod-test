# Minimal devcontainer setup
This repo show a minimal devcontainer setup. This minimal setup is subsequently used as a start for testing devpods (https://devpod.sh). 

## Why devpods?
Devpods can be used as a measure against rogue AI agents, providing isolation between your devcontainer and the host.

## Install
There's one thing which needs to be setup on the host, the license file.
Put your license file (progress.cfg) with 4GL development system (or similar) in a directory and point an environment variable on the host OS to that progress.cfg. The devcontainer/devpod will use this file as license file. This way it's possible to setup the `.env` file completely generic and let every bring its own license (BYOL).

## Start
[https://devpod.sh/open#https://github.com/bfv/openedge-devpod-test](https://devpod.sh/open#https://github.com/bfv/openedge-devpod-test)

## Git configuration
It is possible to use your .gitconfig of the host in your devpod. Simply mount your host `.gitconfig` to the one in the devpod (in `/home/openedge` or whaever user name is appropriate).
```
    "mounts": [
        "source=${localEnv:USERPROFILE}/.gitconfig,target=/home/openedge/.gitconfig,type=bind,consistency=cached,readonly",
    ],
```
We mount this readonly to mitigate the risk of the devpod writing to the `.gitconfig` of the host. Now this poses antoher challenge, because what to do if you do need changes in you Git configuration in the devpod?

### Local (devpod) Git configuration
On your host: create a file in the user directory called `.gitconfig-devpod`. Now we add the following to the already mentioned `mounts`:
```
"source=${localEnv:USERPROFILE}/.gitconfig-devpod,target=/home/openedge/.gitconfig-devpod,type=bind,consistency=cached",
```
So a second config file is created, this one withouit `readonly`.
Now we have to make sure that this `.gitconfig-devpod` is loaded only in the devpod. To realize this we have to manually add the following the the `.gitconfig` on the host:
```
[includeIf "gitdir:/workspaces/content/"]
    path = ~/.gitconfig-devpod
```
This basically tell that if the drectory of the Git repo is `/workspaces/content/` then load the additional `.gitconfig-devpod`. 

## Hardware keys
Assuming you have a hardware key (like a Yubikey) set up and working on your host, the following applies:
Add to the mounts in `devcontainer.json`:
```
"source=${localEnv:USERPROFILE}/.ssh/id_ed25519_sk.pub,target=/home/openedge/.ssh/id_ed25519_sk.pub,type=bind,consistency=cached,readonly",
```
This assumes you are using modern elliptic curve key (i.e. ED25519). Recommended!
