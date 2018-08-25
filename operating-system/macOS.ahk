;;; Cursor control ;;;
#a::Send, ^a ; Select all
#c::Send, ^c ; Copy
#x::Send, ^x ; Cut
#v::Send, ^v ; Paste
#z::Send, ^z ; Undo operation
#+z::Send, ^+z ; Redo operation
!+Left::Send, ^+{Left} ; Select to left
!+Right::Send, ^+{Right} ; Select to right
!Left::Send, ^{Left} ; Move cursor left 
!Right::Send, ^{Right} ; Move cursor right
#Left::SendInput, {Home} ; Move cursor to the start
#Right::SendInput, {End} ; Move cursor to the end

;;; Media keys ;;;
RAlt & F7::SendInput, {Media_Prev}
RAlt & F8::SendInput, {Media_Play_Pause}
RAlt & F9::SendInput, {Media_Next}
RAlt & F10::SendInput, {Volume_Mute}
RAlt & F11::SendInput, {Volume_Down}
RAlt & F12::SendInput, {Volume_Up}

;;; Program management ;;;

#w::Send, ^w ; Close the current window
#r::Send, ^r ; Reload
#s::Send, ^s ; Save
#f::Send, ^f ; Find

; Quit program
#q::
WinGet, CurrentExe, ProcessName, A
if (CurrentExe != "explorer.exe")
{
	Process, Close, %CurrentExe% ; TODO: Gracefully close
}
return

; Hide the current window
#h::
WinGetClass, CurrentActive, A
WinMinimize ahk_class %CurrentActive%
return

; Cycle through application windows
#`::
WinGet, CurrentExe, ProcessName, A
WinGetClass, CurrentActive, A
WinGet, Instances, Count, ahk_exe %CurrentExe%
If Instances > 1
	WinSet, Bottom,, A
WinActivate, ahk_exe %CurrentExe%
return

; [cmd] [l] Activate address bar - todo: override windows screen lock
/*
#l::Send, ^l
return
*/

; [cmd] [tab] Cycle applications
/*
; Does not show the alt+tab 'overlay'
#Tab::
Send, !{Tab}
return
LWin & LTab::AltTab ; next tab
#+Tab::ShiftAltTab ; prev tab
*/
