# Network Fundamentals With an Eye to Media and Streaming Requirements

[![prek](https://img.shields.io/badge/prek-enabled-brightgreen?logo=pre-commit)](https://prek.j178.dev/)
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC_BY--NC--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

<!-- vale Vale.Spelling["pandoc"] = NO -->

Use pandoc to convert to PowerPoint.

## Session Description

Forming a solid foundation of TCP/IP Data Networking.
With a brief review of fundamentals (subnetting, DHCP, NAT, DNS) and an introduction to industry-specific and advanced topics (multicast, PTP, SDN, VXLAN).
How to architect a flexible, resilient, and secure professional media environment.

## Editor Setup

<!-- vale Vale.Spelling["prek"] = NO -->

```bash
# Install prek: see https://prek.j178.dev/installation/
prek install
prek install --hook-type commit-msg
```

## Building

### Windows

Use the provided `build.bat` script:

```powershell
.\build.bat
```

### Linux/macOS

```bash
pandoc --from=markdown+yaml_metadata_block+emoji --slide-level=3 \
  --filter ./node_modules/.bin/mermaid-filter \
  .\media-net-fundamentals.md -o .\media-net-fundamentals.pptx
```

## Mermaid Filter Configuration

If you encounter issues with packet-beta diagrams, set the `MERMAID_FILTER_CMD_MMDC` environment variable to use the correct mermaid-cli version:

```powershell
$env:MERMAID_FILTER_CMD_MMDC = "mmdc"
```
