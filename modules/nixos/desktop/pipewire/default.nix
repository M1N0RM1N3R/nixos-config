# https://nixos.wiki/wiki/PipeWire
{
  lib,
  config,
  ...
}:
lib.internal.mkOptionalModule config "pipewire" {
  # rtkit is optional but recommended
  security.rtkit.enable = lib.mkDefault true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
