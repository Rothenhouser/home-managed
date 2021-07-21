{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  # todo this needs to be profile-dependent
  home.username = "lambda";
  home.homeDirectory = "/Users/lambda";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  ##################### My own changes below ####################

  # required for obsidian 
  nixpkgs.config.allowUnfree = true;

  # Import other Nix files
  imports = [
    ./neovim.nix
    ./git.nix
  ];

  # Tools to get from nixpkgs
  # NB seems like these don't show up in nix-env -q 
  home.packages = with pkgs; [
    fish
    htop
    tmux
    tree
    ripgrep
    exa
    # obsidian  # not supported for darwin
    bat
  ];

  # Dotfiles (only what can't/shouldn't be managed through ready-
  # made modules)
  home.file.".ghci".text = ''    # could also use .source
      :set prompt "λ> "
  '';

  programs.fish = {
  # this generates a config.fish
    enable = true;  
    # This is mainly to allow `home-manager edit`.
    # In fish the -x is necessary so that the variable is 
    # exported to sub-processes (i.e. becomes an environment
    # variable).
    shellInit = ''
      set -gx EDITOR nvim
    '';
    shellAliases = {
      hme = "home-manager edit";
      hms = "home-manager switch";
      # get a font with icons from https://github.com/ryanoasis/nerd-fonts
      ll  = "exa --icons -l";
      la  = "exa --icons -la";
      vim = "nvim";
    };
  };
}
