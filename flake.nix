{
  description = "PickSquid's personal NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;
      outputs-builder = channels: {
        formatter = channels.nixpkgs.alejandra;
      };
      channels-config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "dotnet-sdk-6.0.428" # https://github.com/NixOS/nixpkgs/issues/365975
        ];
      };
      systems.modules.nixos = with inputs; [sops-nix.nixosModules.sops];
      homes.modules = with inputs; [sops-nix.homeManagerModules.sops];
    };
}
