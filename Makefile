.PHONY: preview install debug update list-generations list-packages cleanup anchor

preview:
	nh os test .
	bash ./flatpack.sh

install:
	nh os switch .
	bash ./flatpack.sh

debug:
	nh os test . --show-trace

update:
	nh os switch -u .
	flatpak update -y

list-generations:
	nix profile history --profile /nix/var/nix/profiles/system

list-packages:
	flatpak list --app --columns=application | tail -n +1
	nix-env -qa

cleanup:
	sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system
	sudo nix store gc
	nh clean all --keep-since 7d --keep 3


anchor:
	sudo nix store gc
	# System
	sudo nix-collect-garbage -d
	# User
	nix-collect-garbage -d
	nh clean all
