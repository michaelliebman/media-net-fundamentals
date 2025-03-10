# Network Fundamentals With an Eye to Media and Streaming Requirements

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC_BY--NC--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

<!-- vale Vale.Spelling["pandoc", "subnetting"] = NO -->

Use pandoc to convert to PowerPoint.

## Session Description

Forming a solid foundation of TCP/IP Data Networking.
With a brief review of fundamentals (subnetting, DHCP, NAT, DNS) and an introduction to industry-specific and advanced topics (multicast, PTP, SDN, VXLAN).
How to architect a flexible, resilient, and secure professional media environment.

## Editor Setup

```bash
pip install pre-commit
pre-commit install
pre-commit install --hook-type commit-msg
pandoc --from=markdown+yaml_metadata_block+emoji --slide-level=3 \
  .\media-net-fundamentals.md -o .\media-net-fundamentals.pptx
```
