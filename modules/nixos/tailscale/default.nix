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
  };
})
