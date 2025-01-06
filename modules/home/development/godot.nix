{
  lib,
  config,
  pkgs,
  ...
}:
lib.internal.mkOptionalModule config "godot" {
  home.packages = with pkgs; [
    godot_4-mono
  ];
}
