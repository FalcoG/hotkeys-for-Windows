; This is not a Windows application.
; The purpose of this script is bringing the same window controls to Windows.
; https://www.spectacleapp.com/

AlignWindow(direction, key, value)
{
    WinGetPos,,, Width, Height, %key% %value%
	ScreenSection := Width / A_ScreenWidth
	
	; TODO: Check if this is the same order as Spectacle
	if (ScreenSection == 0.5) {
		ScreenSection := 1/3
	} else if (Round(ScreenSection, 2) == Round(1/3, 2)) {
		ScreenSection := 2/3
	} else {
		ScreenSection := 1/2
	}
	
	ScreenPositionX := direction == "left" ?  0 : A_ScreenWidth * (1-ScreenSection)
	
	; x, y, w, h
    WinMove, %key% %value%,, %ScreenPositionX%, 0, A_ScreenWidth * ScreenSection, A_ScreenHeight
}

!#f::WinMaximize, A

!#Left::
WinGet, active_pid, PID, A
AlignWindow("left", "ahk_pid", active_pid)
return

!#Right::
WinGet, active_pid, PID, A
AlignWindow("right", "ahk_pid", active_pid)
return