#SingleInstance Force
#Requires AutoHotkey v2.0

UserDir := EnvGet("USERPROFILE")

#include "outlook.ahk"
#include "harpoon.ahk"
#include "testwindows.ahk"
#include "autocorrect.ahk"

ShowOrRunApp(AppExe, WindowCondition) {
  SetTitleMatchMode 2
  if WinExist(WindowCondition) {
    WinActivate(WindowCondition)
  }
  else
  {
    RunWait AppExe
    if WinWait(WindowCondition, , 15)
      WinActivate(WindowCondition)
  }
  SetTitleMatchMode 1
}

; HOT KEYS ( REF.: # WindowKey, ! Alt, ^ Ctrl, + Shift, < or > side of the keyboard)

; Reload config
^!r::Reload

##::ShowOrRunApp("Teams.exe", "Microsoft Teams classic ahk_exe Teams.exe")
#1::ShowOrRunApp("firefox.exe", "ahk_exe firefox.exe")
<+#1::ShowOrRunApp("msedge.exe", "ahk_exe msedge.exe")
#2::ShowOrRunApp("C:/Program Files/Microsoft Office/root/Office16/OUTLOOK.EXE", "Inbox - Carl.Lefrancois@dfo-mpo.gc.ca - Outlook ahk_exe OUTLOOK.EXE ahk_class rctrl_renwnd32")
#3::ShowOrRunApp(UserDir . "/scoop/apps/obsidian/current/Obsidian.exe", "ahk_exe Obsidian.exe")
#4::OutlookMessages.ActivateOutlookWindow()
#5::OutlookMessages.CycleMessages()
#w::ShowOrRunApp(Format('explorer.exe "{1}\{2}"', UserDir, "Desktop\Travail"), "Travail ahk_exe explorer.exe ahk_class CabinetWClass")
#t::ShowOrRunApp(Format('explorer.exe "{1}\{2}"', UserDir, "Desktop\Temp"), "Temp ahk_exe explorer.exe ahk_class CabinetWClass")
#s::ShowOrRunApp(Format('explorer.exe "{1}\{2}"', UserDir, "Desktop\OneDrive - DFO-MPO"), "OneDrive - DFO-MPO ahk_exe explorer.exe ahk_class CabinetWClass")

#Enter::ShowOrRunApp("C:/Users/LefrancoisC/Desktop/Travail/apps/terminal-1.19.2682.0/wt.exe -w dev focus-tab -t 0", "ahk_exe WindowTerminal.exe")
; , "ahk_exe wsl.exe ahk_class PseudoConsoleWindow")
<+#Enter::ShowOrRunApp("C:/Users/LefrancoisC/Desktop/Travail/apps/terminal-1.19.2682.0/wt.exe -w dev focus-tab -t 1", "ahk_exe WindowTerminal.exe")
; "ahk_exe pwsh.exe ahk_class PseudoConsoleWindow")
<^#Enter::RunWait("C:/Users/LefrancoisC/Desktop/Travail/apps/terminal-1.19.2682.0/wt.exe -w dev")
; <^#Enter::ShowOrRun("C:/Users/LefrancoisC/Desktop/Travail/apps/terminal-1.19.2682.0/wt.exe --window dev new-tab -p 'Arch' ; C:/Users/LefrancoisC/Desktop/Travail/apps/terminal-1.19.2682.0/wt.exe --window dev new-tab -p 'PowerShell' ; C:/Users/LefrancoisC/Desktop/Travail/apps/terminal-1.19.2682.0/wt.exe --window dev focus-tab --target 0", "ahk_exe WindowTerminal.exe")
#F2::ListWindows()

; Harpoon windows
; Set Window #1 => AltGr + u
; Activate Window #1 => Win + u
#u::Harpoon.ActivateWindow(1)
<^>!u::Harpoon.SetWindow(1)

; Set Window #2 => AltGr + i
; Activate Window #2 => Win + i
#i::Harpoon.ActivateWindow(2)
<^>!i::Harpoon.SetWindow(2)

; Set Window #3 => AltGr + o
; Activate Window #3 => Win + o
#o::Harpoon.ActivateWindow(3)
<^>!o::Harpoon.SetWindow(3)

; Set Window #4 => AltGr + p
; Activate Window #4 => Win + p
#p::Harpoon.ActivateWindow(4)
<^>!p::Harpoon.SetWindow(4)

ToggleWinBar() {
  if WinActive("ahk_class Shell_TrayWnd ahk_exe explorer.exe")
  {
    ; Send("!{Esc}")
    WinHide("ahk_class Shell_TrayWnd ahk_exe explorer.exe")
  }
  else
  {
    WinShow("ahk_class Shell_TrayWnd ahk_exe explorer.exe")
  }
}
#Space::ToggleWinBar
