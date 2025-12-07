# WiFi Profile Deleter 🛠️

An interactive batch script to **scan and delete saved WiFi profiles** on Windows.  
This tool helps you clean up old or unused profiles without digging through system settings.

---

## ✨ Features
- Lists all saved WiFi profiles on your system.
- Prompts you interactively to delete or keep each profile.
- Handles special characters in profile names (e.g., apostrophes, spaces).
- Shows remaining profiles after deletion.
- Works entirely from the command line.
- Lightweight and portable (single `.bat` file).

---

## 📂 Project Structure

```
wifi-profile-deleter/
├── wifi-profile-deleter.bat    # Main batch script
└── README.md                    # Documentation
```

---

## 🚀 Usage

1. **Download or clone** this repository:
   ```bash
   git clone https://github.com/<your-username>/wifi-profile-deleter.git
   cd wifi-profile-deleter
   ```

2. **Right-click** `wifi-profile-deleter.bat` and select **"Run as administrator"**

3. The script will:
   - Display each WiFi profile
   - Ask: `Delete this profile? (y/n)`
   - Delete if you confirm with `y`, otherwise keep it
   - Show remaining profiles at the end

---

## ⚡ Example Output

```
========================================
Interactive WiFi Profile Deleter
========================================

Profile: HomeNetwork
Delete this profile? (y/n): y
[DELETED] HomeNetwork

Profile: Test's iPhone
Delete this profile? (y/n): n
[KEPT] Test's iPhone

Profile: OfficeWiFi
Delete this profile? (y/n): y
[DELETED] OfficeWiFi

========================================
Processed 3 profiles
Operation completed!
========================================

========================================
Remaining WiFi Profiles:
========================================
    All User Profile     : Test's iPhone
========================================
```

---

## 🛡️ Requirements
- Windows 10/11
- Administrator privileges (to delete profiles)
- PowerShell (built-in on Windows)

---

## 📖 Notes
- Profile names with spaces or special characters are fully supported (e.g., `"Karthika's iPhone"`).
- Always run the script with administrator permissions.
- The script uses PowerShell internally for better handling of special characters.
- No external dependencies required.

---

## 🤝 Contributing
Pull requests are welcome! If you'd like to improve error handling, add logging, or extend functionality (e.g., bulk delete, export profiles), feel free to fork and submit changes.

---

## 📜 License
This project is licensed under the MIT License — free to use, modify, and distribute.

---

## 💡 Inspiration
This project was built as part of my **vibecoding small projects** initiative — creating lightweight tools that solve everyday problems and sharing them with the community.

---

## 🔧 Troubleshooting

**Issue:** Script shows "Access Denied"  
**Solution:** Make sure to run as Administrator

**Issue:** Profile with special characters won't delete  
**Solution:** This script uses PowerShell to properly handle special characters. Ensure PowerShell is available on your system.

**Issue:** No profiles listed  
**Solution:** Check if you have any saved WiFi profiles with: `netsh wlan show profiles`

---

## 📞 Support
If you encounter any issues or have suggestions, please open an issue on GitHub.
