#Requires AutoHotkey v2.0
global funfou := false
global cor
+Home:: {
    while (true) {
        Send "{f5}"
        Sleep 2500
        MouseMove(954, 334)
        Sleep 2000
        MouseClick
        Sleep 2500
        MouseMove(1863, 853)
        Sleep 2500
        MouseClick
        Sleep 4000
        if (PixelGetColor(811, 768) == 0xD3D3D3) {
            Sleep 100
            MouseMove(809, 798)
            Sleep 3000
            MouseClick
            Sleep 3000
            MouseMove(811, 768)
            Sleep 3000
            MouseClick
            global funfou := true
        }
        Sleep 3000
        MouseMove(1858, 270)
        Sleep 900
        MouseClick
        Sleep 2000
        if (funfou) {
            break
        }
    }
}
+End::{
    ExitApp
}