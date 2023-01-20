; run on windows key + shift + a
#+a::{
    ; Save a copy of the current project in the PROJECTS subfolder
    ProjectFolder := "D:\SONGS\PROJECTS\"
    SaveProject(ProjectFolder)
}

#+x::{
    ; Save a copy of the current project in the IDEAS subfolder
    ProjectFolder := "D:\SONGS\IDEAS\"
    SaveProject(ProjectFolder)
}

SaveProject(ProjectFolder){
    IB := InputBox("Please enter the subfolder name within " ProjectFolder, "Enter Folder", "w640 h200")

    CoordMode "Mouse", "Client"

    if IB.Result = "Cancel"
        MsgBox "Cancelled"
    else
    {
        Folder := IB.Value
        OutputFolder := ProjectFolder Folder

        if not DirExist(OutputFolder)
            DirCreate OutputFolder
        else {
            if not DllCall("Shlwapi\PathIsDirectoryEmpty", "Str", OutputFolder){
                MsgBox "Cannot use non-empty folder" ; The cubase back up project process requires an empty folder
                Exit
            }
        }

        ; May need tweaking if there will be multiple "Cubase" windows
        WinActivate "Cubase"

        ; Ctrl-Shift-b is saved as a custom key command in cubase for Back up project
        ; add the shortcut in Edit -> Key Commands (or set your own and tweak the lines below)
        Send "{Ctrl down}{Shift down}{b down}"
        Sleep 500 ; for window to activate - may need tweaking
        Send "{b up}{Shift up}{Ctrl up}"

        ; enter the output folder in file explorer and select
        Send OutputFolder
        Send "{Enter}"
        Send "{Enter}"
        Sleep 500 ; for window to activate - may need tweaking

        ; choose backup - default options. Will need to modify if other options needed
        Click 260, 38 ; Client relative click on text box. Cannot access with tabs. Can't figure out how to access by ClassNN (Edit1)
        Send Folder
        Sleep 100
        Send "{Tab}"
        Send "{Enter}"

    }
}
