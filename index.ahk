#SingleInstance Force

#If WinActive("ahk_exe webstorm64.exe")

::<lorem>::Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent bibendum, leo non eleifend interdum, nisl sapien porta ligula, at laoreet mauris arcu eu augue. Suspendisse eget lectus at magna convallis condimentum. Fusce iaculis lectus ut nulla tempor, in porttitor est lobortis. Phasellus in enim vel ligula scelerisque efficitur vel nec erat. In ultricies malesuada diam, et suscipit nibh ullamcorper aliquam. Ut laoreet dui vitae felis commodo, pulvinar gravida felis consequat. Ut id eros sapien. Integer venenatis, neque sit amet placerat blandit, lectus augue rhoncus magna, at blandit nibh nisi vel augue.

; Take control of WIN KEY ( META )
;#::Send, #
;#::SendRaw, #
;LWin::Send, #
;RWin::Send, #
;#::
;1::Send, #
;2::Send, {LWin}
;3::Send, {RWin}

/*
LWin::
Typed=
While GetKeyState("LWin","p")
{
Input Var, L1 T.5
Typed.=Var
}
MsgBox %Typed%
Send, {vk5b down}%Typed%{vk5b up}
Return
*/

~LWin Up:: return
~RWin Up:: return

;1::Send, {SC91} ; https://stackoverflow.com/questions/15313469/java-keyboard-keycodes-list

#If

#If WinActive("ahk_exe chrome.exe")
	#include browsers/common.ahk
#If

#Include operating-system/macOS.ahk
#Include programs/spectacle.ahk