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
		SoundPlay(A_WinDir "\Media\notify.wav")
		global recording := true
	}
	else {
		MsgBox("You gotta have csgo open xD", "Error")
	}

}
+End:: {
	if (!recording) {
		SoundPlay(A_WinDir "\Media\Windows Ding.wav")
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
		SoundPlay(A_WinDir "\Media\tada.wav")
		global recording := 0
		global demo_name := A_Now
	}
	else {
		MsgBox("You gotta have csgo open xD", "Error")
	}

}
+Del:: {
	if (!recording) {
		SoundPlay(A_WinDir "\Media\Windows Ding.wav")
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
		global recording := 0
		if (!FileExist(path)) {
			SoundPlay(A_WinDir "\Media\Windows Ding.wav")
			return
		}
		FileDelete(path)
		SoundPlay(A_WinDir "\Media\Windows Exclamation.wav")
		global demo_name := A_Now
	}
	else {
		MsgBox("You gotta have csgo open xD", "Error")
	}
}