rmdir /s /q  C:\tmp\
mkdir C:\tmp\integration\
mkdir C:\tmp\expansion\
cd "c:\Program Files (x86)\ModOrganizer\mods\Devious Devices - Integration\"
xcopy /s /y . C:\tmp\integration\
cd "c:\Program Files (x86)\ModOrganizer\mods\DeviousExpansion\"
xcopy /s /y . C:\tmp\expansion\
cd "c:\Program Files (x86)\ModOrganizer\overwrite\"
xcopy /s /y "Devious Devices - Integration.esm" "C:\tmp\integration\"
xcopy /s /y "Devious Devices - Expansion.esm" "C:\tmp\expansion\"
xcopy /s /y "Devious Deviants.esp" "C:\tmp\integration\"
xcopy /s /y "meshes\actors\character\behaviors\FNIS_DeviousDevices_Behavior.hkx" "C:\tmp\integration\meshes\actors\character\behaviors\"
rmdir /s /q C:\tmp\integration\scripts\source\junk\
rmdir /s /q C:\tmp\expansion\scripts\source\junk\
rmdir /s /q  C:\tmp\integration\bak
rmdir /s /q  C:\tmp\expansion\bak
del C:\tmp\integration\sound\fx\DeviousDevices\wavegain.exe
del "C:\tmp\integration\meta.ini"
del "C:\tmp\expansion\meta.ini"
cd "C:\tmp\integration\"
"c:\Program Files (x86)\WinRAR\rar.exe" a -r C:\tmp\snapshot-%1-Integration.rar .
cd "C:\tmp\expansion\"
"c:\Program Files (x86)\WinRAR\rar.exe" a -r C:\tmp\snapshot-%1-Expansion.rar .
cd "c:\Program Files (x86)\ModOrganizer\mods\Devious Devices - Integration\scripts\source"