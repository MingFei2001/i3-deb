# i3-deb

<!-- TODO: Add screenshot and graphics -->

```txt
    _________       ____       __    _
   /  _/__  /      / __ \___  / /_  (_)___ _____
   / /  /_ <______/ / / / _ \/ __ \/ / __ `/ __ \
 _/ / ___/ /_____/ /_/ /  __/ /_/ / / /_/ / / / /
/___//____/     /_____/\___/_.___/_/\__,_/_/ /_/
```

> A minimal, optimized setup delivering a seamless tiling window manager experience for unparalleled programming productivity.

Welcome to i3-deb, a project that redefines your desktop environment for peak productivity. This guide helps you install and configure a minimalistic setup with i3wm on Debian, using XFCE4 as the base. With a focus on reducing distractions and maximizing efficiency, this setup is designed for those who want to spend more time doing and less time tweaking.

---

## 📖 Philosophy: Less is More

**The Minimalist Approach**

A minimalist desktop environment isn't just about aesthetics—it's about reducing complexity and fostering focus. By eliminating unnecessary customization and relying on a stock-like configuration, you can channel your energy into what matters most: your work. As ThePrimeagen aptly put it, "Spend less time configuring and more time doing."

A tiling window manager like i3wm embodies this philosophy. Its keyboard-driven design and no-frills functionality help you maintain a seamless workflow, free from the clutter of traditional desktop environments. Pairing this with XFCE4 gives you a stable, reliable base that "just works," without the need for constant tinkering.

---

## 🛠️ Components of the Stack

**i3wm: The Tiling Window Manager**

Effortlessly manage multiple windows with a grid-based layout. No more dragging and resizing—just focus on your work and let i3 handle the rest.

**dmenu: The Minimalist Launcher**

Quickly open applications with this lightweight and efficient launcher, designed to keep your hands on the keyboard.

**Kitty Terminal: Blazingly Fast Terminal Emulator**

A modern terminal emulator with GPU acceleration, keyboard shortcuts, and easy configuration. Perfect for programmers who live in the command line.

**Neovim: The only one true Vim**

Enhance your coding experience with this lightweight yet powerful text editor. Built for speed and extensibility, it's a coder's dream.

**Tmux: The Ultimate Terminal Multiplexer**

Manage multiple terminal sessions in one window. Split panes, navigate seamlessly, and pick up where you left off.

**System Monitors (btop/htop)**

Keep an eye on system performance with these minimal resource monitors, perfect for diagnosing bottlenecks or just checking CPU load.

---

## 🔄 Workflow Integration

This setup is tailored for programming and productivity:

- Coding: Use Kitty + Neovim for an uncluttered, distraction-free coding environment.
- Debugging: Pair Tmux with your terminal-based debugger for efficient multitasking.
- System Monitoring: Quickly check system stats with btop or htop.
- Task Switching: Let i3wm's workspaces keep your projects organized and accessible.

---

## 💻 Why Neovim

Neovim is a fast, keyboard-centric text editor designed for efficiency. Building on Vim’s powerful modal editing, it lets you navigate and edit code without leaving the keyboard. Neovim takes this a step further with modern improvements, making it even more extensible and efficient for developers.

**Key Feature**

+ Vim Keybindings: Stay productive with Vim's intuitive commands for fast text manipulation and navigation.
+ Extensive Plugin Ecosystem: Easily extend Neovim’s functionality with plugins for autocompletion, Git integration, file explorers, and more.
+ Lightweight and Fast: Neovim is designed to be efficient, even with advanced features, ensuring a smooth, distraction-free experience.

**And the best part about Neovim is**

YOU GET TO TELL PEOPLE

😎 `*I USE NEOVIM BTW*` 😎

---

## 💡 Why XFCE4 as the Base?

**Out-of-the-Box Utilities**

XFCE4 provides essentials like power management, audio, and video support without the need for additional configuration.

**A Stable Fallback**

XFCE4 acts as a safety net. If something goes awry with i3, you have a fully functional desktop environment to fall back on.

**Hassle-Free Setup**

By leveraging XFCE4’s pre-configured settings, you avoid unnecessary headaches and can focus on building a workflow, not a desktop environment.

---

## 🚀 Installation Guide

**Before you start**

Before you begin, make sure you have Debian with XFCE installed on your system. If you haven't done that yet, follow these steps:

1. Install Debian with xfce4 desktop
2. Backup your configurations

It’s always a good idea to back up your configurations before starting any new installation. This ensures you can easily recover if anything goes wrong.

**Install the i3 Window Manager and Components**

Once you have Debian with XFCE installed, follow these steps to install i3wm and the essential components using the i3-deb installation script.

1. Clone this repository to your local machine:
```bash
git clone https://github.com/MingFei2001/i3-deb.git
cd i3-deb
```

2. Make the script executable
```bash
chmod +x install.sh
```

3. Run the installation script 

To install i3wm and the selected components, execute the following command:

```bash
./install.sh
# or
bash install.sh
```

The script will guide you through the installation process and provide feedback in the terminal. It will:

- Update your system.
- Install i3wm, dmenu, kitty terminal, neovim, tmux, btop, htop, and other essential tools for a productive setup.
- Copy the bash_aliases file to your home directory for easy alias management.
- Log all actions for debugging and reference.

4. Post-Installation

Once the installation is complete, the script will prompt you to log out or reboot your system for the changes to take effect. After rebooting, select i3 in the login page and enjoy your new experience!!

**Uninstallation**
If you decide to uninstall the components at any point, you can run the script with the -u option:
```bash
./install.sh -u
```
This will remove all installed components and clean up residual files.

**Notice**

By default, the script installs nano instead of nvim, as the version of Neovim in Debian stable is outdated. If you're using Debian's testing branch with a newer Neovim version, you can switch by removing `nano` and uncommenting `nvim` in the program list in the script.

---

## 🤔 What's the next step?

**Check out Bundles**

Another script i made to automate setting up some useful programs (CLI and GUI). Designed to be as quick and hassle-free as possible to users and repeatable, allowing you to quickly test a new system while still have access to your most useful tools.

*Link: [MingFei2001/bundles.git](https://github.com/MingFei2001/bundles)*

---

## 📜 License

This project is licensed under the [MIT License](./LICENSE), giving you the freedom to use, modify, and distribute it as you see fit.
