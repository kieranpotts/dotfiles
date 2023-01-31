# Windows Terminal settings

My Windows Terminal settings are included with these dotfiles, for easy portability between machines.

To install:

1.  Open Windows Terminal. 

2.  Go to **Settings** and follow the link to **Open JSON File**.

3.  In **Explorer** navigate to the directory containing your Windows Terminal `settings.json` file.

4.  Close Windows Terminal and delete the `settings.json` file. 

5.  Run Windows Powershell as Administrator. Use the old Powershell program, not the new Windows Terminal, as doing so will recreate WT's `settings.json` file – which MUST not exist for the next step to succeed.

6.  Run the following Powershell command to create a hard link to the `src/configs/wt.json` file distributed in this repository.

    ```powershell
    New-Item -ItemType HardLink -Path "C:\Users\Kieran\AppData\Local\Packages\Microsoft.WindowsTerminal_[hash]\LocalState\settings.json" -Target "C:\path/to\dotfiles\src\configs\wt.json"
    ```

7.  Open **Windows Terminal** to check the changes are effective.

## Other settings

WT's `settings.json` supports a `startupActions` property that can be used to [configure default command line arguments](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/startup#startup-actions), which will be used if no arguments are provided to `wt.exe` at execution. Example:

```json
{
  "startupActions": "--profile \"Git Bash\" --title \"Personal\" -d \"C:\\dev\\personal\"; new-tab --profile \"Git Bash\" --title \"Work\" -d \"C:\\dev\\work\"; focus-tab -t 1 "
}
```

Because the default tabs and panes I have vary from project to project, I tend to use different [command line arguments](https://learn.microsoft.com/en-us/windows/terminal/command-line-arguments) on different machines. For this reason I prefer to create a `.bat` file for starting up Windows Terminal with my machine-specific defaults. Example:

```bat
start "Windows Terminal" "C:\Program Files\WindowsApps\...\wt.exe" --profile "Git Bash" --title "Personal" -d "C:\dev\personal"; new-tab --profile "Git Bash" --title "Work" -d "C:\dev\work"; focus-tab -t 1
```

Alternatively, you could bind the `wt` startup command to a hotkey using [AutoHotkey](https://www.autohotkey.com/) or just create a Windows shortcut and pin it to your desktop or taskbar.
