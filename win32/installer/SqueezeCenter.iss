;
; InnoSetup Script for SqueezeCenter
;
; Slim Devices/Logitech : http://www.slimdevices.com
;
; Script by Chris Eastwood, January 2003 - http://www.vbcodelibrary.co.uk

[Setup]
; Uncomment the following line to disable the "Select Setup Language"
; dialog and have it rely solely on auto-detection.
;ShowLanguageDialog=no
; If you want all languages to be listed in the "Select Setup Language"
; dialog, even those that can't be displayed in the active code page,
; uncomment the following line.
;ShowUndisplayableLanguages=yes

[Languages]
Name: en; MessagesFile: "English.isl"
Name: nl; MessagesFile: "Dutch.isl"
Name: de; MessagesFile: "German.isl"
Name: es; MessagesFile: "Spanish.isl"
Name: fr; MessagesFile: "French.isl"
Name: it; MessagesFile: "Italian.isl"
Name: he; MessagesFile: "Hebrew.isl"
; the following languages though not officially supported, are available in SqueezeCenter
Name: cs; MessagesFile: "Czech.isl"
Name: da; MessagesFile: "Danish.isl"
Name: fi; MessagesFile: "Finnish.isl"
Name: ja; MessagesFile: "Japanese.isl"
Name: no; MessagesFile: "Norwegian.isl"
Name: pt; MessagesFile: "Portuguese.isl"
Name: sv; MessagesFile: "Swedish.isl"
Name: zh_cn; MessagesFile: "ChineseSimp.isl"


[CustomMessages]
#include "strings.iss"

[Setup]
AppName=SqueezeCenter
AppVerName=SqueezeCenter 7.0a1
AppPublisher=Logitech
AppPublisherURL=http://www.slimdevices.com
AppSupportURL=http://www.slimdevices.com
AppUpdatesURL=http://www.slimdevices.com
DefaultDirName={code:GetInstallFolder}
DefaultGroupName=SqueezeCenter
WizardImageFile=squeezebox.bmp
WizardImageBackColor=$ffffff
OutputBaseFilename=SqueezeSetup
MinVersion=0,4
;AlwaysRestart=yes

;
; Here's where you set the licence/info files to be displayed in the installer....
;
;InfoBeforeFile=preinstall.rtf
;
; And when installation is complete....
;
;InfoAfterFile=postinstall.rtf
;

[Tasks]
Name: desktopicon; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: quicklaunchicon; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: SqueezeTray.exe; DestDir: {app}; Flags: replacesameversion
Source: Release Notes.html; DestDir: {app}

Source: Getting Started.html; DestName: "{cm:GettingStarted}.html"; DestDir: {app}; Languages: en cs da fi ja no pt sv zh_cn; Flags: isreadme
Source: Getting Started.de.html; DestName: "{cm:GettingStarted}.html"; DestDir: {app}; Languages: de; Flags: isreadme
Source: Getting Started.nl.html; DestName: "{cm:GettingStarted}.html"; DestDir: {app}; Languages: nl; Flags: isreadme
Source: Getting Started.fr.html; DestName: "{cm:GettingStarted}.html"; DestDir: {app}; Languages: fr; Flags: isreadme
Source: Getting Started.it.html; DestName: "{cm:GettingStarted}.html"; DestDir: {app}; Languages: it; Flags: isreadme
Source: Getting Started.es.html; DestName: "{cm:GettingStarted}.html"; DestDir: {app}; Languages: es; Flags: isreadme
Source: Getting Started.he.html; DestName: "{cm:GettingStarted}.html"; DestDir: {app}; Languages: he; Flags: isreadme

; add the english version for all languages as long as we don't have any translation
Source: License.txt; DestName: "{cm:License}.txt"; DestDir: {app}; Languages: en de nl fr it es he cs da fi ja no pt sv zh_cn
;Source: License.de.txt; DestName: "{cm:License}.txt"; DestDir: {app}; Languages: de
;Source: License.nl.txt; DestName: "{cm:License}.txt"; DestDir: {app}; Languages: nl
;Source: License.fr.txt; DestName: "{cm:License}.txt"; DestDir: {app}; Languages: fr
;Source: License.it.txt; DestName: "{cm:License}.txt"; DestDir: {app}; Languages: it
;Source: License.es.txt; DestName: "{cm:License}.txt"; DestDir: {app}; Languages: es
;Source: License.he.txt; DestName: "{cm:License}.txt"; DestDir: {app}; Languages: he

; NOTE: Don't use "Flags: ignoreversion" on any shared system files
;
; Next line takes everything from the source '\server' directory and copies it into the setup
; it's output into the same location from the users choice.
;

Source: server\*.*; DestDir: {app}\server; Excludes: "*freebsd*,*openbsd*,*darwin*,*linux*,*solaris*,*cygwin*"; Flags: comparetimestamp recursesubdirs

[Dirs]
Name: {%ALLUSERSPROFILE}\SqueezeCenter; Permissions: users-modify; MinVersion: 0,6.0
Name: {app}\server\Plugins; Permissions: users-modify

[INI]
Filename: {app}\{cm:SlimDevicesWebSite}.url; Section: InternetShortcut; Key: URL; String: http://www.slimdevices.com; Flags: uninsdeletesection
Filename: {app}\{cm:SqueezeCenterWebInterface}.url; Section: InternetShortcut; Key: URL; String: http://localhost:9000; Flags: uninsdeletesection

[Icons]
Name: {group}\SqueezeCenter; Filename: {app}\SqueezeTray.exe; Parameters: "--start"; WorkingDir: "{app}";
Name: {group}\{cm:SlimDevicesWebSite}; Filename: {app}\{cm:SlimDevicesWebSite}.url
Name: {group}\{cm:License}; Filename: {app}\{cm:License}.txt
Name: {group}\{cm:GettingStarted}; Filename: {app}\{cm:GettingStarted}.html
Name: {group}\{cm:UninstallSqueezeCenter}; Filename: {uninstallexe}
Name: {userdesktop}\SqueezeCenter; Filename: {app}\SqueezeTray.exe; Parameters: "--start"; WorkingDir: "{app}"; Tasks: desktopicon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\SqueezeCenter; Filename: {app}\SqueezeTray.exe; Parameters: "--start"; WorkingDir: "{app}"; Tasks: quicklaunchicon
Name: {commonstartup}\{cm:SqueezeCenterTrayTool}; Filename: {app}\SqueezeTray.exe; WorkingDir: "{app}"

[Registry]
;
; The following keys open required SqueezeCenter ports in the XP Firewall
;
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List; ValueType: string; ValueName: "9000:TCP"; ValueData: "9000:TCP:*:Enabled:SqueezeCenter 9000 tcp"; MinVersion: 0,5.01;
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List; ValueType: string; ValueName: "3483:UDP"; ValueData: "3483:UDP:*:Enabled:SqueezeCenter 3483 udp"; MinVersion: 0,5.01;
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List; ValueType: string; ValueName: "3483:TCP"; ValueData: "3483:TCP:*:Enabled:SqueezeCenter 3483 tcp"; MinVersion: 0,5.01;
Root: HKLM; Subkey: SOFTWARE\Logitech\SqueezeCenter; ValueType: string; ValueName: Path; ValueData: {app}; MinVersion: 0,5.01

[UninstallDelete]
Type: dirifempty; Name: {app}
Type: dirifempty; Name: {app}\server
Type: dirifempty; Name: {app}\server\IR
Type: dirifempty; Name: {app}\server\Plugins
Type: dirifempty; Name: {app}\server\HTML
Type: dirifempty; Name: {app}\server\SQL
Type: filesandordirs; Name: {app}\server\Cache
Type: filesandordirs; Name: {%ALLUSERSPROFILE}\SqueezeCenter; MinVersion: 0,6.0
Type: files; Name: {app}\server\slimserver.pref
Type: files; Name: {app}\{cm:SlimDevicesWebSite}.url
Type: files; Name: {app}\{cm:SqueezeCenterWebInterface}.url
Type: files; Name: {commonstartup}\{cm:SqueezeCenterTrayTool}.url

[UninstallRun]
Filename: "net"; Parameters: "stop squeezesvc"; Flags: runhidden; MinVersion: 0,4.00.1381
Filename: "sc"; Parameters: "stop SqueezeMySQL"; Flags: runhidden; MinVersion: 0,4.00.1381
Filename: "sc"; Parameters: "delete SqueezeMySQL"; Flags: runhidden; MinVersion: 0,4.00.1381
Filename: {app}\server\squeezecenter.exe; Parameters: -remove; WorkingDir: {app}\server; Flags: skipifdoesntexist runhidden; MinVersion: 0,4.00.1381
Filename: {app}\SqueezeTray.exe; Parameters: --exit --uninstall; WorkingDir: {app}; Flags: skipifdoesntexist runhidden; MinVersion: 0,4.00.1381

[Code]
var
	MyMusicFolder: String;
	MyPlaylistFolder: String;

function GetInstallFolder(Param: String) : String;
var
	InstallFolder: String;
begin
	if (not RegQueryStringValue(HKLM, 'Software\Logitech\SqueezeCenter', 'Path', InstallFolder)) then
		InstallFolder := AddBackslash(ExpandConstant('{pf}')) + 'SqueezeCenter';

	Result := InstallFolder;
end;

function GetMusicFolder() : String;
begin
	if (MyMusicFolder='') then begin
		if (not RegQueryStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders','My Music', MyMusicFolder)) then
			if (not RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders','My Music', MyMusicFolder)) then
				if (not RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders','CommonMusic', MyMusicFolder)) then
					if (RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders','Personal', MyMusicFolder)) then
						MyMusicFolder := MyMusicFolder + 'My Music'
					else
						MyMusicFolder := WizardDirValue;
	end;
					
	Result := MyMusicFolder;
end;

function GetPlaylistFolder() : String;
begin
	if (MyPlaylistFolder = '') then begin
		if (GetMusicFolder() <> '') then
			MyPlaylistFolder := GetMusicFolder()
		else
			MyPlaylistFolder := WizardDirValue;
	end;

	Result := MyPlaylistFolder;
end;

// NB don't call this until after {app} is set
function GetPrefsFolder() : String;
begin
	if (GetWindowsVersion shr 24 >= 6) then
		Result := AddBackslash(ExpandConstant('{%ALLUSERSPROFILE}')) + 'SqueezeCenter'
	else
		Result := AddBackslash(ExpandConstant('{app}')) + 'server'
end;	

function GetPrefsFile() : String;
begin
	Result := AddBackslash(GetPrefsFolder()) + 'slimserver.pref';
end;	


procedure UninstallSliMP3();
var
	ErrorCode: Integer;
	Uninstaller: String;
begin
	// Queries the specified REG_SZ or REG_EXPAND_SZ registry key/value, and returns the value in ResultStr.
	// Returns True if successful. When False is returned, ResultStr is unmodified.
	if  RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\SLIMP3 Server_is1','UninstallString', Uninstaller) then
		begin
			if not Exec(RemoveQuotes(Uninstaller), '/SILENT','', SW_SHOWNORMAL, ewWaitUntilTerminated, ErrorCode) then
				MsgBox(CustomMessage('ProblemUninstallingSLIMP3') + SysErrorMessage(ErrorCode), mbError, MB_OK);
		end;
end;


procedure UninstallSlimServer();
var
	ErrorCode: Integer;
	PrefsFile: String;
	PrefsPath: String;
	OldPrefsPath: String;
	Uninstaller: String;
 
begin
	// if we don't have a SlimCenter prefs file yet, migrate preference file before uninstalling SlimServer
	PrefsFile := GetPrefsFile();
	if not FileExists(PrefsFile) then
		begin
			PrefsPath := GetPrefsFolder();
			if (not DirExists(PrefsPath)) then
				ForceDirectories(PrefsPath);

			if (not (RegQueryStringValue(HKLM, 'Software\SlimDevices\SlimServer', 'Path', OldPrefsPath) and DirExists(OldPrefsPath))) then
				OldPrefsPath := AddBackslash(ExpandConstant('{%ALLUSERSPROFILE}')) + 'SlimServer';

			// try to migrate existing SlimServer prefs file	
			if (FileExists(AddBackslash(OldPrefsPath) + 'slimserver.pref')) then
				FileCopy(AddBackslash(OldPrefspath) + 'slimserver.pref', PrefsFile, true)
			else
				if (DirExists(AddBackslash(OldPrefsPath) + 'prefs')) then
					FileCopy(AddBackslash(OldPrefspath) + 'prefs', PrefsPath, true);
		end;

	Exec('sc', 'stop slimsvc', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
	Exec('sc', 'delete slimsvc', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
	Exec('sc', 'stop SlimServerMySQL', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
	Exec('sc', 'delete SlimServerMySQL', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);

	// call the SlimServer uninstaller
	if  RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\SlimServer_is1', 'QuietUninstallString', Uninstaller) then
		begin
			if not Exec(Uninstaller, '','', SW_SHOWNORMAL, ewWaitUntilTerminated, ErrorCode) then
				MsgBox(CustomMessage('ProblemUninstallingSlimServer') + SysErrorMessage(ErrorCode), mbError, MB_OK);
		end;

	DeleteFile(AddBackslash(ExpandConstant('{group}')) + 'Slim Devices website.lnk');
	DeleteFile(AddBackslash(ExpandConstant('{group}')) + 'Slim Web Interface.lnk');
	DelTree(AddBackslash(ExpandConstant('{group}')) + 'SlimServer', true, true, true);
	RegDeleteKeyIncludingSubkeys(HKLM, 'SOFTWARE\SlimDevices');
end;

procedure RemoveLegacyFiles();
var
	ServerDir: String;
	DelDir: String;
begin
	ServerDir := AddBackslash(ExpandConstant('{app}')) + AddBackslash('server');

	DelTree(ServerDir + AddBackslash('CPAN') + AddBackslash('arch'), true, true, true);

	DelDir := ServerDir + AddBackslash('HTML');
	DelTree(DelDir + AddBackslash('Bagpuss'), true, true, true);
	DelTree(DelDir + AddBackslash('Classic'), true, true, true);
	DelTree(DelDir + AddBackslash('Dark'), true, true, true);
	DelTree(DelDir + AddBackslash('Default'), true, true, true);
	DelTree(DelDir + AddBackslash('EN'), true, true, true);
	DelTree(DelDir + AddBackslash('ExBrowse'), true, true, true);
	DelTree(DelDir + AddBackslash('ExBrowse3'), true, true, true);
	DelTree(DelDir + AddBackslash('Experimental'), true, true, true);
	DelTree(DelDir + AddBackslash('Fishbone'), true, true, true);
	DelTree(DelDir + AddBackslash('Gordon'), true, true, true);
	DelTree(DelDir + AddBackslash('Handheld'), true, true, true);
	DelTree(DelDir + AddBackslash('Moser'), true, true, true);
	DelTree(DelDir + AddBackslash('Olson'), true, true, true);
	DelTree(DelDir + AddBackslash('Purple'), true, true, true);
	DelTree(DelDir + AddBackslash('Nokia770'), true, true, true);
	DelTree(DelDir + AddBackslash('NBMU'), true, true, true);
	DelTree(DelDir + AddBackslash('Ruttenberg'), true, true, true);
	DelTree(DelDir + AddBackslash('SenseMaker'), true, true, true);
	DelTree(DelDir + AddBackslash('Touch'), true, true, true);
	DelTree(DelDir + AddBackslash('WebPad'), true, true, true);
	DelTree(DelDir + AddBackslash('xml'), true, true, true);
	DelTree(DelDir + AddBackslash('xmlTelCanto'), true, true, true);

	DelDir := ServerDir + AddBackslash('Plugins');

	// Remove old Favorites plugin - now standard
	DelTree(DelDir + AddBackslash('Favorites'), true, true, true);

	// Remove defunct radio plugins (now replaced by new
	// in their own directories)
	DeleteFile(DelDir + 'RadioIO.pm');
	DeleteFile(DelDir + 'Picks.pm');
	DeleteFile(DelDir + 'ShoutcastBrowser.pm');
	DeleteFile(DelDir + 'Live365.pm');
	DeleteFile(DelDir + 'iTunes.pm');

	// Remove 6.5.x style plugins when updating
	DeleteFile(DelDir + 'CLI.pm');
	DeleteFile(DelDir + 'Rescan.pm');
	DeleteFile(DelDir + 'RPC.pm');
	DeleteFile(DelDir + 'RssNews.pm');
	DeleteFile(DelDir + 'SavePlaylist.pm');
	DeleteFile(DelDir + 'SlimTris.pm');
	DeleteFile(DelDir + 'Snow.pm');
	DeleteFile(DelDir + 'Visualizer.pm');
	DeleteFile(DelDir + 'xPL.pm');
	DelTree(DelDir + AddBackslash('DateTime'), true, true, true);
	DelTree(DelDir + AddBackslash('DigitalInput'), true, true, true);
	DelTree(DelDir + AddBackslash('Health'), true, true, true);
	DelTree(DelDir + AddBackslash('iTunes'), true, true, true);
	DelTree(DelDir + AddBackslash('Live365'), true, true, true);
	DelTree(DelDir + AddBackslash('LMA'), true, true, true);
	DelTree(DelDir + AddBackslash('MoodLogic'), true, true, true);
	DelTree(DelDir + AddBackslash('MusicMagic'), true, true, true);
	DelTree(DelDir + AddBackslash('Picks'), true, true, true);
	DelTree(DelDir + AddBackslash('Podcast'), true, true, true);
	DelTree(DelDir + AddBackslash('PreventStandby'), true, true, true);
	DelTree(DelDir + AddBackslash('RadioIO'), true, true, true);
	DelTree(DelDir + AddBackslash('RadioTime'), true, true, true);
	DelTree(DelDir + AddBackslash('RandomPlay'), true, true, true);
	DelTree(DelDir + AddBackslash('Rhapsody'), true, true, true);
	DelTree(DelDir + AddBackslash('RS232'), true, true, true);
	DelTree(DelDir + AddBackslash('ShoutcastBrowser'), true, true, true);
	DelTree(DelDir + AddBackslash('TT'), true, true, true);
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
	ErrorCode: Integer;
	TrayPath: String;
	NewServerDir: String;
	PrefsFile: String;
	PrefString: String;

begin
	if CurStep = ssInstall then
		begin
			UninstallSliMP3();
			UninstallSlimServer();

			// Stop the old tray
			TrayPath := AddBackslash(ExpandConstant('{app}')) + 'SqueezeTray.exe';
			if (FileExists(TrayPath)) then
				Exec(TrayPath, '--exit --uninstall', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ErrorCode)

			// stop and remove our services
			Exec('sc', 'stop squeezesvc', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
			Exec('sc', 'delete squeezesvc', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
			Exec('sc', 'stop SqueezeMySQL', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
			Exec('sc', 'delete SqueezeMySQL', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);

			RemoveLegacyFiles();

			// Remove other defunct pieces
			DeleteFile(AddBackslash(ExpandConstant('{app}')) + 'psapi.dll');
			DeleteFile(AddBackslash(ExpandConstant('{app}')) + 'SlimServer.exe');
		end;

	if CurStep = ssPostInstall then begin

		// Add firewall rules for Vista
		if (GetWindowsVersion shr 24 >= 6) then
			Exec('netsh', 'advfirewall firewall add rule name="SqueezeCenter" description="Allow SqueezeCenter to accept inbound connections." dir=in action=allow program="' + ExpandConstant('{app}') + '\server\squeezecenter.exe' + '"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);

		PrefsFile := GetPrefsFile();

		if not FileExists(PrefsFile) then
			begin
				PrefString := '---' + #13#10 + 'audiodir: ' + GetMusicFolder() + #13#10 + 'playlistdir: ' + GetPlaylistFolder() + #13#10 + 'language: ' + AnsiUppercase(ExpandConstant('{language}')) + #13#10;
				SaveStringToFile(PrefsFile, PrefString, False);
			end;

		NewServerDir := AddBackslash(ExpandConstant('{app}')) + AddBackslash('server');

		Exec(NewServerDir + 'squeezecenter.exe', '-install auto', NewServerDir, SW_HIDE, ewWaitUntilTerminated, ErrorCode);
		Exec('net', 'start squeezesvc', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);

		Exec(ExpandConstant('{app}') + '\SqueezeTray.exe', '--install', ExpandConstant('{app}'), SW_SHOW, ewNoWait, ErrorCode);
	end;
	
end;
