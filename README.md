# PickSquid's personal NixOS config

Neĝas! This is the configuration I use across everything I run [NixOS] on.
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

### Disko

System disk partitions are managed by [Disko] for one-click installation on supported systems.

## Systems

### ps-aorus

My primary mobile workstation--a GIGABYTE Aorus 15G WB, with an i7-10750H and 2070 Max-Q.
This system has a password-encrypted root partition, which I'm working on supporting in my internal lib.

### ps-userver

My home server and NAS--an HP ProLiant MicroServer, currently populated with 4x500GB HDDs, configured in a 3-disk RAID-5 array for data and the remaining disk used for boot and applications.

[NixOS]: https://nixos.org/
[Snowfall]: https://snowfall.org/guides/lib/quickstart/
[Disko]: https://github.com/nix-community/disko
