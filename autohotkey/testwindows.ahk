﻿#Requires AutoHotkey v2.0

ListWindows() {
  ids := WinGetList(,, "Program Manager")
  for this_id in ids
  {
    WinActivate this_id
    this_class := WinGetClass(this_id)
    this_title := WinGetTitle(this_id)
    this_process := WinGetProcessName(this_id)
    Result := MsgBox(
    (
      "Visiting All Windows
      " A_Index " of " ids.Length "
      ahk_id " this_id "
      ahk_class " this_class "
      ahk_exe " this_process "
      Title " this_title "

       Continue?"
    ),, 4)
    if (Result = "No")
        break
  }
}

