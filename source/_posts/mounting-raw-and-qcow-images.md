---
title: Mounting Raw and QCOW2 Images
categories: virtualization
date: 2020-07-17 15:26:22
updated: 2020-07-17 15:26:22
tags:
  - virtualization
---
# 挂载 Raw 和 QCOW2 格式镜像

## 挂载 Raw 格式镜像

### Mounting The Raw Image

Associate the raw image with a loop device:

```shell
losetup /dev/loop0 image.raw
```

Map the partitions to loop devices:

```shell
kpartx -a /dev/loop0
```

You should be able to mount the partitions now:

```shell
mount /dev/mapper/loop0p1 /mnt/t01
```

### Unmounting The Raw Image

Unmount the previously mounted partitions:

```shell
umount /dev/t01
```

Undo the mapping of the partitions to the loop devices:

```shell
kpartx -d /dev/loop0
```

Destroy the loop:

```shell
losetup -d /dev/loop0
```

## 挂载 QCOW2 格式镜像

This is a quick guide to mounting a qcow2 disk images on your host server. This is useful to reset passwords,
edit files, or recover something without the virtual machine running.

### Step 1 - Enable NBD on the Host

```shell
if [ "$(lsmod | grep -E '\bnbd\s' -c)" -lt 1 ]; then
    modprobe nbd max_part=8
fi
```

### Step 2 - Connect the QCOW2 as network block device

```shell
qemu-nbd --connect=/dev/nbd0 vm-100-disk-1.qcow2
# qemu-nbd -c /dev/nbd0 vm-100-disk-1.qcow2
```

### Step 3 - Find The Virtual Machine Partitions

```shell
# fdisk /dev/nbd0 -l
fdisk /dev/nbd0 -l|grep -E '/dev/.*p[0-9]'|cut -d' ' -f1
```

### Step 4 - Mount the partition from the VM

```shell
mkdir -p /mnt/somepoint/
mount /dev/nbd0p1 /mnt/somepoint/
```

### Step 5 - After you done, unmount and disconnect

```shell
umount /mnt/somepoint/
qemu-nbd --disconnect /dev/nbd0
# qemu-nbd -d /dev/nbd0
rmmod nbd
```

---

- [Mounting Raw and qcow2 Images](https://www.linuxunbound.com/2016/07/mounting-raw-and-qcow2-images/)
- [https://gist.github.com/shamil/62935d9b456a6f9877b5](How to mount a qcow2 disk image)
