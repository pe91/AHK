#Requires AutoHotkey v2.0
global demo_name := A_Now
global process_name := "csgo.exe"
global recording := false
+Home:: {
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
		global recording := true
	}
	else {
		MsgBox("You gotta have csgo open xD", "Error")
	}

}
+End:: {
	if (!recording) {
		return
	}
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
		global recording := 0
		global demo_name := A_Now
	}
	else {
		MsgBox("You gotta have csgo open xD", "Error")
	}

}
+Del:: {
	if (!recording) {
		return
	}
	csgo_pid := ProcessExist(process_name)
	if (csgo_pid) {
		if (!WinActive("ahk_pid" csgo_pid)) {
			WinActivate "ahk_pid" csgo_pid
			Sleep 1000
		}
		Send "{``}"
		Sleep 200
		Send "stop"
		Send "{Enter}"
		Sleep 200
		Send "{``}"
		path := ProcessGetPath(csgo_pid)
		Sleep 1000
		SplitPath(path, , &dir, , ,)
		path := dir "\csgo\" demo_name ".dem"
		global recording := false
		if (!FileExist(path)) {
			return
		}
		FileDelete(path)
		global demo_name := A_Now
	}
	else {
		MsgBox("You gotta have csgo open xD", "Error")
	}
}
