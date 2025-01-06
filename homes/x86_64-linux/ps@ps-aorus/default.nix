{pkgs, ...}: {
  optionalModules = {
    shell.enable = true;
    development.enable = true;
  };
  home = {
    packages = with pkgs; [
      unstable.osu-lazer-bin
      unstable.lutris
      vesktop
      signal-desktop
      pika-backup
      audacity
      kdePackages.kdenlive
      keepassxc
      protonvpn-gui
      solaar
    ];
    pointerCursor = {
      package = pkgs.posy-cursors;
      name = "Posy_Cursor";
      gtk.enable = true;
      x11.enable = true;
    };
  };
  programs = {
    chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = map (id: {inherit id;}) [
        "iadbdpnoknmbdeolbapdackdcogdmjpe" # addy.io
        "iadbdpnoknmbdeolbapdackdcogdmjpe" # Auto-Group Tabs
        "aohhnbhpkopmfemfonachenhjohjojnj" # This Tab Will Self Destruct
        "oboonakemofpalcgghocfoadofidjkkk" # KeePassXC-Browser
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      ];
    };
  };
  services.arrpc.enable = true;
  home.stateVersion = "24.11";
}
