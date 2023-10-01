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
  if WinExist(" - Carl.Lefrancois@dfo-mpo.gc.ca - Outlook ahk_exe OUTLOOK.EXE")
  {
    WinActivate
  }
  else
  {
    RunWait("C:/Program Files/Microsoft Office/root/Office16/OUTLOOK.EXE")
  }

}
OutlookMessages.ActivateOutlookWindow := ActivateOutlookWindow
