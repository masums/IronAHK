pic = %A_Temp%\gui_test_picture.png
icon = %A_Temp%\gui_test_icon.ico

If (!FileExist(pic))
	UrlDownloadToFile, http://i50.tinypic.com/289v245.png, %pic%

if (!FileExist(icon))
	UrlDownloadToFile, http://www.autohotkey.net/favicon.ico, %icon%

Gui, Add, Text, vC1 Border gButtonClick, Test
Gui, Add, Edit, vC2 ym
Gui, Add, UpDown, vC3 Range5-10, 7
Gui, Add, Pic, vC4 xm Section, %pic%
Gui, Add, Button, vC5 ys+10 h20, Click
Gui, Add, CheckBox, vC6 xp+5 yp+30 CheckedGrey, Check
Gui, Add, Radio, vC7, Option 1
Gui, Add, Radio, vC8, Option 2
Gui, Add, DDL, vC9 Section x2, A|B|C||D
Gui, Add, ComboBox, vC10 ys, E||
Gui, Add, ListBox, vC11 ys, F|G||H
Gui, Add, ListView, vC12 Section xm, One|Two|Three
Gui, Add, TreeView, vC13 ys w125
Gui, Add, Hotkey, vC14 Limit4
Gui, Add, DateTime, vC15 xm, 2010
Gui, Add, MonthCal, vC16 Section, 2009
Gui, Add, Slider, vC17 ys Range1-10, 5
Gui, Add, Progress, vC18 -Smooth, 50
Gui, Add, StatusBar, , Started

SB_SetParts(150, 250, 350)
Loop, 3
	SB_SetText("Part " . A_Index, A_Index, A_Index - 1)
SB_SetIcon(icon, "", 2)

Gui, Show, xCenter y100, Example
Return

ButtonClick:
s =
Loop, 18
{
	GuiControlGet, r, , C%A_Index%
	s = %s%C%A_Index%: "%r%"
	GuiControlGet, r, Pos, C%A_Index%
	s = %s% (%rx%, %ry%, %rw%, %rh%)`n
}
Gui, +OwnDialogs
MsgBox, %s%
Return

GuiEscape:
GuiClose:
ExitApp
