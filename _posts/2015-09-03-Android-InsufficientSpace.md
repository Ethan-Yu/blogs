---
layout: post
title: "Fixing annoying Android's 'insufficient storage available' issue"
lang: en
comments: true
thumbnail: Android11Gb.png
summary: "Fixing 'insufficient storage' issue by utilizing external SD card, rooted image and fdisk/mkfs/mount. Describes procedure for CAT B15 phone but can be used with other Android phones as well"
tags: [android,linux]
---

# The root of all evil: ridiculously small amount of free space in '/data' partition

<img src="{{site.baseurl}}/public/images/Android11Gb-goal.png" width="50%" alt="Android 'Apps' phone screenshot" align="left" style="margin: 0px 15px">

I am happy [CAT B15](http://www.catphones.com/phones/b15q-smartphone/) user. So far it's the only phone in my possession which survived more than 1 year — it is rugged and therefore
can cope with my lifestyle. But last months it became almost unusable because of 'insufficient storage available' message which came out all the time.

The reason is simple — system updates are installed to the '/data' partition which has only 1 GB and they take around half of available space.
I googled and found a lot of ridiculous solutions like 'install app X and it will magically solve all your problems including this', 'put all apps to the SD and you will save additional 40M' etc.


These advices sounded like a meaningless loss of time and I decided to fix the real problem which is lack of space in '/data'.
1 GB is ridiculously low limit for modern device with a lot of apps and updates for Android components.

May be my way of fixing the problem can be helpful for other users of Caterpillar phones and other Android phones with similar issues.

<!--break-->

# Step 0: Backup everything

If something goes wrong you can lose your data. Make sure to backup all the valuable content before hacking your device!

# Step 1: order external SD memory card

Buy the [fastest](https://www.sdcard.org/developers/overview/speed_class/) and biggest SD card available. My choice was 32 GB Kingston microSD SDHC UHS-I class 10 memory card. If you want to have
more space, don't forget to check phone specifications (E.g., CAT B15 supports extended storage up to 32 GB only).

# Step 2: root your Android

This part is most time-consuming — find rooted firmware compatible with your phone (by the way, the file I've found was named ```CAT_B15_EMEA_DS.1.041.0_Rooted.rar```). Don't be tempted by different
apps which promise you root without re-flashing. This is not what you need.

Start from checking is your phone supported by [cyanogen](http://wiki.cyanogenmod.org/w/Devices). Unfortunately CAT phones are not supported at the moment of writing this post.

# Step 3: install adb tools for Android

Install [Android Debug Bridge](http://developer.android.com/tools/help/adb.html) for you platform. It's part of [Android SDK](https://developer.android.com/sdk/installing/index.html) platform
tools.

# Step 4: partitioning and formatting external SD memory card

Insert your fresh SD card to the phone and partition it. I've made 1 partition for '/data' (11 GB) and another one to be "usual" external mmc (21 GB).

Partitioning is explained in more details [here](http://forum.xda-developers.com/showthread.php?t=907436). I will just list the steps:

+ Launch adb and get shell prompt
+ ```$ su```
+ ```# fdisk /dev/block/mmcblk1```  Be sure you are repartitioning the proper card! Otherwise you can loose all your data.
+ Create two primary partition vfat (first!) and Linux (second) and exit fdisk with 'w' command.
+ Format newly created partitions (Again, be very careful with device names!):

```
# mke2fs -j -m0 -b4096 -Oextents,uninit_bg,dir_index /dev/block/mmcblk1p2
# mkfs.vfat /dev/block/mmcblk1p1

```

Reboot the phone and check that freshly created partition became visible by phone and through USB mass storage connection.

# Step 5: Copy old '/data' to the new location

Now we need to transfer the data from old '/data' partition to the new one. Connect to the phone through adb again and obtain root shell.

First, we need to mount new linux partition to some place, e.g:

```
# mkdir /storage/sdcard0/DATAANDROID/
# mount -t ext4 /dev/block/mmcblk1p2 /storage/sdcard0/DATAANDROID/
```

Second, we can copy the contents of '/data' directory to the new location. Prior to doing this, disable phone network connectivity in order to prevent the '/data' content from being
modified while it is being copied to the new location.

Copying itself:

```
# cd /storage/sdcard0/DATAANDROID/
# cp -rp /data/* .
```

# Step 6: mount new '/data' during boot

Now we need to change the mounted device  for '/data' directory. Unfortunately I have not managed to find a straight-forward way to edit '/data' mount point in the timeframe I had for the task
(I will be happy to hear the proper way.  Leave your comments to this post please, I read them). So, I implemented small hack.

We will re-mount '/data' partition in the very early stage of [Android bootup process](https://community.freescale.com/docs/DOC-102546) — before zygote is started.

So, launch adb and obtain a root shell again.

First, remount '/system' in read-write mode:

```
# mount -o remount,rw /system
```

Rename vold (Android Volume daemon) binary:

```
# cd /system/bin
# mv vold vold_bin
```

Create script ```/system/bin/vold``` which mounts '/data' again and calls ```vold_bin```:

```
#!/system/bin/sh

mount -t ext4 /dev/block/mmcblk1p2 /data

/system/bin/vold_bin

```

*Make sure it has exactly the same permissions and ownership as original vold binary!* Output in my system:

```
# ls -l vold vold_bin
-rwxr-xr-x root     shell          82 2015-09-05 09:52 vold
-rwxr-xr-x root     shell       91776 2013-03-15 10:16 vold_bin
```

# It's done!

That's it. Reboot the phone and forget about 'insufficient storage available' annoying problem.

{% include twitter_plug.html %}

