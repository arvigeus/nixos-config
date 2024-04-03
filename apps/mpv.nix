{pkgs, ...}: let
  defaultShaders = "${pkgs.mpv-shim-default-shaders}/share/mpv-shim-default-shaders/shaders/";
in {
  programs.mpv = {
    enable = true;
    package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {}) {youtubeSupport = true;};
    scripts = with pkgs.mpvScripts; [mpris uosc thumbfast sponsorblock quality-menu];
    # https://github.com/mpv-player/mpv/blob/master/DOCS/man/options.rst
    config = {
      # UI
      autofit = "70%";

      # Video
      vo = "gpu-next";
      gpu-api = "vulkan";
      hwdec = "auto-safe";

      # Audio
      ao = "pipewire";
      alang = "jpn,jp,eng,en";

      # Subtitles
      slang = "eng,en,bg,vn";
      sub-auto = "fuzzy";

      # Screenshots
      screenshot-directory = "~/Pictures";
      screenshot-template = "mpv-%f-%wH.%wM.%wS.%wT-#%#00n"; # name-hour-minute-second-millisecond-ssnumb
    };
    scriptOpts.uosc = {
      # https://github.com/tomasklaen/uosc/blob/main/src/uosc.conf
      controls = "subtitles,<has_chapter>chapters,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality,space,menu";
    };

    bindings = {
      # https://mpv.io/manual/master/
      "MOUSE_BTN2" = "script-binding uosc/menu-blurred";
      "tab" = "script-binding uosc/toggle-ui";
      "Shift+ENTER" = "script-binding uosc/download-subtitles";

      # https://github.com/tomasklaen/uosc?tab=readme-ov-file#menu-1
      "` script-binding console/enable" = "#! Console";

      "g cycle interpolation" = "#! Video > Interpolation";
      "d cycle deinterlace" = "#! Video > Toggle Deinterlace";
      "[ add speed +0.1; script-binding uosc/flash-speed" = "#! Video > Speed > Increase Speed";
      "] add speed -0.1; script-binding uosc/flash-speed" = "#! Video > Speed > Decrease Speed";
      "BS set speed 1; script-binding uosc/flash-speed" = "#! Video > Speed > Reset Speed";
      "# set video-aspect-override \"-1\"" = "#! Video > Aspect Ratio > Default";
      "# set video-aspect-override \"16:9\"" = "#! Video > Aspect Ratio > 16:9";
      "# set video-aspect-override \"4:3\"" = "#! Video > Aspect Ratio > 4:3";
      "# set video-aspect-override \"2.35:1\"" = "#! Video > Aspect Ratio > 2.35:1";
      "# vf toggle vflip" = "#! Video > Flip > Vertical";
      "# vf toggle hflip" = "#! Video > Flip > Horizontal";
      "b cycle-values deband \"yes\" \"no\"" = "#! Video > Deband > Toggle Deband";
      "# cycle-values deband-threshold \"35\" \"45\" \"60\"; show-text \"Deband: \${deband-iterations}:\${deband-threshold}:\${deband-range}:\${deband-grain}\" 1000" = "#! Video > Deband > Deband (Weak)";
      "# cycle-values deband-range \"20\" \"25\" \"30\"; show-text \"Deband: \${deband-iterations}:\${deband-threshold}:\${deband-range}:\${deband-grain}\" 1000" = "#! Video > Deband > Deband (Medium)";
      "# cycle-values deband-grain \"5\" \"15\" \"30\"; show-text \"Deband: \${deband-iterations}:\${deband-threshold}:\${deband-range}:\${deband-grain}\" 1000" = "#! Video > Deband > Deband (Strong)";

      "# script-binding uosc/audio-device" = "#! Audio > Devices";
      "F1 af toggle \"lavfi=[loudnorm=I=-14:TP=-3:LRA=4]'\" ; show-text \"\${af}\"" = "#! Audio > Dialogue";
      "# af clr \"\"" = "#! Audio > Clear Filters";
      "# script-binding afilter/toggle-eqr" = "#! Audio > Toggle Equalizer";
      "a cycle audio-normalize-downmix" = "#! Audio > Toggle Normalize";
      "# script-binding afilter/toggle-dnm" = "#! Audio > Toggle Normalizer";
      "# script-binding afilter/toggle-drc" = "#! Audio > Toggle Compressor";
      "Ctrl++ add audio-delay +0.10" = "#! Audio > Delay > Increase Audio Delay";
      "Ctrl+- add audio-delay -0.10" = "#! Audio > Delay > Decrease Audio Delay";
      "# set audio-delay 0" = "#! Audio > Delay > Reset Audio Delay";

      "y script-binding uosc/load-subtitles" = "#! Subtitles > Load";
      "Shift+g add sub-scale +0.05" = "#! Subtitles > Scale > Increase Subtitle Scale";
      "Shift+f add sub-scale -0.05" = "#! Subtitles > Scale > Decrease Subtitle Scale";
      "# set sub-scale 1" = "#! Subtitles > Scale > Reset Subtitle Scale";
      ": add sub-pos -1" = "#! Subtitles > Position > Move Subtitle Up";
      "\" add sub-pos +1" = "#! Subtitles > Position > Move Subtitle Down";
      "# set sub-pos 100" = "#! Subtitles > Position > Reset Subtitle Position";
      "z add sub-delay -0.1" = "#! Subtitles > Delay > Decrease Subtitles Delay";
      "Z add sub-delay 0.1" = "#! Subtitles > Delay > Increase Subtitles Delay";
      "# set sub-delay 0" = "#! Subtitles > Delay > Reset Subtitles Delay";

      "# script-binding sview/shader-view" = "#! Profiles > Show Loaded Shaders";
      "# change-list glsl-shaders clr all" = "#! Profiles > Clear All Shaders";
      "# #! Profiles >" = "---";
      "# apply-profile fsr" = "#! Profiles > AMD FidelityFX Super Resolution";
      "# apply-profile cas" = "#! Profiles > AMD FidelityFX Contrast Adaptive Sharpening";
      "# apply-profile genreric" = "#! Profiles > FSRCNNX";
      "# apply-profile generic-high" = "#! Profiles > FSRCNNX x16";
      "# apply-profile nnedi-high" = "#! Profiles > NNEDI3 (64 Neurons)";
      "# apply-profile nnedi-very-high" = "#! Profiles > NNEDI3 High (128 Neurons)";
      "# apply-profile anime4k-high-a" = "#! Profiles > Anime4K A (HQ) - For Very Blurry/Compressed";
      "# apply-profile anime4k-high-b" = "#! Profiles > Anime4K B (HQ) - For Blurry/Ringing";
      "# apply-profile anime4k-high-c" = "#! Profiles > Anime4K C (HQ) - For Crisp/Sharp";
      "# apply-profile anime4k-high-aa" = "#! Profiles > Anime4K AA (HQ) - For Very Blurry/Compressed";
      "# apply-profile anime4k-high-bb" = "#! Profiles > Anime4K BB (HQ) - For Blurry/Ringing";
      "# apply-profile anime4k-high-ca" = "#! Profiles > Anime4K CA (HQ) - For Crisp/Sharp";
      "# apply-profile anime4k-fast-a" = "#! Profiles > Anime4K A (Fast) - For Very Blurry/Compressed";
      "# apply-profile anime4k-fast-b" = "#! Profiles > Anime4K B (Fast) - For Blurry/Ringing";
      "# apply-profile anime4k-fast-c" = "#! Profiles > Anime4K C (Fast) - For Crisp/Sharp";
      "# apply-profile anime4k-fast-aa" = "#! Profiles > Anime4K AA (Fast) - For Very Blurry/Compressed";
      "# apply-profile anime4k-fast-bb" = "#! Profiles > Anime4K BB (Fast) - For Blurry/Ringing";
      "# apply-profile anime4k-fast-ca" = "#! Profiles > Anime4K CA (Fast) - For Crisp/Sharp";
    };

    defaultProfiles = ["high-quality"]; # https://github.com/mpv-player/mpv/blob/master/etc/builtin.conf

    profiles = {
      # https://github.com/iwalton3/default-shader-pack/blob/b573551f021f942d6c7546391c7c994bb435ee6c/pack-next.json
      fsr = {
        glsl-shader = "${defaultShaders}/FSR.glsl";
      };
      cas = {
        glsl-shader = "${defaultShaders}/CAS-scaled.glsl";
      };
      anime4k-high-a = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_VL.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_VL.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
        ];
      };
      anime4k-high-b = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_Soft_VL.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_VL.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
        ];
      };
      anime4k-high-c = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Upscale_Denoise_CNN_x2_VL.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
        ];
      };
      anime4k-high-aa = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_VL.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_VL.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_M.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
        ];
      };
      anime4k-high-bb = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_Soft_VL.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_VL.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_Soft_M.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
        ];
      };
      anime4k-high-ca = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Upscale_Denoise_CNN_x2_VL.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_M.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
        ];
      };
      anime4k-fast-a = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_M.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_S.glsl"
        ];
      };
      anime4k-fast-b = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_Soft_M.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_S.glsl"
        ];
      };
      anime4k-fast-c = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Upscale_Denoise_CNN_x2_M.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_S.glsl"
        ];
      };
      anime4k-fast-aa = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_M.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_S.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_S.glsl"
        ];
      };
      anime4k-fast-bb = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_Soft_M.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_M.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_Soft_S.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_S.glsl"
        ];
      };
      anime4k-fast-cc = {
        glsl-shaders = [
          "${defaultShaders}Anime4K_Clamp_Highlights.glsl"
          "${defaultShaders}Anime4K_Upscale_Denoise_CNN_x2_M.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x2.glsl"
          "${defaultShaders}Anime4K_AutoDownscalePre_x4.glsl"
          "${defaultShaders}Anime4K_Restore_CNN_S.glsl"
          "${defaultShaders}Anime4K_Upscale_CNN_x2_S.glsl"
        ];
      };
      genreric = {
        dscale = "mitchell";
        cscale = "mitchell";
        glsl-shaders = [
          "${defaultShaders}FSRCNNX_x2_16-0-4-1.glsl"
          "${defaultShaders}SSimDownscaler.glsl"
          "${defaultShaders}KrigBilateral.glsl"
        ];
      };
      genreric-high = {
        dscale = "mitchell";
        cscale = "mitchell";
        glsl-shaders = [
          "${defaultShaders}FSRCNNX_x2_8-0-4-1.glsl"
          "${defaultShaders}SSimDownscaler.glsl"
          "${defaultShaders}KrigBilateral.glsl"
        ];
      };
      "nnedi-high" = {
        dscale = "mitchell";
        cscale = "mitchell";
        glsl-shaders = [
          "${defaultShaders}nnedi3-nns64-win8x6.hook"
          "${defaultShaders}SSimDownscaler.glsl"
          "${defaultShaders}KrigBilateral.glsl"
        ];
      };
      "nnedi-very-high" = {
        dscale = "mitchell";
        cscale = "mitchell";
        glsl-shaders = [
          "${defaultShaders}nnedi3-nns128-win8x6.hook"
          "${defaultShaders}SSimDownscaler.glsl"
          "${defaultShaders}KrigBilateral.glsl"
        ];
      };
    };
  };
}
