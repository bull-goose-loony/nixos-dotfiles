{
  description = "Hyprland on Nixos";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; # this means that home-manager will use the nixpkgs that this system is using
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: {
    # given the inputs (nixpkgs & home-manager), output a host
    # nixpkgs.lib.nixosSystem builds it 
    nixosConfigurations.my-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.zach = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
