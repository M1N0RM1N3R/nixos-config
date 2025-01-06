{
  lib,
  config,
  pkgs,
  ...
}:
lib.internal.mkOptionalModule config "shell" {
  programs = {
    bash = {
      enable = true;
      historyControl = ["erasedups" "ignoredups" "ignorespace"];
    };
    nushell = {
      enable = true;
      extraConfig = ''
        $env.config.show_banner = false
      '';
    };
    starship = {
      enable = true;
      settings = lib.internal.use lib.importTOML [
        ./nerd-font-symbols.starship.toml
        ./no-empty-icons.starship.toml
        ./personal.starship.toml
      ];
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };
  };
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["DroidSansMono"];})
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = ["DroidSansMono Nerd Font"];
  };
}
