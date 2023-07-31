# Confluence-to-Obsidian

Basic scripts for converting Confluence HTML to Obsidian Markdown. **Warning: This is incomplete and will likely never be fully complete.** The objective of this project was to migrate notes taken on Confluence to Obsidian. Priority was text, attachments and folder structure may not be preserved.

Confluence HTML exports are converted to Markdown using Pandoc through a Powershell script. Additional Lua filters are applied to fix formatting. Modify scripts as needed.

The current script removes images and breadcrumb links. HTML in the Markdown output is minimized, however, some tables may not be converted.

## Basic Usage

1. Install Pandoc. https://pandoc.org/installing.html
1. Export Confluence workspace to HTML
1. Clone this repo or just copy the scripts
1. Modify powershell script to specify the folder container Confluence workspace HTML, destination folder and Lua script
1. Run powershell script
