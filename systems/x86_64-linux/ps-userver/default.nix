{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  disko.devices = {
    disk = {
      main = lib.internal.disko.mainDisk {
        device = "/dev/sda";
      };
      raidA = lib.internal.disko.arrayMemberDisk {
        device = "/dev/sdb";
      };
      raidB = lib.internal.disko.arrayMemberDisk {
        device = "/dev/sdc";
      };
      raidC = lib.internal.disko.arrayMemberDisk {
        device = "/dev/sdd";
      };
    };
    lvm_vg.pool = {
      type = "lvm_vg";
      lvs.home = {
        size = "100%";
        lvm_type = "raid5";
        content = {
          type = "filesystem";
          format = "ext4";
          mountpoint = "/home";
        };
      };
    };
  };
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  optionalModules = {
    managed-passwords = {
      enable = true;
      forUsers = ["ps" "deploy"];
    };
    ssh.enable = true;
    #tailscale.enable = true;
  };
  services = {
    samba.enable = true;
  };
  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
  };
  networking = {
    hostName = "ps-userver";
    networkmanager.enable = true;
  };
  snowfallorg.users.deploy = {
    admin = false;
  };
  system.stateVersion = "24.11";
}
