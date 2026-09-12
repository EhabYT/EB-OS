# Troubleshooting

## First step: verify

Atlas/EB folder → `9. Troubleshooting` → `Verify EBOS Configuration.cmd`

It checks services (`SysMain`/`ClipSVC` Manual), security policies (UAC,
Spotlight, telemetry), QoL registry (startup delay, taskbar search),
power plan, theme and OEM info. Re-run it with `-FixIssues` to repair
everything it reports:

```powershell
& "C:\Windows\EBDesktop\9. Troubleshooting\Verify-EBOS.ps1" -FixIssues -DetailedOutput
```

Needs admin rights for the `HKLM` checks.

## Common issues

- **winget missing / stub**: `Install-Software.ps1` bootstraps App Installer
  automatically (needs internet). If it still fails, install *App Installer*
  from the Microsoft Store and re-run.
- **No internet during apply**: software installs (browsers, OBS, Store apps)
  and the Windhawk/Toolbox downloads require a connection. Registry tweaks
  apply offline.
- **Windhawk not installed although checked**: the ISO path only pre-installs
  it when staged with `Stage-ImageFiles.ps1 -IncludeWindhawk`. Otherwise it
  installs on demand when the playbook option is applied (needs internet
  unless `windhawk-cli-installer.exe` is next to the script).
- **Old `AtlasDesktop` folder still present after upgrade to 2.0.0**: the
  upgrade removes it. If it survives (e.g. files in use), reboot and re-apply,
  or delete `C:\Windows\AtlasDesktop` and `C:\Windows\AtlasModules` manually
  after confirming `C:\Windows\EBDesktop` / `EBModules` exist.
- **Context menus / taskbar broken after tinkering**: Atlas/EB folder →
  `9. Troubleshooting` → `Set services to defaults.cmd`.

## Reporting issues

Run the Verify script with `-DetailedOutput`, save the output, and include
your playbook version (`playbook.conf` → `<Version>`) and Windows build
(`winver`, supported: 24H2/25H2).
