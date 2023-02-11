#Requires AutoHotkey v2.0
global demo_name := A_Now
Numpad0:: {
    csgo_pid := ProcessExist("csgo.exe")
    if (csgo_pid) {
        WinActivate "ahk_pid" csgo_pid
        Sleep 1000
        Send "{``}"
        Sleep 100
        Send "record "
        Send demo_name
        Send "{Enter}"
        Sleep 1000
        Send "stop"
        Send "{Enter}"
        Sleep 100
        Send "{``}"
    }
}

Numpad5:: {
    global demo_name := A_Now
}
NumpadDot:: {
    path := "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\" demo_name ".dem"
    if (!FileExist(path)) {
        return
    }
    FileDelete(path)
    global demo_name := A_Now
}