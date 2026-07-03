# minimal devcontainer setup
This repo show a minimal devcontainer setup. This minimal setup is subsequently used as a start for testing devpods (https://devpod.sh). 

## why devpods?
Devpods can be used as a measure against rogue AI agents, providing isolation between your devcontainer and the host.

## install
There's one thing which needs to be setup on the host, the license file.
Put your license file (progress.cfg) with 4GL development system (or similar) in a directory and point an environment variable on the host OS to that progress.cfg. The devcontainer/devpod will use this file as license file. This way it's possible to setup the `.env` file completely generic and let every bring its own license (BYOL).

## start
[https://devpod.sh/open#https://github.com/bfv/openedge-devpod-test](https://devpod.sh/open#https://github.com/bfv/openedge-devpod-test)

