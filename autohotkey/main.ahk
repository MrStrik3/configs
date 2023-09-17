#SingleInstance Force
UserDir := EnvGet("USERPROFILE")

; #include "i3wm.ahk"
; #include "apps.ahk"
#include "outlook.ahk"
#include "harpoon.ahk"
; #include "testwindows.ahk"

ShowOrRunApp(appexe) {
  ; firefoxId := WinExists("ahk_exe firefox.exe")
  exepath_array := StrSplit(appexe, "/", ".")
  tempappexe := "ahk_exe " . exepath_array[exepath_array.Length]
  if WinExist(tempappexe) {
    WinActivate(tempappexe)
  } else {
    Run appexe
  }

}

#1::ShowOrRunApp('firefox.exe')
<+#1::ShowOrRunApp('msedge.exe')
#2::ShowOrRunApp('C:/Program Files/Microsoft Office/root/Office16/OUTLOOK.EXE')
#3::ShowOrRunApp(UserDir . '/scoop/apps/obsidian/current/Obsidian.exe')
#4::OutlookMessages.ActivateOutlookWindow()
#5::OutlookMessages.CycleMessages()
#j::Run Format('explorer.exe /n /e ,"{1}"', "C:\Users\LefrancoisC\Desktop\Travail")
#k::Run Format('explorer.exe /n /e ,"{1}"', "C:\Users\LefrancoisC\Desktop\Temp")

#Enter::ShowOrRunApp('WindowsTerminal.exe')
; #F2::ShowOrRunApp('firefox.exe')
; #F4::Run Format('explorer.exe /n /e ,"{1}"', "C:\Users\LefrancoisC\Desktop\Travail")

; Harpoon windows
#u::Harpoon.ActivateWindow(1)
<^>!u::Harpoon.SetWindow(1)

#i::Harpoon.ActivateWindow(2)
<^>!i::Harpoon.SetWindow(2)

#o::Harpoon.ActivateWindow(3)
<^>!o::Harpoon.SetWindow(3)

#p::Harpoon.ActivateWindow(4)
<^>!p::Harpoon.SetWindow(4)

