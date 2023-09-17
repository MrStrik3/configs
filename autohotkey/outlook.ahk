; Outlook window and messages handling

OutlookMessages := {}

OutlookMessages.Messages := []

OutlookMessages.CurrentMessageIndex := 0
OutlookMessages.IsCurrentlyCycling := False
OutlookMessages.StartedCyclingTimestamp := 0

RefreshListMessages(this) {

  OutlookIds := WinGetList("ahk_exe OUTLOOK.exe")

  for WindowId in OutlookIds
  {
    WindowTitle := WinGetTitle(WindowId)
    FoundPos := InStr(WindowTitle, "- Message")
    if FoundPos > 0 {
      OutlookMessages.Messages.Push(WindowId)
    }
  }
}
OutlookMessages.RefreshListMessages := RefreshListMessages

CycleOutlookMessages(this) {
  ElapsedTime := A_TickCount - this.StartedCyclingTimestamp
  if ElapsedTime > 30000 {
    ; Build a new list of messages
    ; MsgBox "Building Message list"
    this.RefreshListMessages()
    this.StartedCyclingTimestamp := A_TickCount
  }

  if (this.Messages.Length > 0)
  {
    ; Activate next message window
    this.CurrentMessageIndex := this.CurrentMessageIndex + 1
    if (this.CurrentMessageIndex > this.Messages.Length)
    {
      this.CurrentMessageIndex := 1
    }
    ; MsgBox this.CurrentMessageIndex
    WinActivate(this.Messages[this.CurrentMessageIndex])
  }

}
OutlookMessages.CycleMessages := CycleOutlookMessages

ActivateOutlookWindow(this) {
  WinActivate("Inbox - Carl.Lefrancois@dfo-mpo.gc.ca - Outlook")
}
OutlookMessages.ActivateOutlookWindow := ActivateOutlookWindow
