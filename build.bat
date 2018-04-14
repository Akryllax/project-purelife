@echo off

SET A3PATH=C:\Program Files (x86)\Steam\steamapps\common\Arma 3
SET A3TOOLS_PATH=H:\SteamLibrary\steamapps\common\Arma 3 Tools
SET ADDON_PREFIX="purelife2"

taskkill /im arma3_x64.exe /F

"%A3TOOLS_PATH%\AddonBuilder\AddonBuilder.exe" "%cd%\@Purelife2\Addons\purelifeserver" "%A3PATH%\@Purelife2\Addons" -clear

"%A3PATH%\arma3_x64.exe" -noSplash -skipIntro -cpuCount=4 -exThreads=7 -showScriptErrors -debugCallExtension -mod=@Purelife2;@extDB3; "%cd%\Mission.Stratis"