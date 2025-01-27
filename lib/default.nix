{lib, ...}: {
  mkOptionalModule = config: name: contents: {
    options.optionalModules.${name}.enable = lib.mkEnableOption name;
    config = lib.mkIf config.optionalModules.${name}.enable contents;
  };
  use = loader: items:
    lib.foldl (lib.recursiveUpdate) {} (
      map loader items
    );
  disko = {
    mainDisk = {
      device,
      type ? "disk",
      swapSize ? null,
      rootfs ? "ext4",
    }: {
      inherit device type;
      imageSize = "10G";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = ["umask=0077"];
            };
          };
          swap = lib.mkIf (swapSize != null) {
            size = swapSize;
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true; # resume from hiberation from this device
            };
          };
          root = {
            size = "100%"; # use the rest of the disk for the system
            content = {
              type = "filesystem";
              format = rootfs;
              mountpoint = "/";
            };
          };
        };
      };
    };
    extraDisk = {
      device,
      mountpoint,
      type ? "disk",
      format ? "ext4",
    }: {
      inherit device type;
      content = {
        type = "gpt";
        partitions.data = {
          size = "100%";
          content = {
            type = "filesystem";
            inherit mountpoint format;
          };
        };
      };
    };
    arrayMemberDisk = {
      device,
      type ? "disk",
    }: {
      inherit device type;
      content = {
        type = "gpt";
        partitions = {
          primary = {
            size = "100%";
            content = {
              type = "lvm_pv";
              vg = "pool";
            };
          };
        };
      };
    };
  };
}
