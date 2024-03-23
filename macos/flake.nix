{
  description = "ZynthiaPro Big Sur setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # `$ nix-env -qaP | grep wget`
      # environment.systemPackages = [];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Allow software with commercial license to be installed
      nixpkgs.config.allowUnfree = true;

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on sonoma

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # Mac OS behaviours
      # https://daiderd.com/nix-darwin/manual/index.html
      system.defaults = {
        dock.autohide = true;
        # hot corner action: mission control
        dock.wvous-tl-corner = 2;
        dock.wvous-tr-corner = 2;

        screencapture.location = "~/Pictures/Screenshots";
        screensaver.askForPasswordDelay = 10;

        # allow trackpad tap to click
        trackpad.Clicking = true;
        trackpad.TrackpadRightClick = true;
      };

      # The platform the configuration will be used on.
      # Change to "aarch64-darwin" for Apple Silicon CPUs
      nixpkgs.hostPlatform = "x86_64-darwin";

      # Enable Touch ID for `sudo` commands
      # security.pam.enableSudoTouchIdAuth = true;

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
