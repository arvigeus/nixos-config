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
      echo "<b>$(${pkgs.supergfxctl}/bin/supergfxctl --mode Integrated)</b>"
    }

    function balanced() {
      ${pkgs.asusctl}/bin/asusctl -c 75
      ${pkgs.asusctl}/bin/asusctl profile -P Balanced
      ${pkgs.libsForQt5.libkscreen}/bin/kscreen-doctor output.eDP-2.mode.0 &> /dev/null
      printf "Battery Max: <b>75%%</b>\n"
      echo "<b>$(${pkgs.supergfxctl}/bin/supergfxctl --mode Hybrid)</b>"
    }

    function performance() {
      ${pkgs.asusctl}/bin/asusctl -c 75
      ${pkgs.asusctl}/bin/asusctl profile -P Performance
      ${pkgs.libsForQt5.libkscreen}/bin/kscreen-doctor output.eDP-2.mode.0 &> /dev/null
      printf "Battery Max: <b>75%%</b>\n"
      echo "<b>$(${pkgs.supergfxctl}/bin/supergfxctl --mode AsusMuxDgpu)</b>"
    }

    function get_cpu_mode() {
      ${pkgs.asusctl}/bin/asusctl profile -p | awk '{print $NF}'
    }

    function get_gpu_mode() {
      local gpu_mode
      gpu_mode=$(${pkgs.supergfxctl}/bin/supergfxctl -g)
      [[ "$gpu_mode" == "AsusMuxDgpu" ]] && gpu_mode="Dedicated"
      echo "$gpu_mode"
    }

    function get_resolution() {
      output=$(${pkgs.libsForQt5.libkscreen}/bin/kscreen-doctor -o | grep "eDP-2")

      # Extract the part of the string that contains the '*' (without the mode index)
      starred_part=$(echo "$output" | grep -o "[0-9x@]*\*")

      # Remove the '*' character to isolate the resolution
      resolution=''${starred_part%\*}

      echo "$resolution"
    }

    function get_status() {
      printf "CPU mode: <b>%s</b>\n" "$(get_cpu_mode)"
      printf "Graphics mode: <b>%s</b>\n" "$(get_gpu_mode)"
      echo "Display: <b>$(get_resolution)</b>"
      [ $# -eq 1 ] && printf "\n%s" "$1"
    }

    powersave_status="off"
    balanced_status="off"
    performance_status="off"
    status="off"

    case "$(get_cpu_mode)_$(get_gpu_mode)" in
      Quiet_Integrated) powersave_status="on" ;;
      Balanced_Hybrid) balanced_status="on" ;;
      Performance_Dedicated) performance_status="on" ;;
      *) status="on" ;;
    esac

    selection=$(${pkgs.libsForQt5.kdialog}/bin/kdialog --radiolist "Select profile:" \
        1 "Powersave" "$powersave_status" \
        2 "Balanced" "$balanced_status" \
        3 "Performance" "$performance_status" \
        4 "? Status" "$status")

    changes=""
    case $selection in
      1) changes=$(powersave) ;;
      2) changes=$(balanced) ;;
      3) changes=$(performance) ;;
      *) ;;
    esac

    result=$(get_status "$changes")

    if [[ -n $result ]]; then
        ${pkgs.libnotify}/bin/notify-send --app-name "Asus Zephyrus G14" "Status" "$result"
    fi
  '';
}
