{ pkgs }:

pkgs.writeShellApplication {
  name = "rename-by-metadata";
  runtimeInputs = with pkgs; [
    exiftool
    coreutils
  ];

  text = ''
    exiftool="${pkgs.exiftool}/bin/exiftool"
    mv="${pkgs.coreutils}/bin/mv"
    echo="${pkgs.coreutils}/bin/echo"
    shopt -s nullglob
    for file in *.{heic,jpg,mp4,mov} ; do
      datetime=$($exiftool -q -d '%Y-%m-%d-%H-%M-%S' -CreateDate "$file" | awk -F ': ' '{print $2}')
      ext="''${file##*.}"
      if [ -n "$datetime" ]; then
        new_name="''${datetime}.''${ext}"
        if [ "$new_name" != "$file" ]; then
          if [ -e "$new_name" ]; then
            counter=0
            base_name="''${new_name%.*}"
            while [ -e "$new_name" ]; do
              new_name="''${base_name}-''${counter}.''${ext}"
              (( counter++ ))
            done
          fi
          $mv "$file" "$new_name"
          $echo "Renamed: $file -> $new_name"
        else
          $echo "Skipping rename, new name is same as old name: $file"
        fi
      else
        $echo "No metadata found for: $file"
      fi
    done
    shopt -u nullglob
  '';
}