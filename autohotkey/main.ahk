#SingleInstance Force
#Requires AutoHotkey v2.0

UserDir := EnvGet("USERPROFILE")

#include "outlook.ahk"
#include "harpoon.ahk"
#include "testwindows.ahk"
#include "autocorrect.ahk"

ShowOrRunApp(AppExe, WindowCondition) {
  if WinExist(WindowCondition) {
    WinActivate
  }
  else {
    RunWait AppExe
    if WinWait(WindowCondition, , 15)
      WinActivate
  }
}

^!r::Reload

#1::ShowOrRunApp("firefox.exe", "ahk_exe firefox.exe")
<+#1::ShowOrRunApp("msedge.exe", "ahk_exe msedge.exe")
#2::ShowOrRunApp("C:/Program Files/Microsoft Office/root/Office16/OUTLOOK.EXE", " - Carl.Lefrancois@dfo-mpo.gc.ca - Outlook ahk_exe OUTLOOK.EXE ")
#3::ShowOrRunApp(UserDir . "/scoop/apps/obsidian/current/Obsidian.exe", "ahk_exe Obsidian.exe")
#4::OutlookMessages.ActivateOutlookWindow()
#5::OutlookMessages.CycleMessages()
#j::ShowOrRunApp(Format('explorer.exe "{1}\{2}"', UserDir, "Desktop\Travail"), "Travail ahk_exe explorer.exe ahk_class CabinetWClass")
#k::ShowOrRunApp(Format('explorer.exe "{1}\{2}"', UserDir, "Desktop\Temp"), "Temp ahk_exe explorer.exe ahk_class CabinetWClass")
#h::ShowOrRunApp(Format('explorer.exe "{1}\{2}"', UserDir, "Desktop\OneDrive - DFO-MPO"), "OneDrive - DFO-MPO ahk_exe explorer.exe ahk_class CabinetWClass")

; #Enter::ShowOrRunApp('WindowsTerminal.exe')
; #Enter::ShowOrRunApp("wt.exe --maximized", "ahk_exe WindowsTerminal.exe")
#Enter::ShowOrRunApp(Format("wezterm-gui.exe --config-file {1}\Desktop\Temp\Repositories\configs\wezterm\wezterm_arch.lua", UserDir), "wslhost.exe ahk_exe wezterm-gui.exe")
; <+#Enter::ShowOrRunApp(Format("wezterm-gui.exe --config-file {1}\Desktop\Temp\Repositories\configs\wezterm\wezterm_win.lua", UserDir), "pwsh.exe ahk_exe wezterm-gui.exe")
<+#Enter::ShowOrRunApp("alacritty.exe", "alacritty")
#F2::ListWindows()
; #F4::Run Format('explorer.exe /n /e ,"{1}"', "C:\Users\LefrancoisC\Desktop\Travail")

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


