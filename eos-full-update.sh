#!/bin/bash
# =========================================================
# EOS Full Update Script
# Made by LoucasJG - https://github.com/loucasjg/EndeavourOS-Full-Update
# Please do not remove or alter this credit.
# =========================================================

# Colors
MAGENTA="\033[1;35m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"
# Variables
AUTHOR="loucasjg (full update version)"
START_TIME=$(date "+%Y-%m-%d %H:%M:%S")
# EOS Logo in magenta
echo -e "${MAGENTA}"
cat << 'EOF'
                     ./o.
                   ./sssso-
                 `:osssssss+-
               `:+sssssssssso/.
             -/ossssssssssssso/.
           -/+sssssssssssssssso+:`
         `-:/+sssssssssssssssssso+/.
       `.://osssssssssssssssssssso++-
      .://+ssssssssssssssssssssssso++:
    .:///ossssssssssssssssssssssssso++:
  `:////ssssssssssssssssssssssssssso+++.
`-////+ssssssssssssssssssssssssssso++++-
 `..-+oosssssssssssssssssssssssso+++++/`
   ./++++++++++++++++++++++++++++++/:.
  `:::::::::::::::::::::::::------``
EOF
echo -e "${RESET}"
# Header
echo -e "${YELLOW}====================================="
echo -e " 🚀 EOS Full Update 🚀 "
echo -e "====================================="
echo -e "Author: ${AUTHOR}"
echo -e "Started: ${START_TIME}"
echo -e "=====================================${RESET}"
# 🔹 Request sudo password at the beginning
echo -e "${CYAN}⏳ Sudo authentication...${RESET}"
sudo -v # Request password now
# 🔹 Keep sudo active until the end of the script
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# 🔹 Optional: Optimize Pacman mirrors
read -p "Do you want to optimize Pacman mirrors for faster speeds? (y/N) " OPTIM
if [[ $OPTIM =~ ^[Yy]$ ]]; then
    echo -e "${CYAN}⏳ Optimizing Pacman mirrors... this may take a few seconds.${RESET}"
    sudo reflector --latest 20 --country France,Germany,Netherlands,Switzerland,Belgium \
        --protocol https --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist --verbose
    echo -e "${GREEN}✅ Mirrors optimized!${RESET}"
else
    echo -e "${YELLOW}⚠️ Mirror optimization skipped.${RESET}"
fi
# 🔹 System + AUR update
echo -e "${MAGENTA}⏳ Updating system and AUR packages...${RESET}"
sudo eos-update --aur
echo -e "${GREEN}✅ System and AUR packages updated!${RESET}"
# 🔹 Check and update Flatpak
if command -v flatpak &> /dev/null; then
    echo -e "${CYAN}⏳ Updating Flatpak packages...${RESET}"
    flatpak update -y --noninteractive
    echo -e "${GREEN}✅ Flatpak updated or no updates available!${RESET}"
else
    echo -e "${YELLOW}⚠️ Flatpak is not installed on this system.${RESET}"
fi
# 🔹 Clean Pacman cache
echo -e "${CYAN}🧹 Cleaning Pacman cache...${RESET}"
sudo paccache -r -k 3
echo -e "${GREEN}✅ Pacman cache cleaned!${RESET}"
# 🔹 Clean Flatpak cache
if command -v flatpak &> /dev/null; then
    echo -e "${CYAN}🧹 Cleaning Flatpak cache...${RESET}"
    flatpak uninstall --unused -y
    echo -e "${GREEN}✅ Flatpak cache cleaned!${RESET}"
fi
# 🔹 Clean systemd logs
echo -e "${CYAN}🧹 Cleaning systemd logs (older than 7 days)...${RESET}"
sudo journalctl --vacuum-time=7d
echo -e "${GREEN}✅ System logs cleaned!${RESET}"
# 🔹 End and summary with duration
END_TIME=$(date "+%Y-%m-%d %H:%M:%S")
echo -e "${GREEN}✅ Full update completed successfully!${RESET}"
echo -e "${YELLOW}Start: ${START_TIME}${RESET}"
echo -e "${YELLOW}End: ${END_TIME}${RESET}"
# 🔹 Desktop notification if KDE
if command -v kdialog &> /dev/null; then
    kdialog --passivepopup "✅ EOS Full Update completed!" 5
fi
# 🔹 Optional: Propose reboot if Nvidia drivers updated
echo -ne "${YELLOW}Do you want to reboot to apply changes (recommended if Nvidia drivers were updated)? (y/N) ${RESET}\n"
read -r REBOOT
if [[ $REBOOT =~ ^[Yy]$ ]]; then
    sudo reboot
fi
read -p "Press Enter to close..."
