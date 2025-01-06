# PickSquid's personal NixOS config

Neĝas! This is the configuration I use across everything I run [NixOS] on. (currently just my primary mobile workstation, but others are in logistics as I type)
After a previous aborted migration due to issue #1, I slowly tore down and rebuilt the config from the ground up around [Snowfall]--an opinionated framework for Nix flakes--in January 2025. (new year, new OS, amirite?)

## Features

### Modular approach

Pretty much any shared unit of configuration that's more than enabling an option or two has its own module.
Most are optional (except `std`, which is used across all systems) and locked behind enable flags, so each host can pick and choose what features they need.

### SOPS

The config uses SOPS to safely store secrets within the configuration repo.
> [!NOTE]
> Before you go full Chicken Little on me, all secrets are encrypted at rest using a key that I control.

### Dev shell

The flake includes a [dev shell](./shells/default/default.nix) with a variety of tools that you may find useful for bootstrapping and maintenance.

## Setup

1. Install NixOS however you find easiest. (Calamares GUI, CLI, what-have-you)
2. Clone this repo somewhere convenient on your system and `cd` into it. (I just put it right in my home directory)
3. Run `nix develop --extra-experimental-features nix-command --extra-experimental-features flakes` to enter the dev shell.
4. Run `nh os switch . -H <hostname> -- --extra-experimental-features nix-command --extra-experimental-features flakes` to bootstrap the config.
5. ???
6. Profit!

After bootstrapping, all you have to do to update your system is run `nh os switch ~/nixos-config`--the `nix-command` and `flakes` Nix features are enabled in the `std` module.

[NixOS]: https://nixos.org/
[Snowfall]: https://snowfall.org/guides/lib/quickstart/
