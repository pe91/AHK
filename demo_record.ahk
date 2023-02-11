#Requires AutoHotkey v2.0
global demo_name := A_Now
global process_name := "notepad.exe"
Home:: {
	csgo_pid := ProcessExist(process_name)
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

End:: {
	csgo_pid := ProcessExist(process_name)
	if (csgo_pid) {
        if (!WinActive("ahk_pid" csgo_pid)) {
            WinActivate "ahk_pid" csgo_pid
            Sleep 1000
		}
		Send "{``}"
		Sleep 100
		Send "stop"
		Send "{Enter}"
		Sleep 100
		Send "{``}"
		global demo_name := A_Now
	}
	else{
		MsgBox("You gotta have csgo open xD","Error")
	}
	
}
Del:: {
	csgo_pid := ProcessExist(process_name)
	if (csgo_pid) {
        if (!WinActive("ahk_pid" csgo_pid)) {
            WinActivate "ahk_pid" csgo_pid
            Sleep 1000
        }
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
	else{
		MsgBox("You gotta have csgo open xD","Error")
	}
}
