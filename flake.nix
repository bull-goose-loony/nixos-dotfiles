# Without a flake, we have no control over where nixpkgs comes from.
# and it could also change from build to build. The old way of configuring
# a NixOS system (configuration.nix at the top level) gave the user access to
# a nixpkgs through a `nix-channel`. The problem was that nix-channel could
# give you a different version of nixpkgs than the previous build with no
# way to control package versions you were getting from it.
# Enter flake.nix. This file let's you choose exactly where your nixpkgs
# come from *down to the commit*. But that's not all. It lets you define
# any dependency you would like to have under this flake.
# In short, a flake is a hyper-repeatable build, this is perfect for
# dev environments. If ACES microservices couldn't control their jaxson
# version for example, they would break constantly so it's essentially
# developer-level control over the nature of your system.
# You don't have to get rid of your configuration.nix if your going from
# old style to new style. All you gotta do is import it as a module in
# the outputs set.
# I like to think of flakes as a sort of Dockerfile, we can build this
# system with this version of gcc and this old version of valgrend etc.
{
  description = "Zach's first NixOS flake.nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # This syntax is equivalent to
  #
  # NixOSSystem outputs(self, NixPkgs nixpkgs, HomeManager homeManager) {}
  #
  # self is the return value of this function and path to current flakes source
  # folder
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    noctalia,
    ...
  }: {
    nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};

      modules = [
        ./hosts/thinkpad

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            # required for noctlia setup
            extraSpecialArgs = {inherit inputs;};
            backupFileExtension = "backup";
            users.zach = import ./home.nix;
          };
        }
      ];
    };

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};

      modules = [
        ./hosts/desktop

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            # required for noctlia setup
            extraSpecialArgs = {inherit inputs;};
            backupFileExtension = "backup";
            users.zach = import ./home.nix;
          };
        }
      ];
    };
  };
}
