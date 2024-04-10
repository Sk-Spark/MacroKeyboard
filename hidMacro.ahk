myVariable := 123

;Trigger = a // Alt + Tab
$^F13::  ; This line defines a hotkey for the Ctrl F13 key. The $ sign prevents the hotkey from triggering itself in a loop.
    Send, !{Tab}  ; This line simulates the pressing of Alt + Tab.
return  ; This line ends the hotkey definition.

;Trigger = q // Open alert box
$+F13::  ; This line defines a hotkey for the F1 key. The $ sign prevents the hotkey from triggering itself in a loop.
    MsgBox, Shift_ F13_  ; This line opens an alert box with the message "Hello World!".
return  ; This line ends the hotkey definition.

;Trigger = w // Open alert box
$!F13::  ; This line defines a hotkey for the Alt F13 key. The $ sign prevents the hotkey from triggering itself in a loop.
    MsgBox, Alt_ F13_  ; This line opens an alert box with the message "Hello World!".
return  ; This line ends the hotkey definition.

;Trigger = e // explain selected code in VS code by copilet
$F14::  ; This line defines a hotkey for the F14 key. The $ sign prevents the hotkey from triggering itself in a loop.
    Send, ^i
    Sleep, 50
    Send, \explain
    Sleep, 50
    Send, {Enter}
return  ; This line ends the hotkey definition.

;Trigger = o // open copilet 
$F15::  ; This line defines a hotkey for the F15 key. The $ sign prevents the hotkey from triggering itself in a loop.
    Send, ^i
return  ; This line ends the hotkey definition.

;Trigger = c // comment selected code in VS code
$F16::  ; This line defines a hotkey for the F16 key. The $ sign prevents the hotkey from triggering itself in a loop.
    IfWinActive, ahk_exe Code.exe
    {
        Send, ^/
    }
    else IfWinActive, ahk_exe devenv.exe
    {
        Send, ^k
        Sleep, 50
        Send, c
    }
return  ; This line ends the hotkey definition.

;Trigger = u // uncomment selected code in VS code & VS
$F17::  ; This line defines a hotkey for the F17 key. The $ sign prevents the hotkey from triggering itself in a loop.
    IfWinActive, ahk_exe Code.exe
    {
        Send, ^/
    }
    else IfWinActive, ahk_exe devenv.exe
    {
        Send, ^k
        Sleep, 50
        Send, u
    }
return  ; This line ends the hotkey definition.

;Trigger = s // save all files in VS code & VS
$F18::  ; This line defines a hotkey for the F18 key. The $ sign prevents the hotkey from triggering itself in a loop.
    IfWinActive, ahk_exe Code.exe
    {
        Send, ^k
        Sleep, 50
        Send, s
    }
    else IfWinActive, ahk_exe devenv.exe
    {
        Send, ^s
    }
return  ; This line ends the hotkey definition.

;Trigger = r // reload ahk script
$F19::  ; This line defines a hotkey for the F19 key. The $ sign prevents the hotkey from triggering itself in a loop.
    Reload
return  ; This line ends the hotkey definition.

;Trigger = t // Open a alert box
$F20::  ; This line defines a hotkey for the F20 key. The $ sign prevents the hotkey from triggering itself in a loop.
    MsgBox, Neww World!
return  ; This line ends the hotkey definition.

;Trigger = i // Open an open file in solutino explorer in Visual Studio
$F21::  ; This line defines a hotkey for the F21 key. The $ sign prevents the hotkey from triggering itself in a loop.
    Send, ^[  ; Send Ctrl + [ keystrokes.
    Sleep, 50
    Send, s  ; Send 's' keystroke.
return  ; This line ends the hotkey definition. 

;Trigger = 5 // Hard reload an open browser tab
$F22::  ; This line defines a hotkey for the F22 key. The $ sign prevents the hotkey from triggering itself in a loop.
    Send, ^r
return  ; This line ends the hotkey definition.