.PHONY: preview install debug update list-generations list-packages cleanup anchor

preview:
	sudo nixos-rebuild test --flake .

install:
	sudo nixos-rebuild switch --flake .
	bash ./flatpack.sh

debug:
	sudo nixos-rebuild test --flake . --show-trace

update:
	nix flake update
	sudo nixos-rebuild switch --flake .
	flatpak update -y

list-generations:
	nix profile history --profile /nix/var/nix/profiles/system

list-packages:
	flatpak list --app --columns=application | tail -n +1
	nix-env -qa

cleanup:
	sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system
	sudo nix store gc --debug
	sudo nixos-rebuild switch --flake .

anchor:
	# System
	sudo nix-collect-garbage -d
	# User
	nix-collect-garbage -d
	sudo nixos-rebuild switch --flake .
