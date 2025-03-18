---
title: Network Fundamentals With an Eye to Media and Streaming Requirements
author: Michael S. Liebman, CEV, CBNT
institute: SiriusXM
date: April 4, 2025
monofont: Fira Code
---

### Topics

#### What are we going to cover?

* The Fundamentals
* MoIP Essentials
* Architecture Guidance

#### What *aren't* we going to cover?

* Cisco, Arista, Mellanox, &lt;*insert switch vendor here*&gt; configuration
* Step-by-step for *your* network
* Consumer/last mile technology
* Much, much more

## The Fundamentals

### What is an MoIP network?

* A group or system of interconnected things
* Packet switched
* Probably wired
* Used internally, B2B, B2C/D2C, ad-hoc
* Uses Internet Protocol

### The Protocol Stack

<!-- mermaid renders this slightly wonky -->
<!--
``` {.mermaid width=1600}
flowchart LR
  classDef sub opacity:0
  classDef note fill:#fff, stroke:#fff, font-size:24pt

  subgraph notes [" "]
    OSI
    tcp(TCP/IP)
  end
  subgraph Check the Application
    direction TB
    Application --- Presentation --- Session
    app2[Application]
  end
  OSI -.-> Application
  tcp  -.-> app2
  Session --- Transport
  app2 --- trans2[Transport]
  app2 ~~~ Session
  subgraph Check the Protocol Stack
    direction TB
    Transport --- Network --- ll(Logical Link)
    trans2 --- Internet
    Internet --- na(Network Access)
  end
  ll --- Physical
  na --- phys2[Physical*]
  subgraph Check the Cable/NIC
    Physical
    phys2
  end
  class notes sub
  class OSI,tcp note
```
-->
![ ](images/layers.png)

::: notes

Physical is not technically part of the TCP/IP model.
LL/Network Access handles hop to hop delivery.
Network/Internet handles end to end delivery.
Transport handles service to service delivery.

:::

### Physical Layer

* Copper
  * 1, 2.5, 5, & 10 Gbit
  * Higher bit rate = higher CAT cable
  * Higher bit rate = higher termination quality
* Fiber
  * 10, 25, 40, 100 Gbit and up
  * Select optics and cable carefully
  *

::: notes

25 and 40 Gbit copper standardize, but not marketed.

:::

### Logical Link/Network Access

* Frames
*

### Network/Internet

* Packets

### Subnets

* A logical division of an IP network
* Same most-significant bits = same subnet
* Original style: Class A through E
* Now: Classless Inter-Domain Routing (CIDR)

+-----------------+-------------------------------------------------------+---------------------------------------------------------+
|                 | /24                                                   | /26                                                     |
+-----------------+---------------------------------------+---------------+---------------------------------------+-----------------+
|                 | Binary                                | Decimal       | Binary                                | Decimal         |
+=================+=======================================+===============+=======================================+=================+
| Address         | `11000000.00000000.00000010.10000010` | 192.0.2.130   | `11000000.00000000.00000010.10000010` | 192.0.2.130     |
+-----------------+---------------------------------------+---------------+---------------------------------------+-----------------+
| Subnet Mask     | `11111111.11111111.11111111.00000000` | 255.255.255.0 | `11111111.11111111.11111111.11000000` | 255.255.255.192 |
+-----------------+---------------------------------------+---------------+---------------------------------------+-----------------+
| Network Prefix  | `11000000.00000000.00000010.00000000` | 192.0.2.0     | `11000000.00000000.00000010.10000000` | 192.0.2.128     |
+-----------------+---------------------------------------+---------------+---------------------------------------+-----------------+
| Host Identifier | `00000000.00000000.00000000.10000010` | 0.0.0.130     | `00000000.00000000.00000000.00000010` | 0.0.0.2         |
+-----------------+---------------------------------------+---------------+---------------------------------------+-----------------+

### Transport

* Segments

### DNS

* Numbers are hard for people, names are better
* Divided into **zones**
* Authoritative name servers "own" a zone (SOA)
* Root name servers resolve TLDs
* Fully Qualified Domain Name (FQDN).

### Record Types

* **A/AAAA:** Name &#8594; IP Address
* **PTR:** IP Address &#8594; Name; DNS-SD
* **CNAME:** "Pretty" Name &#8594; "Real" Name
* **SRV:** Service location
* **TXT:** ~~Human~~ Machine-readable text

### DHCP

:::::::::::::: {.columns}
::: {.column width="50%"}

* Automated IP stack configuration
* Dynamic, automatic, & manual modes
* Client requests a *lease*, automatically renews
* Release & renew manually for troubleshooting
* *Options* let you configure more than just address

:::
::: {.column width="50%"}

![Do you have trouble using blankets?](images/snuggie.png)

:::
::::::::::::::

### Firewalls

:::::::::::::: {.columns}
::: {.column width="50%"}

* Monitors & controls incoming & outgoing network traffic
* Often between trusted & untrusted networks
* Packet filter/stateless, Connection tracking/stateful, application
* DMZ allows select public connections to some hosts

:::
::: {.column width="50%"}

![Don't be this station](https://i.imgflip.com/9msbiy.jpg)

:::
::::::::::::::

::: notes

<!-- vale proselint.But = NO -->
Stateless firewalls aren't frequently used in modern systems.
But you will see their mechanisms used for provide other network features.
For example, extended Berkeley Packet Filters (eBPF) safely extends kernel functionality.
<!-- vale proselint.But = YES -->

:::

### NAT

:::::::::::::: {.columns}
::: {.column width="50%"}

* A way to map one address space into another
* Often RFC1918 to/from public
* Basic/one-to-one: Just rewrite addresses
* One-to-many: Rewrite addresses and port numbers
* Watch out for CGNAT and double NAT

:::
::: {.column width="50%"}

![Network address translation between a private network and the Internet[^credit-nat]](https://upload.wikimedia.org/wikipedia/commons/c/c7/NAT_Concept-en.svg)

[^credit-nat]: Michel Bakni, [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0), via Wikimedia Commons

:::
::::::::::::::

## MoIP Essentials

### ST 2110 in 60 Seconds

:::::::::::::: {.columns}
::: {.column width="50%"}

* Real-time Transport Protocol (RTP) carries essence
  * UDP
  * Multicast
* Session Description Protocol (SDP) describes essence
* Precision Time Protocol (PTPv2) synchronizes essence
* Every essence is a separate flow
* Leaky bucket model for buffers

:::
::: {.column width="50%"}

![A basic ST 2110 network](images/2110.png)

:::
::::::::::::::

<!-- vale write-good.Passive = NO -->
### Roses Are Red, Redundant Paths Are Blue
<!-- vale write-good.Passive = YES -->

### VLAN & VXLAN

### IGMP

### Software Defined Networking

## Architecture Guidance

### Documentation

* Use the right tool for the job
* Use DCIM & IPAM like [NetBox](https://netbox.dev/)
* Use a consistent, straightforward visual language like the
  [C4 Model](https://c4model.com/)

::: notes

Spreadsheets aren't databases.

:::

### Define Requirements

### Compare Options

<!-- vale proselint.Very = NO -->
<!-- vale write-good.Weasel = NO -->

+----------------------+-------------------+-----------+-----------+----------------------------+
|  *Feature*           | *OISM*            | *Layer 3* | *SDN*     | *Layer 2*                  |
+:=====================+:==================+:==========+:==========+:===========================+
| **Key Technologies** | OISM, EVPN, VXLAN | BGP       | Vendor X  | PIM-SM                     |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Redundancy**       | MLAG, LACP        |           | 2022-7    | 2022-7 with crafted routes |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Multi-site**       | Good              | Good      | Poor      | Poor                       |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Scalability**      | Good              | Good      | Excellent | Poor                       |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Vendor Lock In**   | Low               | Very Low  | Moderate  | Very Low                   |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Route Time**       | Fast              | Fast      | Faster    | Fast-ish                   |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Fail-over Time**   | &lt; 10 ms        |           | Hitless   |                            |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Tally Time**       | Slow              | Slow      | Faster    | Slow                       |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Clean Switching**  | Probable          | Probable  | Yes       | Probable                   |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Bandwidth Aware**  | No                | No        | Yes       | No                         |
+----------------------+-------------------+-----------+-----------+----------------------------+
| **Video Support**    | Fair              | Fair      | Excellent | Poor                       |
+----------------------+-------------------+-----------+-----------+----------------------------+

<!-- vale proselint.Very = YES -->
<!-- vale write-good.Weasel = YES -->

::: notes

This is part of the analysis SiriusXM used to rank network architecture options.

:::
