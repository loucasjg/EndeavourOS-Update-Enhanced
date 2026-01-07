<img width="985" height="626" alt="image" src="https://github.com/user-attachments/assets/23afdc7c-236e-4488-8a03-59e0704e33cb" />

# EOS Full Update Script

**Made by loucasjg** – ⚠️ Please do not remove or alter this credit.

A Bash script to quickly and safely update your EndeavourOS system, including AUR and Flatpak packages, clean caches and logs, and optionally optimize Pacman mirrors for faster downloads.

---

## Key Features

- Update **system and AUR packages** using `eos-update`.
- Update **Flatpak packages** (if installed).
- Clean **Pacman and Flatpak caches**.
- Clean **systemd logs** older than 7 days.
- Optional **Pacman mirror optimization** for faster download speeds.
- **KDE notification** when the update completes.
- Optional **reboot** after the update (recommended if Nvidia drivers were updated).

---

## Important Notes

- **Keep the credit:** The header includes `Made by LoucasJG`. Please do not remove or change it when using or modifying this script.
- **Desktop file:** You can modify the eos-update system .desktop file to ensure that the .desktop launches the eos-full-update.sh script instead of the system script.
- **Mirror countries:** By default, the script uses `France, Germany, Netherlands, Switzerland, Belgium`. Change this according to your location for optimal speeds:

```bash
sudo reflector --latest 20 --country France,Germany,Netherlands,Switzerland,Belgium ...
```
---

## How to Use

- **Download the script:** Clone the repository or download `eos-full-update.sh` directly from GitHub.
- **Make it executable:**  
  ```bash
  chmod +x eos-full-update.sh
  ```
- **Run the Script:**
  ```bash
  ./eos-full-update.sh
  
<img width="985" height="626" alt="image" src="https://github.com/user-attachments/assets/9a64fa0d-9767-4567-9dc5-3123fabd4b3e" />
<img width="985" height="626" alt="image" src="https://github.com/user-attachments/assets/cf82c915-89dd-41a1-a70e-e9016505a88f" />
