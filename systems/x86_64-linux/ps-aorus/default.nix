{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices."luks-618963c0-5e1d-422b-8467-626d6ca3bd58".device = "/dev/disk/by-uuid/618963c0-5e1d-422b-8467-626d6ca3bd58";
  };
  optionalModules = {
    kde.enable = true;
    pipewire.enable = true;
    tailscale.enable = true;
    nvidia.enable = true;
    syncthing.enable = true;
  };
  networking = {
    hostName = "ps-aorus";
    networkmanager.enable = true;
  };
  services = {
    printing.enable = true;
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
  };
  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
  };
  programs = {
    steam.enable = true;
    gamemode.enable = true;
  };
  sops = {
    age.keyFile = "/home/ps/.config/sops/age/keys.txt";
  };
  hardware = {
    nvidia.prime = {
      sync.enable = true;

      # WARNING: The bus IDs for your specific setup may vary from mine!
      # DO NOT blindly copy this and expect it to work!
      # Learn more: https://nixos.wiki/wiki/Nvidia#Configuring_Optimus_PRIME:_Bus_ID_Values_.28Mandatory.29
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    bluetooth.enable = true;
  };
  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];
  system.stateVersion = "24.11";

  # Fix for a weird issue I've been having with Pika Backup(?)
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
}
