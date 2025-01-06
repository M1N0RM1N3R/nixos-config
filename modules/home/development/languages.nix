{
  lib,
  config,
  pkgs,
  ...
}:
lib.internal.mkOptionalModule config "languages" {
  home.packages = with pkgs; [
    python3Minimal
    uv

    nodejs_23
    pnpm

    rustup

    gleam
    erlang_27

    dotnet-sdk
  ];
}
