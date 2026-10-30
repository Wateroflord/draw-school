; Установщик Уроки рисования для Windows (Inno Setup 6), ставится в профиль пользователя.
#define BuildNo GetEnv("BUILD_NO")
#if BuildNo == ""
  #define BuildNo "0"
#endif

[Setup]
AppId={{29BF7331-9242-4449-AD80-C28BBE0B2AFE}
AppName=Уроки рисования
AppVersion=1.0.{#BuildNo}
AppPublisher=Winter Hub
DefaultDirName={localappdata}\Programs\Draw School
DefaultGroupName=Уроки рисования
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=..\dist
OutputBaseFilename=Draw-School-Setup
Compression=lzma2
SolidCompression=yes
SetupIconFile=..\windows\runner\resources\app_icon.ico
UninstallDisplayIcon={app}\draw_school.exe
CloseApplications=force
RestartApplications=no
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Уроки рисования"; Filename: "{app}\draw_school.exe"
Name: "{group}\{cm:UninstallProgram,Уроки рисования}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\Уроки рисования"; Filename: "{app}\draw_school.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\draw_school.exe"; Description: "{cm:LaunchProgram,Уроки рисования}"; Flags: nowait postinstall skipifsilent
Filename: "{app}\draw_school.exe"; Flags: nowait; Check: WizardSilent
