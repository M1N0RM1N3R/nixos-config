{
  lib,
  config,
  ...
}:
lib.internal.mkOptionalModule config "syncthing" (let
  hostName = config.networking.hostName;
  secretsConfig = {
    owner = config.services.syncthing.user;
    group = config.services.syncthing.group;
    mode = "0440";
  };
in {
  sops.secrets = {
    "syncthing/key" = secretsConfig;
    "syncthing/cert" = secretsConfig;
  };
  services.syncthing = {
    enable = true;
    key = config.sops.secrets."syncthing/key".path;
    cert = config.sops.secrets."syncthing/cert".path;
  };
})
