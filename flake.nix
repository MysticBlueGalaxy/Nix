{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprsysteminfo.url = "github:/hyprwm/hyprsysteminfo";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, nixpkgs-stable, home-manager, ...}@inputs:
    let
      system = "x86_64-linux";
      host = "cubic";
      user = "dawid";
    in
    {
    nixosConfigurations ={
      cubic = nixpkgs.lib.nixosSystem {
        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
          inherit system;
          inherit inputs;
          inherit user;
          inherit host;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./hosts
        inputs.nixvim.nixosModules.nixvim 
      ];
    };
    homeConfigurations.nixos = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home-manager/home.nix ];
    };
    };
  };
}
