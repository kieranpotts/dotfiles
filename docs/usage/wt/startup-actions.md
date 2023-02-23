# Windows Terminal startup actions

WT's `settings.json` supports a `startupActions` property that can be used to [configure default command line arguments](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/startup#startup-actions), which will be used if no arguments are provided to `wt.exe` at execution. Example:

```json
{
  "startupActions": "--profile \"Git Bash\" --title \"Personal\" -d \"C:\\dev\\personal\"; new-tab --profile \"Git Bash\" --title \"Work\" -d \"C:\\dev\\work\"; focus-tab -t 1 "
}
```

Because the default tabs and panes I have vary from project to project, I tend to use different [command line arguments](https://learn.microsoft.com/en-us/windows/terminal/command-line-arguments) to start Windows Terminal on different machines. For this reason I prefer to create a `.bat` file for starting up Windows Terminal. Example:

```bat
start "Windows Terminal" wt.exe --profile "Git Bash" --title "Personal" -d "C:\dev\personal"; new-tab --profile "Git Bash" --title "Work" -d "C:\dev\work"; focus-tab -t 1
```

Alternatively, you could bind the `wt` command to a hotkey using [AutoHotkey](https://www.autohotkey.com/), or just create a Windows shortcut and pin it to your desktop or taskbar.
