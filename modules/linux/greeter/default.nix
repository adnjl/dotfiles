{ pkgs, inputs, ... }:
let
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "rei";
  };
in
{
  environment.systemPackages = [
    sddm-theme
    sddm-theme.test
  ];
  qt.enable = true;
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm; # use qt6 version of sddm
    enable = true;
    theme = sddm-theme.pname;
    # the following changes will require sddm to be restarted to take
    # effect correctly. It is recomend to reboot after this
    extraPackages = sddm-theme.propagatedBuildInputs;
    settings = {
      # required for styling the virtual keyboard
      General = {
        GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };
}
