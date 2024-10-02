; This script assumes that Alt and Ctrl characters have been swapped using a third-party tool

; -----KEY GUIDE-----
; # Win. (the key with the Windows logo) therefore `Send #e` would hold down Win and then press E.
; + Shift. For example, `Send, +abC` would send the text "AbC", and `Send, !+a` would press Alt+Shift+A.
; ^ Alt (because of remapkey). For example, `Send, This is text!a` would send the keys "This is text" and then press Alt+A. Note: !A produces a different effect in some programs than !a. This is because !A presses Alt+Shift+A and !a presses Alt+A. If in doubt, use lowercase.
; ! Ctrl (because of remapkey). For example, `Send, ^!a` would press Ctrl+Alt+A, and Send, ^{Home} would send Ctrl+Home. Note: ^A produces a different effect in some programs than ^a. This is because ^A presses Ctrl+Shift+A and ^a presses Ctrl+A. If in doubt, use lowercase.Sends Ctrl. For example, Send, ^!a would press Ctrl+Alt+A, and Send, ^{Home} would send Ctrl+Home. Note: ^A produces a different effect in some programs than ^a. This is because ^A presses Ctrl+Shift+A and ^a presses Ctrl+A. If in doubt, use lowercase.
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

; #Warn  ; Uncomment to enable warnings to assist with detecting common errors.
SendMode("Input") ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir) ; Ensures a consistent starting directory.

; Uncomment for key history
; #InstallKeybdHook
; KeyHistory

; App and tab switching
!Tab:: Send("^{Tab}")
!+Tab:: Send("^+{Tab}")

global AltTabMenu := false

LCtrl & Tab:: {
    global AltTabMenu := true
    if GetKeyState("Shift", "P")
        Send("{Alt Down}{Shift Down}{Tab}")
    else
        Send("{Alt Down}{Tab}")
}

#HotIf AltTabMenu
~*LCtrl Up:: {
    Send("{Shift Up}{Alt Up}")
    global AltTabMenu := false
}
#HotIf

^q:: Send("!{f4}")

; Insertion point movement
^Left::
{
    Suspend(true)
    Send("{Home}")
    Suspend(false)
    return
}
^Right::
{
    Suspend(true)
    Send("{End}")
    Suspend(false)
    return
}
+^Left::
{
    Suspend(true)
    Send("+{Home}")
    Suspend(false)
    return
}
+^Right::
{
    Suspend(true)
    Send("+{End}")
    Suspend(false)
    return
}
+^Up::
{
    Suspend(true)
    Send("+^{Home}")
    Suspend(false)
    return
}
+^Down::
{
    Suspend(true)
    Send("+^{End}")
    Suspend(false)
    return
}
#Left::
{
    Suspend(true)
    Send("^{Left}")
    Suspend(false)
    return
}
#Right::
{
    Suspend(true)
    Send("^{Right}")
    Suspend(false)
    return
}
+#Left::
{
    Suspend(true)
    Send("+^{Left}")
    Suspend(false)
    return
}
+#Right::
{
    Suspend(true)
    Send("+^{Right}")
    Suspend(false)
    return
}
^BackSpace::
{
    Suspend(true)
    Send("+{Delete}")
    Suspend(false)
    return
}
^+Enter::
{
    Suspend(true)
    Send("#{Up}")
    Suspend(false)
    return
}
#BackSpace::
{
    Suspend(true)
    Send("^{BackSpace}")
    Suspend(false)
    return
}
; ctrl + H should minimize window(autohotkey v2)
^h:: {
    WinMinimize("A")
}

; Window management Ctrl Alt Arrow should move according to windows shift arrow
