; Outlook window and messages handling
#Requires AutoHotkey v2.0

OutlookMessages := {}

OutlookMessages.StartedCyclingTimestamp := 0

RefreshListMessages(this) {
  GroupAdd("OutlookMessages", "- Message ahk_exe OUTLOOK.exe")
}
OutlookMessages.RefreshListMessages := RefreshListMessages

CycleOutlookMessages(this) {
  ; ElapsedTime := A_TickCount - this.StartedCyclingTimestamp
  ; this.StartedCyclingTimestamp := A_TickCount
  ; if ElapsedTime > 10000 {
    ; Build a new list of messages
    ; MsgBox "Building Message list"
    this.RefreshListMessages()
  ; }
  GroupActivate("OutlookMessages", "R")
}
OutlookMessages.CycleMessages := CycleOutlookMessages

ActivateOutlookWindow(this) {
  ; if WinExist(" - Carl.Lefrancois@dfo-mpo.gc.ca - Outlook ahk_exe OUTLOOK.EXE")
  SetTitleMatchMode 2
  if WinExist(" Carl.Lefrancois@dfo-mpo.gc.ca - Outlook ahk_exe OUTLOOK.EXE ahk_class rctrl_renwnd32")
  ; if WinExist("i)^.* Carl.Lefrancois@dfo-mpo.gc.ca - Outlook ahk_exe OUTLOOK.EXE ahk_class rctrl_renwnd32")
  {
    WinActivate(" Carl.Lefrancois@dfo-mpo.gc.ca - Outlook ahk_exe OUTLOOK.EXE ahk_class rctrl_renwnd32")
  }
  else
  {
    RunWait("C:/Program Files/Microsoft Office/root/Office16/OUTLOOK.EXE")
  }
  SetTitleMatchMode 1
}
OutlookMessages.ActivateOutlookWindow := ActivateOutlookWindow

; Show the meeting reminders!
SetTimer(showReminderWindow, 25000)


ShowReminderWindow()
{
  SetTitleMatchMode 2
  if WinExist("Reminder(s) ahk_exe OUTLOOK.EXE ahk_class #32770")
  {
    WinActivate("Reminder(s) ahk_exe OUTLOOK.EXE ahk_class #32770")
  }

  SetTitleMatchMode 1
}
