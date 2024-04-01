{
  description = "ZynthiaAir Sonoma setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # List packages installed in system profile. To search by name, run:
      # `$ nix-env -qaP | grep wget`
      # environment.systemPackages = [];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Allow software with commercial license to be installed
      nixpkgs.config.allowUnfree = true;

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on sonoma

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Mac OS behaviours
      # https://daiderd.com/nix-darwin/manual/index.html
      system.defaults = {
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

      # The platform the configuration will be used on.
      # Change to "aarch64-darwin" for Apple Silicon CPUs
      nixpkgs.hostPlatform = "x86_64-darwin";

      # Enable Touch ID for `sudo` commands
      security.pam.enableSudoTouchIdAuth = true;

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
