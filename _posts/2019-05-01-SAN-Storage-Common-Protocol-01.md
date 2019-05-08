---
layout: post
title: "Common Storage Protocols 01: ATA, SATA , SCSI, SAS and NL-SAS"
highlight: true
summary: Introduce the background about storage protocols, relationship between ATA, SATA, SCSI, SAS and NL-SAS
date: 2019-05-01
lang: en
location: Santiago, Chile
comments: true
tags: [storage]
---

> Background: recently some non-IT area collegues asked me what is datacenter storage? 

So I am trying to make a summary about storage history, try to help them to understand storage better. 

**At the beginning I will start from common storage protocols in this post, but don't worry, I will not introduce very detail about these protocols, but just a very simple way:**

* Where these protocols work?
* Why need these protocols?
* What problem these protocols solve?

_For the very details each protocol details, I will give one suggestion link_

## Summary
In 1980s, ATA and SCSI is popular in the computer world, because 

## Storage Protocols : From ATA to SATA and SCSI to SAS
This is the first post to introduce storage protocols, and these are lots of storage protocols, it's very difficult to introduce them all in one post, so I just introduce ATA -> SATA and SCSI -> SAS in this post. 

Considering most people know the PC, so I will introduce these knowledges according something similar to PC, and the following picture show a X86 Server hardware architecture.

<img src="{{ site.baseurl }}/img/posts/20190501_X86-Server-Architecture.jpg" alt="X86 Server Architecture" />

### 1. Parallel ATA or IDE ###
ATA alwasy known as Parallel ATA (PATA), originally **AT Attachment**, evolved in several stages from Western Digital's original **Itegrated Drive Electronics(IDE)**, the parallel ATA standard is the result of a long history of increamental techinical development, which is developed for the early PC AT(from IBM) equipment, [more details](https://en.wikipedia.org/wiki/IBM_Personal_Computer/AT). 

The IDE drives appeared in Compaq PCs in 1986, and the interface was standardized in 1994 as ANSI standard X3.221-1994, known as ATA-1.

PATA cables have a maximum allowable length, because of this limit, the technology normally appears as _internal computer storage interface_, It has been replaced by **SATA** in newer system. 

And you also can check the Parallel ATA interface and cable as the following images, it was very papular in the personal PC.

_Parallel ATA interface_

<img src="{{ site.baseurl }}/img/posts/20190501_PATA_Interface.jpg" alt="Parallel ATA interface" />

_Parallel ATA cable_

<img src="{{ site.baseurl }}/img/posts/20190501_PATA_Cable.jpg" alt="Parallel ATA cable" />

> Reference from [WIKI](https://en.wikipedia.org/wiki/Parallel_ATA)

### 2. Serial ATA (SATA)
**Serial ATA** (SATA, abbreviated from **Serial AT Attachment**), is a computer bus interface that connects host bus adapters to mass storage devices such as hard disk drives, optical drives, and solid-state drives. 

SATA was announced in 2000 in order to replace the early PATA interface, and provides the advantanges as the followings:
1. Reduce cable size and cost (seven conductors instead of 40 or 80).
1. Native hot swapping.
1. Faster data transfer. _PATA maximum can support 1.064  Gbit/s, while SATA revision 1.0 supports 1.5 Gbit/s_
1. More efficient transfer rate through an (optional) I/O queuing protocol. _Half Duplex_

Now the most popular SATA revision is 3.0, the following table will show the comparison result:

Protocol Name | Version | RAW Data Rate 
------------- | ------- | -------------
ATA | 133 | 1.064 Gbit/s  
SATA | 1.0 | 1.5 Gbit/s
SATA | 3.0 | 6 Gbit/s

At the same time, SATA will bring more benefits, for exmple longer cable length support, simple cabling, etc. 

> Reference from [WIKI](https://en.wikipedia.org/wiki/Serial_ATA)


### 3. Simple Computer System Interface (SCSI)
The ancestral SCSI standard, X3.131-1986, generally referred to as SCSI-1, was published by the X3T9 technical committee of the American National Standards Institute (ANSI) in 1986.

SCSI is a client-server architecture, it defines commands, protocols, electrical, optical and logical interfaces. It's a set of standards for physical connecting and tranfering data between computers and pirepheral devices.

SCSI is most commonly used for hard disk drives and tape drives, but it can connect a wide range of other devices, including scanners and CD drives.

The "small" reference in "small computer system interface" is historical, since the mid-1990s, SCSI has been available on even the largest of computer system.

### 4. Serial Attached SCSI (SAS)
In computeing world, Serial Attached SCSI(SAS) is a point to point connection (same to SATA), use the same transport technology as SATA but extends it.

SAS can support to control up to 16,384 devices from a single HBA by using external expanders, and works in a __Full-Duplex__ Model.

Today SAS 3.0 interface can support 12 Gbit/s connection, and SAS interface is compatible with SATA, so you can connect one SATA disk to SAS interface, __but you CANNOT connect the SATA disk to SAS interface.__

### 5. Addtional Protocol: Nearline SAS
NL-SAS (abbreviated from Nearline SAS) drives have the SAS interface, but head, media, and rotational speed of traditional enterprise-class SATA drives, so they cost less than other SAS drives. When compared to SATA, NL-SAS drives have the following benefits:

1. 12 Gbit/s interface data transfer rate
1. Dual ports allowing redundant paths
1. Ability to connect a device to multiple computers
1. Full SCSI command set
1. No need for using Serial ATA Tunneling Protocol (STP), which is necessary for SATA HDDs to be connected to a SAS HBA.
1. No need for SATA interposer cards, which are needed for pseudo–dual-port high availability of SATA HDDs.
1. Larger depth of command queues

