#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
	try
	{
		if A_IsCompiled
			Run *RunAs "%A_ScriptFullPath%" /restart
		else
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
	}
	ExitApp
}

;MsgBox A_IsAdmin: %A_IsAdmin%`nCommand line: %full_command_line
;MsgBox Hello World

BlockInput, On

Run, VBCABLE_Driver_Pack43/VBCABLE_Setup_x64.exe
CoordMode, Mouse, Relative

WinWait, VB-Audio Virtual Cable Driver Installation (Version 1.0.3.8), , 3
IfWinActive, VB-Audio Virtual Cable Driver Installation (Version 1.0.3.8)
{
	Click, 740, 380 ; click install

	; close pop-up confirmation window
  ; uninstall WinTitle is 'VBCABLE Uninstallation'
	WinWait, VBCABLE Installation
	ControlClick, OK, VBCABLE Installation

	;WinWait, Microsoft Edge
	;WinKill, Microsoft Edge

	return
}
BlockInput, Off
