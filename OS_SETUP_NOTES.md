# OS Setup & Note-Taking Design

This document summarizes the automation and configuration workflows found in this repository, organized by operating system.

## 🚀 Core: Universal Dotfiles
The heart of this repository is the dotfile management system, which provides a consistent environment across all Unix-like systems (Linux, macOS, WSL).

- **Deployment Script (`sync.sh`):** Uses `rsync` to surgically deploy configuration files to the home directory (`~`). It excludes git-related files and the sync script itself.
- **Shell Environment:**
  - `.bashrc` & `.bash_profile`: Main shell configuration.
  - `.aliases`: Custom shortcuts for productivity.
  - `.functions`: Reusable shell functions.
  - `.exports`: Environment variables and PATH modifications.
- **Vim Configuration:** A deep `.vimrc` and a `.vim/` directory containing numerous plugins (Pathogen, Clojure, Cocoa, etc.).

---

## 🔵 Fedora (37/39/41)
The Fedora setup is the most comprehensive part of the repository, found in the `fedora/` directory.

### Key Workflows:
1.  **System Optimization:** `fedoraSetup.sh` optimizes DNF (parallel downloads, fastest mirror) and updates the system.
2.  **Hardware & Drivers:**
    - NVIDIA/CUDA toolkit (12.3+) installation and kernel module signing.
    - Kernel headers and development toolchains (GCC, Make).
3.  **Development Stack:**
    - **Docker:** Installed and configured with NVIDIA container toolkit.
    - **LAMP Stack:** Apache (with SSL), MariaDB, and PHP (including phpMyAdmin).
    - **Node.js:** Managed via NVM.
    - **VS Code:** Installed via RPM repository and set as the default editor.
4.  **Applications:** Automated installation of Brave, VLC, Dropbox, and Geary.
5.  **Utilities:** `createBootableWinUSB.sh` for creating Windows installation media from Fedora.

---

## 🟠 Ubuntu & WSL (Windows 10/11)
Focused primarily on enabling high-performance development within Windows using the Windows Subsystem for Linux.

### Key Workflows:
1.  **WSL CUDA Setup:** `wsl/setup-wsl-cuda-ubuntu22.sh` automates the installation of the CUDA toolkit specifically for WSL2 on Ubuntu 22.04.
2.  **Environment Setup:**
    - Clones essential repositories (`Code`, `SecureAI-Tools`).
    - Installs Zsh and Oh My Zsh for an enhanced terminal experience.
    - Compiles `deviceQuery` to verify GPU availability.
3.  **Anaconda:** Setup scripts for data science environments in WSL.

---

## 🍎 macOS
Configurations for Apple hardware, primarily through root-level scripts.

### Key Workflows:
1.  **System Defaults (`.osx`):** A massive script to configure hundreds of macOS "hidden" settings (Finder behavior, Dock, Safari, UI/UX tweaks).
2.  **Dependency Management (`install-deps.sh`):**
    - Installs Homebrew.
    - Installs RVM (Ruby), Nave (Node), and `z` (directory jumping).
    - Configures Python Pygments for syntax-highlighting.

---

## 📝 Note-Taking Design Template
Use this structure when adding new notes or modifying scripts for specific OSs:

| OS | Category | Relevant Script/File | Purpose |
| :--- | :--- | :--- | :--- |
| **Fedora** | Driver | `fedora/fedoraSetup.sh` | NVIDIA/CUDA 12.3 Setup |
| **Fedora** | Web | `fedora/fedoraSetup.sh` | LAMP Stack w/ SSL |
| **WSL** | AI/ML | `wsl/setup-wsl-cuda-ubuntu22.sh` | CUDA on Ubuntu 22.04 |
| **macOS** | UI/UX | `.osx` | System Defaults |
| **Universal**| Shell | `.aliases` | Productivity shortcuts |
