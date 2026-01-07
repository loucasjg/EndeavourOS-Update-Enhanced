EOS Full Update Script

Made by loucasjg – ⚠️ Please do not remove or alter this credit.

A Bash script to quickly and safely update your EndeavourOS system, including AUR and Flatpak packages, clean caches and logs, and optionally optimize Pacman mirrors for faster downloads.

Key Features

Update system and AUR packages using eos-update.

Update Flatpak packages (if installed).

Clean Pacman and Flatpak caches.

Clean systemd logs older than 7 days.

Optional Pacman mirror optimization for faster download speeds.

KDE notification when the update completes.

Optional reboot after the update (recommended if Nvidia drivers were updated).

Important Notes

Keep the credit: The header includes Made by LoucasJG. Please do not remove or change it when using or modifying this script.

Mirror countries: By default, the script uses France, Germany, Netherlands, Switzerland, Belgium. Change this according to your location for optimal speeds:

sudo reflector --latest 20 --country France,Germany,Netherlands,Switzerland,Belgium ...


Sudo required: The script needs sudo for system updates, cache cleaning, and logs cleaning.

Usage

Download or clone the repository:

git clone https://github.com/loucasjg/eos-full-update.git
cd eos-full-update


Make the script executable:

chmod +x eos-full-update.sh


Run the script:

./eos-full-update.sh

License

You may use, modify, and share this script freely.

However, the credit Made by loucasjg in the header must remain visible in all copies or modifications.
