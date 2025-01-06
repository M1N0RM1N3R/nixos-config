{
  mkShell,
  pkgs,
  ...
}:
mkShell {
  packages = with pkgs; [
    nixos-generators
    statix
    manix
    deadnix
    nix-output-monitor
    nh
    age
    sops
    mkpasswd
  ];
}
