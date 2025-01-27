{pkgs, ...}: {
  optionalModules = {
    shell.enable = true;
  };
  home.stateVersion = "24.11";
}
