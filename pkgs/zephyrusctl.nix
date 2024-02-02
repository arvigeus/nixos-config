{ pkgs }:

pkgs.writeShellApplication {
  name = "zephyrusctl";
  runtimeInputs = with pkgs; [
    asusctl 
    supergfxctl 
    libsForQt5.libkscreen 
    libsForQt5.kdialog 
    libnotify 
  ];
  
  text = ''
    function powersave() {
      ${pkgs.asusctl}/bin/asusctl -c 100
      ${pkgs.asusctl}/bin/asusctl profile -P Quiet
      ${pkgs.libsForQt5.libkscreen}/bin/kscreen-doctor output.eDP-2.mode.21 &> /dev/null
      printf "Battery Max: <b>100%%</b>\n"
      printf "CPU Mode: <b>POWERSAVE</b>\n"
      printf "Display: <b>60Mhz</b>\n"
      printf "Graphics mode: <b>INTEGRATED</b> \n"
      echo "<b>$(${pkgs.supergfxctl}/bin/supergfxctl --mode Integrated)</b>"
    }

    function balanced() {
      ${pkgs.asusctl}/bin/asusctl -c 75
      ${pkgs.asusctl}/bin/asusctl profile -P Balanced
      ${pkgs.libsForQt5.libkscreen}/bin/kscreen-doctor output.eDP-2.mode.0 &> /dev/null
      printf "Battery Max: <b>75%%</b>\n"
      printf "CPU Mode: <b>BALANCED</b>\n"
      printf "Display: <b>120Mhz</b>\n"
      printf "Graphics mode: <b>HYBRID</b> \n"
      echo "<b>$(${pkgs.supergfxctl}/bin/supergfxctl --mode Hybrid)</b>"
    }

    function performance() {
      ${pkgs.asusctl}/bin/asusctl -c 75
      ${pkgs.asusctl}/bin/asusctl profile -P Performance
      ${pkgs.libsForQt5.libkscreen}/bin/kscreen-doctor output.eDP-2.mode.0 &> /dev/null
      printf "Battery Max: <b>75%%</b>\n"
      printf "CPU Mode: <b>PERFORMANCE</b>\n"
      printf "Display: <b>120Mhz</b>\n"
      printf "Graphics mode: <b>DEDICATED</b> \n"
      echo "<b>$(${pkgs.supergfxctl}/bin/supergfxctl --mode AsusMuxDgpu)</b>"
    }

    powersave_status="off"
    balanced_status="off"
    performance_status="off"

    current_profile=$(${pkgs.asusctl}/bin/asusctl profile -p | awk '{print $NF}')
    case "$current_profile" in
      Quiet) powersave_status="on" ;;
      Balanced) balanced_status="on" ;;
      Performance) performance_status="on" ;;
    esac

    selection=$(${pkgs.libsForQt5.kdialog}/bin/kdialog --radiolist "Select profile:" \
      1 "Powersave" "$powersave_status" \
      2 "Balanced" "$balanced_status" \
      3 "Performance" "$performance_status")

    result=""
    case $selection in
      1)
        result=$(powersave)
        ;;
      2)
        result=$(balanced)
        ;;
      3)
        result=$(performance)
        ;;
      *)
        ;;
    esac

    if [[ -n $result ]]; then
        ${pkgs.libnotify}/bin/notify-send --app-name "Asus Zephyrus G14" "Status" "$result"
    fi
  '';
}
