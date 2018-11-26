#Include AddGraphicButton.ahk

;v0.1
loop=0
tooth=0
med=0
clue=0
Time1=0
Time2=0
DryStreakInt=0
LastLootString="null"

Loop, read, BarrowsTimes.txt
{
  Time1 := Time2
  Time2 := A_LoopReadLine
}
LastTime := Time2 - Time1
LastTime := "Time: " . floor(LastTime/60) . "m " . mod(LastTime,60) . "s"

Loop, read, BarrowsLog.txt
  {
    LastLineNumber := A_Index
    LastLine := A_LoopReadLine
  }
Array := StrSplit(LastLine, ",")
if(Array[1] = "Dry"){
    DryStreakInt := Array[2]
    FileReadLine, LastLootLine, BarrowsLog.txt, LastLineNumber - 1
    Array := StrSplit(LastLootLine, ",")
    LastLootString := Array[1]
} else {
    LastLootString := Array[1]
}

gui:
AddGraphicButton("aHelm", A_WorkingDir . "\BarrowsLogImages\aHelm.ico", "x2 y2 h33 w33 gahelm", 25, 27)
AddGraphicButton("aTop", A_WorkingDir . "\BarrowsLogImages\aTop.ico", "x2 y37 h33 w33 gatop", 28, 21)
AddGraphicButton("aBotm", A_WorkingDir . "\BarrowsLogImages\aBot.ico", "x2 y72 h33 w33 gabot", 18, 27)
AddGraphicButton("aWepn", A_WorkingDir . "\BarrowsLogImages\awep.ico", "x2 y107 h33 w33 gawep", 26, 29)
AddGraphicButton("dHelm", A_WorkingDir . "\BarrowsLogImages\dHelm.ico", "x37 y2 h33 w33 gdhelm", 23, 27)
AddGraphicButton("dTop", A_WorkingDir . "\BarrowsLogImages\dTop.ico", "x37 y37 h33 w33 gdtop", 30, 27)
AddGraphicButton("dBot", A_WorkingDir . "\BarrowsLogImages\dBot.ico", "x37 y72 h33 w33 gdbot", 13, 30)
AddGraphicButton("dWep", A_WorkingDir . "\BarrowsLogImages\dWep.ico", "x37 y107 h33 w33 gdwep", 28, 29)
AddGraphicButton("gHelm", A_WorkingDir . "\BarrowsLogImages\gHelm.ico", "x72 y2 h33 w33 gghelm", 27, 24)
AddGraphicButton("gTop", A_WorkingDir . "\BarrowsLogImages\gTop.ico", "x72 y37 h33 w33 ggtop", 20, 29)
AddGraphicButton("gBot", A_WorkingDir . "\BarrowsLogImages\gBot.ico", "x72 y72 h33 w33 ggbot", 16, 27)
AddGraphicButton("gWep", A_WorkingDir . "\BarrowsLogImages\gWep.ico", "x72 y107 h33 w33 ggwep", 29, 30)
AddGraphicButton("kHelm", A_WorkingDir . "\BarrowsLogImages\kHelm.ico", "x107 y2 h33 w33 gkhelm", 24, 31)
AddGraphicButton("kTop", A_WorkingDir . "\BarrowsLogImages\kTop.ico", "x107 y37 h33 w33 gktop", 29, 23)
AddGraphicButton("kBot", A_WorkingDir . "\BarrowsLogImages\kBot.ico", "x107 y72 h33 w33 gkbot", 27, 28)
AddGraphicButton("kWep", A_WorkingDir . "\BarrowsLogImages\kWep.ico", "x107 y107 h33 w33 gkwep", 29, 24)
AddGraphicButton("tHelm", A_WorkingDir . "\BarrowsLogImages\tHelm.ico", "x142 y2 h33 w33 gthelm", 30, 23)
AddGraphicButton("tTop", A_WorkingDir . "\BarrowsLogImages\tTop.ico", "x142 y37 h33 w33 gttop", 31, 27)
AddGraphicButton("tBot", A_WorkingDir . "\BarrowsLogImages\tBot.ico", "x142 y72 h33 w33 gtbot", 13, 29)
AddGraphicButton("tWep", A_WorkingDir . "\BarrowsLogImages\tWep.ico", "x142 y107 h33 w33 gtwep", 27, 21)
AddGraphicButton("vHelm", A_WorkingDir . "\BarrowsLogImages\vHelm.ico", "x177 y2 h33 w33 gvhelm", 24, 29)
AddGraphicButton("vTop", A_WorkingDir . "\BarrowsLogImages\vTop.ico", "x177 y37 h33 w33 gvtop", 24, 30)
AddGraphicButton("vBot", A_WorkingDir . "\BarrowsLogImages\vBot.ico", "x177 y72 h33 w33 gvbot", 27, 27)
AddGraphicButton("vWep", A_WorkingDir . "\BarrowsLogImages\vWep.ico", "x177 y107 h33 w33 gvwep", 24, 28)
AddGraphicButton("loop", A_WorkingDir . "\BarrowsLogImages\loop.ico", "x212 y2 h33 w33 gloop", 20, 19)
AddGraphicButton("tooth", A_WorkingDir . "\BarrowsLogImages\tooth.ico", "x212 y37 h33 w33 gtooth", 17, 15)
AddGraphicButton("clue", A_WorkingDir . "\BarrowsLogImages\clue.ico", "x212 y72 h33 w33 gclue", 31, 27)
AddGraphicButton("med", A_WorkingDir . "\BarrowsLogImages\med.ico", "x212 y107 h33 w33 gmed", 28, 30)
AddGraphicButton("notepad", A_WorkingDir . "\BarrowsLogImages\notepad.ico", "x247 y2 h44 w100 gnotepad", 48, 48)
gui, font, cWhite
gui, add, text, x247 y48 h15 w100 vDryStreak, Dry: %DryStreakInt%
gui, add, text, x247 y64 h15 w110 vLastLoot, Last: %LastLootString%
gui, add, text, x247 y79 h15 w102 vLastTime, %LastTime%

AddGraphicButton("dry", A_WorkingDir . "\BarrowsLogImages\dry.ico", "x247 y96 h44 w100 gdry", 94, 39)
Gui, Color, 000000
Gui +LastFound 
WinSet, TransColor, 000000, 100
Gui +Border ;+AlwaysOnTop
Gui, Show, x976 y74 h142 w349, Barrows data entry
Return

GuiClose:
ExitApp

item(string)
{
  Loop, read, BarrowsLog.txt
  {
    LastLineNumber := A_Index
    LastLine := A_LoopReadLine
  }
  Array := StrSplit(LastLine, ",")
  if(Array[1] = "Dry"){
    Fileappend, `n, BarrowsLog.txt
  }
  Fileappend, %string%`,, BarrowsLog.txt
  gosub, markothers
  Fileappend,`n, BarrowsLog.txt
  LastLootString := string 
  GuiControl,, LastLoot, Last: %LastLootString%
  DryStreakInt=0
  GuiControl,, DryStreak, Dry: %DryStreakInt%
}

ahelm:
  item("Ahrim Hood")
return

atop:
  item("Ahrim RobeTop")
return

abot:
  item("Ahrim RobeSkirt")
return

awep:
  item("Ahrim Staff")
return

dhelm:
  item("Dharok Helm")
return

dtop:
  item("Dharok Platebody")
return

dbot:
  item("Dharok Platelegs")
return

dwep:
  item("Dharok Greataxe")
return

ghelm:
  item("Guthan Helm")
return

gtop:
  item("Guthan Platebody")
return

gbot:
  item("Guthan Chainskirt")
return

gwep:
  item("Guthan Warspear")
return

khelm:
  item("Karil Coif")
return

ktop:
  item("Karil Leathertop")
return

kbot:
  item("Karil Leatherskirt")
return

kwep:
  item("Karil Crossbow")
return

thelm:
  item("Torag Helm")
return

ttop:
  item("Torag Platebody")
return

tbot:
  item("Torag Platelegs")
return

twep:
  item("Torag Hammers")
return

vhelm:
  item("Verac Helm")
return

vtop:
  item("Verac Brassard")
return

vbot:
  item("Verac Plateskirt")
return

vwep:
  item("Verac Flail")
return

loop:
  loop=1
return

tooth:
  tooth=1
return

clue:
  clue=1
return

med:
  med=1
return

notepad:
  Run, Notepad.exe "BarrowsLog.txt"
return

dry:
  Loop, read, BarrowsLog.txt
  {
    LastLineNumber := A_Index
    LastLine := A_LoopReadLine
  }
  Array := StrSplit(LastLine, ",")
  if(Array[1] = "Dry"){
    Loop, % LastLineNumber - 1
    {
      FileReadLine, OutputVar, BarrowsLog.txt, %A_Index%
      Fileappend, %OutputVar%`n, BarrowsLog.txt_temp.txt
    }
    DryStreakInt += 1
    time := unixTimestamp()
    string := "Dry," . 1 + Array[2] . "," . loop + Array[3] . "," . tooth + Array[4] . "," . clue + Array[5] . "," . med + Array[6]
    Fileappend, %string%, BarrowsLog.txt_temp.txt
    FileCopy, BarrowsLog.txt_temp.txt, BarrowsLog.txt, 1
    FileDelete, BarrowsLog.txt_temp.txt
    Fileappend,%time%`n, BarrowsTimes.txt
    loop=0
    tooth=0
    clue=0
    med=0
    refreshTimeText()
  } else {
    Fileappend, dry`,1, BarrowsLog.txt
    DryStreakInt = 1
    gosub, markothers
  }
  GuiControl,, DryStreak, Dry: %DryStreakInt%
return

markothers:
  time := unixTimestamp()
  Fileappend,`,%loop%, BarrowsLog.txt
  Fileappend,`,%tooth%, BarrowsLog.txt
  Fileappend,`,%clue%, BarrowsLog.txt
  Fileappend,`,%med%, BarrowsLog.txt
  Fileappend,%time%`n, BarrowsTimes.txt
  loop=0
  tooth=0
  clue=0
  med=0
  refreshTimeText()
return

unix2Human(unixTimestamp)
{
  returnDate = 19700101000000
  returnDate += unixTimestamp, s
  return returnDate
}


human2Unix(humanTime)
{
  humanTime -= 1970, s
  return humanTime
}

unixTimestamp()
{
  return human2Unix(A_NowUTC)
}

refreshTimeText()
{
  Loop, read, BarrowsTimes.txt
  {
    Time1 := Time2
    Time2 := A_LoopReadLine
  }
  LastTime := Time2 - Time1
  LastTime := "Time: " . floor(LastTime/60) . "m " . mod(LastTime,60) . "s"
  GuiControl,, LastTime, %LastTime%
}
