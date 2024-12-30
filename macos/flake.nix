{
  description = "ZynthiaAir Sonoma setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    }
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
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

  outputs = { self, nix-darwin, nixpkgs }@inputs:
    let
      configuration = { pkgs, ... }: {

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;
        nix.package = pkgs.nix;

        nixpkgs = {
          # Allow software with commercial license to be installed
          config.allowUnfree = true;

          # The platform the configuration will be used on.
          # ["x86_64-darwin" "aarch64-darwin"]
          hostPlatform = "aarch64-darwin";
        };

        system = {
          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          stateVersion = 4;

          # Set Git commit hash for darwin-version.
          configurationRevision = self.rev or self.dirtyRev or null;

          # Mac OS behaviours
          # https://daiderd.com/nix-darwin/manual/index.html
          defaults = {
            dock = {
              autohide = true;

              # hot corner action: mission control
              wvous-tl-corner = 2;
              wvous-tr-corner = 2;
            };

            screencapture.location = "~/Pictures/Screenshots";

            # allow trackpad tap to click
            NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
            trackpad = {
              Clicking = true;
              TrackpadRightClick = true;
            };

            # Custom config not available directly through nix-darwin can be set
            # through this `CustomUserPreferences`.
            # https://medium.com/@zmre/nix-darwin-quick-tip-activate-your-preferences-f69942a93236
            # https://macos-defaults.com/
            CustomUserPreferences = {
              "com.apple.desktopservices" = {
                # Avoid creating .DS_Store files on network or USB volumes
                DSDontWriteNetworkStores = true;
                DSDontWriteUSBStores = true;
              };

              "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
            };
          };
        };

        # Enable Touch ID for `sudo` commands
        security.pam.enableSudoTouchIdAuth = true;

        # Create /etc/zshrc that loads the nix-darwin environment.
        programs.zsh.enable = true;  # default shell on Sonoma


        # User-specific configurations
        users.users.mayppong = {
          description = "ME! :)";
          packages = with pkgs; [
            pkgs.vim
          ];
        };
      };

  in
  {
    # The config key is formatted as `darwinConfigurations."hostName"`
    # Build darwin flake using:
    # `$ darwin-rebuild build --flake .#hostName`
    darwinConfigurations."ZynthiaAir" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."ZynthiaAir".pkgs;
  };
}
