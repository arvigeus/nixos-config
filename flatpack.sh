#!/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

flatpak install -y flathub dev.aunetx.deezer
flatpak install -y flathub org.nickvision.tubeconverter
flatpak install -y flathub it.mijorus.gearlever # Manage App Images

# flatpak install -y flathub-beta com.visualstudio.code.insiders
