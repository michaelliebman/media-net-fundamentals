---
title: Network Fundamentals With an Eye to Media and Streaming Requirements
author: Michael S. Liebman, CEV, CBNT
institute: SiriusXM
date: April 4, 2025
monofont: Fira Code
---

### What are we going to cover?

* The Fundamentals
* MoIP Essentials
* Architecture Guidance

### What *aren't* we going to cover?

* Cisco, Arista, Mellanox, &lt;*insert switch vendor here*&gt; configuration
* Step-by-step for *your* network
* Consumer/last mile technology
* Much, much more

## The Fundamentals

### What is an MoIP network?

### The Protocol Stack

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

### Physical Layer

### Logical Link/Network Access

### Network/Internet

### Transport

## MoIP Essentials

### ST 2110 in 60 Seconds

<!-- vale write-good.Passive = NO -->
### Roses Are Red, Redundant Paths Are Blue
<!-- vale write-good.Passive = YES -->

### VLAN & VXLAN

### IGMP

### Software Defined Networking

## Architecture Guidance

### Documentation

### Define Requirements

### Compare Options
