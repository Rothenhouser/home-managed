# home-managed

Clone this into ~/.config/nixpkgs after installing home-manager:


## Install Nix 
```bash
#! /usr/bin/env bash
# stolen from https://github.com/kclejeune/system/blob/master/bin/install-nix.sh

URL="https://nixos.org/nix/install"
# This would be used if I wanted to keep full control over the installation
# of home-manager itself. Don't think I need that right now? 
# URL="https://github.com/numtide/nix-flakes-installer/releases/download/nix-2.4pre20210126_f15f0b8/install"

# if on MacOS, use workaround
[[ $(uname -s) = "Darwin" ]] && FLAG="--darwin-use-unencrypted-nix-store-volume"
# what
[[ ! -z "$1" ]] && URL="$1"

# do single-user install (no-daemon) for now
command -v nix > /dev/null && echo "nix already installed" || bash <(curl -L $URL) --no-daemon $FLAG
```

## Get home-manager
```bash
#! /usr/bin/env bash
# taken from https://github.com/nix-community/home-manager#installation

# this will work if subscribed to the unstable nixpkgs channel
# (check with nix-channel --list)
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
```
