{
  lib,
  config,
  ...
}:
lib.internal.mkOptionalModule config "tailscale" (let
  hostName = config.networking.hostName;
in {
  sops.secrets.tailscale = {};
  services.tailscale = {
    enable = true;
    authKeyFile = config.sops.secrets.tailscale.path;
    # HACK: Disable Tailscale DNS for the time being; manual host setup included below
    extraSetFlags = [
      "--accept-dns=false"
    ];
  };
  # Assign Tailscale IPs to nicknames under a `.tailscale` namespace in the hosts file
  networking.extraHosts = lib.concatLines (lib.mapAttrsToList (alias: ip: "${ip} ${alias}.tailscale") {
    aorus = "100.64.230.47";
    fire = "100.95.13.86";
    optiplex = "100.70.98.57";
    phone = "100.77.174.47";
  });
})
