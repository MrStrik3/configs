; Implementation of ThePrimeagen's harpoon vim extension : https://github.com/ThePrimeagen/harpoon
; 1 to 4

Harpoon := {}

Harpoon.WindowList := [False, False, False, False]

SetWindow(this, Id) {
  this.WindowList[Id] := WinGetId("A")
}

Harpoon.SetWindow := SetWindow

ActivateWindow(this, Id) {
  SearchWindow := Format( "ahk_id {1}", this.WindowList[Id])
  WinActivate( SearchWindow )
}
Harpoon.ActivateWindow := ActivateWindow
