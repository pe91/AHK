#Requires AutoHotkey v2.0
global demo_name := A_Now
Numpad0:: {
    csgo_pid := ProcessExist("csgo.exe")
    if (csgo_pid) {
        if (!WinActive("ahk_pid" csgo_pid)) {
            WinActivate "ahk_pid" csgo_pid
            Sleep 1000
        }
        Send "{``}"
        Sleep 100
        Send "record "
        Send demo_name
        Send "{Enter}"
        Sleep 100
        Send "{``}"
    }
    else{
        MsgBox("You gotta have csgo open xD","Error")
    }
}

Numpad5:: {
    Send "{``}"
    Sleep 100
    Send "stop"
    Send "{Enter}"
    Sleep 100
    Send "{``}"
    global demo_name := A_Now
}
NumpadDot:: {
    Send "{``}"
    Sleep 100
    Send "stop"
    Send "{Enter}"
    Sleep 100
    Send "{``}"
    path := "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\" demo_name ".dem"
    if (!FileExist(path)) {
        return
    }
    FileDelete(path)
    global demo_name := A_Now
}
