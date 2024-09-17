{pkgs, inputs, system, ...}: {

  imports = [
    ../../home/core.nix
    ../../home/linux/${system}    
    ../../home/utils
  ];
}
