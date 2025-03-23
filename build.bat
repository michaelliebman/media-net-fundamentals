@echo off
CALL pandoc -F pandoc-plantuml -F ./node_modules/.bin/mermaid-filter.cmd --from=markdown+yaml_metadata_block+emoji --slide-level=3 --reference-doc=template.pptx .\media-net-fundamentals.md -o .\media-net-fundamentals.pptx
