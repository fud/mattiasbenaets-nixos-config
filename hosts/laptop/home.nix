#
#  Home-manager configuration for laptop
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ ./desktop
#   │   │   └─ home.nix *
#   │   └─ home.nix
#   └─ ./modules
#       ├─ ./menu 
#       │   └─ default.nix
#       ├─ ./services
#       │   └─ default.nix
#       └─ ./shell
#           └─ default.nix
#

{ pkgs, ... }:

{
  imports =								# Importing all the different modules 
    [(import ../home.nix)] ++
    (import ../../modules/apps) ++
    (import ../../modules/services) ++
    (import ../../modules/shell); 

  home = {
    packages = with pkgs; [
      firefox
      #alacritty
      #auto-cpufreq
      #tlp
    ];
  };
  
  xsession.pointerCursor.size = 16;

  services = {
    cbatticon = {
      enable = true;
      criticalLevelPercent = 10;
      lowLevelPercent = 20;
    };
  };
}