---
layout: post
title: "Storage Common Protocols: ATA and SCSI -> SAS iSCSI FC IB PCIE, etc."
highlight: true
summary: Make a summary and comparison between storage protocols which include ATA, SCSI, PCI-E
date: 2019-05-01
lang: en
location: Santiago, Chile
comments: true
tags: [storage]
---

> Recently some non-IT area colledges asked me to introduce them what is storage? So I am trying to make a summary about storage in datacenter, try to help them to understand enterprise storage. 

**At the beginning I will start from storage common protocols in this post, but don't worry, I will not introduce the very details about each protocols, I just introduce the following items:**

* Where these protocols work?
* Why need these protocols?
* What problem these protocols solve?

_For the very details each protocol details, I will give one suggestion link_

## Summary About the storage protocols ##
In the storage world, we mainly 

### 1. Parallel ATA or IDE ###
ATA alwasy known as Parallel ATA (PATA), originally **AT Attachment**, evolved in several stages from Western Digital's original **Itegrated Drive Electronics(IDE)**, the parallel ATA standard is the result of a long history of increamental techinical development, which is developed for the early PC AT(from IBM) equipment, [more details](https://en.wikipedia.org/wiki/IBM_Personal_Computer/AT). 

PATA cables have a maximum allowable length, because of this limit, the technology normally appears as _internal computer storage interface_, It has been replaced by SATA in newer system. 

And you also can check the Parallel ATA interface and cable as the followings, it's very papular in the personal PC.

_Parallel ATA interface_
<img src="{{ site.baseurl }}/img/posts/20190501_PATA_Interface.jpg" alt="Parallel ATA interface" />

_Parallel ATA cable_
<img src="{{ site.baseurl }}/img/posts/20190501_PATA_Cable.jpg" alt="Parallel ATA cable" />

### 2. SCSI ###


## SCSI Protocol (Small Computer System Interface)
SCSI protocol is very important protocol in the storage history, today whatever the storage is using Ethernet switch or FC switch, you must to know this basic knowledge.

SCSI is a client-server architecture, 
