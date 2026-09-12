# Upgrade to EBOS 2.0.0

2.0.0 renames all technical identifiers from Atlas to EB. Read this before
upgrading a machine that already runs EBOS 1.x.

## What changes on the machine

| Before (≤ 1.5.x) | After (2.0.0) |
|---|---|
| `C:\Windows\AtlasDesktop` | `C:\Windows\EBDesktop` |
| `C:\Windows\AtlasModules` | `C:\Windows\EBModules` |
| `HKLM\SOFTWARE\AtlasOS` | `HKLM\SOFTWARE\EBOS` |

## Upgrade (keeps your toggle states)

1. Build (or download) `EBOS Release.apbx` and drop it into AME Wizard.
2. Choose **Upgrade** (not fresh install).
3. `custom.yml` automatically copies `HKLM\SOFTWARE\AtlasOS` to
   `HKLM\SOFTWARE\EBOS` (once) and rewrites stored script paths to the new
   folders, then replaces the folders with the new files.

Your service toggles, file-sharing, power-saving and other Atlas-folder
settings survive. The old `AtlasDesktop`/`AtlasModules` folders are removed.

## Fresh install

Nothing to consider — only EB paths are ever created.

## Rollback

No automatic rollback across the 2.0.0 rename. To go back to 1.5.x, apply the
1.5.x playbook fresh (toggle states from 2.0.0 are not carried back).
