---
layout: post
title: "Common Storage Protocols: ATA evolved to SATA, and SCSI -> SAS"
highlight: true
summary: Introduce the background about storage protocols, focus on ATA to SATA and SCSI to SAS
date: 2019-05-01
lang: en
location: Santiago, Chile
comments: true
tags: [storage]
---

> Recently some non-IT area collegues asked me what is storage in datacenter? 

So I am trying to make a summary about storage, try to help them to understand storage. 

**At the beginning I will start from storage common protocols in this post, but don't worry, I will not introduce very detail about these protocols, but just a very simple way:**

* Where these protocols work?
* Why need these protocols?
* What problem these protocols solve?

_For the very details each protocol details, I will give one suggestion link_

## Summary About the storage protocols ##
This is the first post to introduce storage protocols, and these are lots of storage protocols, so we just start to introduce the ATA -> SATA and SCSI -> SAS. 

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
1. Faster data transfer. _PATA maximum can support 1.064 Gbit/s, while SATA revision 1.0 supports 1.5Gbit/s_
1. More efficient transfer rate through an (optional) I/O queuing protocol.

Now the most popular SATA revision is 3.0, the following table will show the comparison result:
Protocol Name | Version | RAW Data Rate 
--------------|--------------|--------------
ATA | 133 | 1.064Gbit/s  
SATA | 1.0 | 1.5Gbit/s
SATA | 3.0 | 6Gbit/s

At the same time, SATA will bring more benefits, for exmple longer cable length support. 

> Reference from [WIKI](https://en.wikipedia.org/wiki/Serial_ATA)
