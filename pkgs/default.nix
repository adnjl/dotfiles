{ pkgs, ... }:
let
  inherit (pkgs) callPackage;
in
final: prev: {
  hyprlandPlugins.hyprscroller = callPackage ./by-name/hyprscroller { };
}
