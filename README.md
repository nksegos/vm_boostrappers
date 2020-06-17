# VM boostrappers

## Introduction
A collection of scripts aiming to ease the initial setup of a minimal virtual machine, made through libguestfs.

## The scripts
### iface_setup.sh
From my personal experience, when generating a VM image through virt-builder, the network interfaces tend to be messed up(e.g. the configuration points to a non-existent interface). While RH/CentOS/Fedora guests seem to be working normally even with the misconfigured interfaces, this situation is especially frustrating with Debian-based guests as network access is not possible until the configuration is fixed. And this script fixes exactly that issue with the least possible configuration needed.

Best added as a firstboot script during the image generation to ensure instant network access on guest creation.
