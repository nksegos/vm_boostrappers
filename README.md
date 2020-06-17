# VM boostrappers

## Introduction
A collection of scripts aiming to ease the initial setup of a minimal virtual machine, created through libguestfs. It is an attempt to address some of the "shortcomings"(in my personal opinion) of virt-builder.

The scripts can be used standalone inside any guest(existing/fresh or even a normal physical machine) but they can also be embedded inside virt-builder's creation string to allow functionality straight out of the box.



## The scripts
### iface_setup.sh
From my personal experience, when generating a VM image using virt-builder, the network interfaces tend to be messed up(e.g. the configuration points to a non-existent interface). While RH/CentOS/Fedora guests seem to be working normally even with the misconfigured interfaces, this situation is especially frustrating with Debian-based guests as network access is not possible until the configuration is fixed. And this script fixes exactly that issue with the least possible configuration needed.

Best added as a firstboot script during the image generation to ensure instant network access on guest creation, using the option:
```
--firstboot "iface_setup.sh"
``` 

### setup_user.sh
A simple script to create a user with a randomized password and passwordless sudo privileges, while injecting a provided ssh key. While virt-builder's ```--ssh-inject``` option is helpful for such a case, it is only valid if the target user exists, which during the image creation is problematic as the only existing user is root. To address this the script by default(if no specific key is provided) will transfer the authorized_keys file from root to the newly created user, essentially "faking" the ```--ssh-inject``` option.

To implement it to your virt-builder creation string, you'll need to add the following options: 
```
--ssh-inject "root:file:public_key"
--firstboot "setup_user.sh"
```
