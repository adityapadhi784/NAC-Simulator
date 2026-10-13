# 🛡️ NAC-Simulator

> Menu-driven Windows batch tool that simulates Network Access Control (NAC) using FreeRADIUS, pfSense CE, and Ubuntu. Includes connectivity tests, authorized/unauthorized user simulation, authentication logging, and report generation.

![Platform](https://img.shields.io/badge/platform-Windows-blue)
![Language](https://img.shields.io/badge/language-Batch-green)
![Category](https://img.shields.io/badge/category-Blue%20Team-informational)
![Status](https://img.shields.io/badge/type-Lab%20Simulation-orange)

**Designed and developed by [Aditya Padhi](#-author)**

---

## 📖 About

**NAC-Simulator** is a lightweight, menu-driven command-line project that demonstrates the core ideas behind **Network Access Control**: a user must authenticate before being allowed onto a protected network.

It is built around a small virtual lab:

- **pfSense CE** acts as the firewall / gateway
- **FreeRADIUS on Ubuntu** acts as the authentication server
- A **Windows client** runs this script to test connectivity, simulate logins, and record the results

The goal is to give students and security beginners a simple, hands-on way to understand how authentication-based access control works, without needing expensive enterprise hardware.

---

## ✨ Features

- 📋 Interactive menu with 10 options
- 🌐 Windows network and routing information check
- 📡 Connectivity test for the FreeRADIUS server
- 🔥 Connectivity test for the pfSense gateway
- 🔒 Protected server reachability test (shows ACCESSIBLE or BLOCKED)
- ✅ Authorized user simulation (access granted)
- ❌ Unauthorized user simulation (access denied)
- 🧾 Timestamped authentication logging
- 📄 One-click project report generation

---

## 🏗️ Architecture

```
        ┌────────────────┐
        │ Windows Client │
        └───────┬────────┘
                │
                ▼
        ┌────────────────┐
        │  pfSense CE    │   Firewall / Gateway
        └───────┬────────┘
                │
                ▼
        ┌────────────────┐
        │  FreeRADIUS    │   Authentication Server (Ubuntu)
        └───────┬────────┘
                │
                ▼
        ┌────────────────┐
        │ Authentication │   Allow / Deny
        └────────────────┘
```

---

## 🧰 Technologies Used

| Component | Purpose |
|-----------|---------|
| FreeRADIUS | RADIUS authentication server |
| pfSense CE | Firewall and gateway |
| Ubuntu | Hosts the FreeRADIUS server |
| VMware / VirtualBox | Virtual lab environment |
| Windows Batch | Simulation and testing interface |

---

## ✅ Requirements

- Windows 10 / 11 (Command Prompt)
- A virtual lab with pfSense CE and an Ubuntu VM running FreeRADIUS (optional for the simulation menu, needed for the connectivity tests)
- Network connectivity between the Windows client and the lab VMs

---

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/NAC-Simulator.git
   cd NAC-Simulator
   ```

2. **Run the script**
   Double-click `nac_simulator.bat`, or run it from Command Prompt:
   ```cmd
   nac_simulator.bat
   ```

3. **Pick an option** from the menu and follow the on-screen prompts.

On first run, the script automatically creates a `NAC_Simulation` folder with the log file inside it.

---

## 🖥️ Menu Options

| Option | Description |
|:------:|-------------|
| `1` | Project information and architecture overview |
| `2` | Show Windows network configuration (`ipconfig /all`) and routing table |
| `3` | Ping the FreeRADIUS (Ubuntu) server and log the result |
| `4` | Ping the pfSense LAN gateway and log the result |
| `5` | Test whether the protected server is reachable or blocked |
| `6` | Authorized user simulation (login with valid credentials) |
| `7` | Unauthorized user simulation (login with invalid credentials) |
| `8` | View the authentication log |
| `9` | Generate a project report |
| `0` | Exit |

---

## 🔑 Demo Credentials

For the authorized-user simulation, use:

| Username | Password |
|----------|----------|
| `student` | `student123` |

> ⚠️ **These are demo credentials for a lab simulation only.** Never use them, or credentials like them, in a real environment.

---

## 📁 Project Structure

```
NAC-Simulator/
├── nac_simulator.bat            # Main script
├── README.md                    # Project documentation
└── NAC_Simulation/              # Auto-generated on first run
    ├── NAC_Authentication_Log.txt
    └── NAC_Project_Report.txt   # Created from menu option 9
```

---

## 🧾 Sample Log Output

```
=====================================================
NETWORK ACCESS CONTROL SIMULATION LOG
=====================================================
Tue 10/13/2026 10:15:02.11 - RADIUS SERVER - SUCCESS - 192.168.1.10
Tue 10/13/2026 10:15:40.52 - PFSENSE - SUCCESS - 192.168.1.1
Tue 10/13/2026 10:16:12.87 - USER=student - AUTHENTICATION=SUCCESS - ACCESS=GRANTED
Tue 10/13/2026 10:16:45.30 - USER=hacker - AUTHENTICATION=FAILED - ACCESS=DENIED
```

*(IP addresses and timestamps above are examples.)*

---

## ⚠️ Important Note

The login checks in options **6** and **7** are a **local simulation** inside the batch script. They do **not** send real authentication requests to the FreeRADIUS server. The connectivity tests (options 3 to 5) use ICMP ping to verify that the lab components are reachable.

This makes the project ideal for learning and demonstration, but it is not a production NAC solution.

---

## 🔮 Future Improvements

- [ ] Real RADIUS authentication testing using `radtest` from the Ubuntu side
- [ ] Hash-based credential checks instead of plain-text comparison
- [ ] Failed-login counter with lockout simulation
- [ ] pfSense firewall rule examples and screenshots
- [ ] Step-by-step lab setup guide for FreeRADIUS and pfSense
- [ ] Export logs to CSV

---

## 🤝 Contributing

Suggestions and improvements are welcome. Fork the repo, make your changes, and open a pull request.

---

## 📜 License

This project is released under the [MIT License](LICENSE). *(Add a `LICENSE` file to your repo to enable this.)*

---

## 👤 Author

**Aditya Padhi**
Designer and developer of NAC-Simulator

- GitHub: [@your-github-username](https://github.com/your-github-username)

---

⭐ If you found this project useful, consider giving it a star!
