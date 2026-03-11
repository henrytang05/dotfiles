{
  description = "This is my first Darwin Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

     homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask, home-manager, ...}:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget

launchd.daemons.kanata = {
  serviceConfig = {
    ProgramArguments = [
      "/opt/homebrew/bin/kanata"
      "-c"
      "/Users/henrytang/.config/kanata/kanata.kbd"
    ];

    RunAtLoad = true;
    KeepAlive = true;

    StandardOutPath = "/Library/Logs/Kanata.out.log";
    StandardErrorPath = "/Library/Logs/Kanata.err.log";
  };
};

      environment.systemPackages =
        [ 
		pkgs.vim
		pkgs.neovim
		pkgs.tmux
		pkgs.alacritty
		pkgs.chezmoi
		pkgs.git
		pkgs.gh
        pkgs.home-manager
        pkgs.mkalias
        pkgs.zoxide
        pkgs.fzf
        pkgs.starship
        pkgs.atuin
        pkgs.eza
        pkgs.uv
        pkgs.docker
        pkgs.btop
        pkgs.yazi
        pkgs.tealdeer
        pkgs.fd
        pkgs.ripgrep
        pkgs.bat
        pkgs.rustc
        pkgs.cargo
        pkgs.nodejs_24
        pkgs.raycast
        pkgs.lazygit
        pkgs.lazydocker
        pkgs.autoraise
        pkgs.obsidian
        pkgs.sesh
        pkgs.trash-cli

        # pkgs.karabiner-dk
        # pkgs.karabiner-elements
        ];

    environment.variables = {
                    ZDOTDIR="/Users/henrytang/.config/zsh";

                    ZHIDDEN="$HOME/.config/.zsh_env";

                    HISTFILE="$ZHIDDEN/zsh_history";
                };


	system.primaryUser = "henrytang";
	
	homebrew = {
		enable = true;
		casks = [
			"firefox"
			"google-drive"	
			"google-chrome"
            "ghostty"
            "visual-studio-code"
            "zalo"
		];
        brews = [
                        "zsh"
                        "kanata"
                    ];
		onActivation.cleanup = "zap";
	};

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

nixpkgs.config.allowUnfree = true;
      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
        users.users.henrytang.home = "/Users/henrytang";
        home-manager.backupFileExtension = "backup";

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#henry
    darwinConfigurations."henry" = nix-darwin.lib.darwinSystem {
      modules = [ 
          configuration

          home-manager.darwinModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.henrytang = import ./home.nix;

            }

          nix-homebrew.darwinModules.nix-homebrew
          {
              nix-homebrew = {
# Install Homebrew under the default prefix
                  enable = true;

# Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
                  enableRosetta = true;

# User owning the Homebrew prefix
                  user = "henrytang";
                  autoMigrate = true;


                  taps = {
                      "homebrew/homebrew-core" = homebrew-core;
                      "homebrew/homebrew-cask" = homebrew-cask;
                  };

              };
          }
      ];
    };
  };
}
