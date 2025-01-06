{
  lib,
  config,
  ...
}:
(lib.internal.mkOptionalModule config "development" {
  optionalModules = {
    git.enable = true;
    godot.enable = true;
    languages.enable = true;
    vscode.enable = true;
  };
})
// {imports = [./git.nix ./godot.nix ./languages.nix ./vscode.nix];}
