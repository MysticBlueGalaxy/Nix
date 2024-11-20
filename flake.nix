{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprsysteminfo.url = "github:/hyprwm/hyprsysteminfo";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";

#    hyprland = {
#      type = "git";
#      url = "https://github.com/hyprwm/Hyprland";
#      submodules = true;
#    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, modules, ...}@inputs:
    let
      system = "x86_64-linux";
    in
    {
    nixosConfigurations = {
      cubic = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          user = "dawid";
          host = "cubic";
          modules = [
            ./hosts/cubic.nix
            inputs.nixvim.nixosModules.nixvim
          ];
        };
      };
      server = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          user = "dawid";
          host = "server";
          modules = [
            ./hosts
          ];
        };
      };

    };

    homeConfigurations.nixos = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home/home-cubic.nix ];
    };
    };
}

