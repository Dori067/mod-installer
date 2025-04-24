@echo off
setlocal

set "download_url_sodium=https://cdn.modrinth.com/data/AANobbMI/versions/OwLQelEI/sodium-fabric-0.5.11+mc1.20.6.jar"
set "download_url_lithium=https://cdn.modrinth.com/data/gvQqBUqZ/versions/5a3sPIH2/lithium-fabric-mc1.20.6-0.12.5.jar"
set "download_url_ferritecore=https://cdn.modrinth.com/data/uXXizFIs/versions/i9RcCdZv/ferritecore-6.1.1-fabric.jar"
set "download_url_modernfix=https://cdn.modrinth.com/data/nmDcB62a/versions/dUdr6D7I/modernfix-fabric-5.18.0+mc1.20.6.jar"
set "appdata_path=%appdata%"
set "mods_folder=%appdata_path%\.minecraft\mods"
set "mod_name_sodium=sodium-fabric-0.5.11+mc1.20.6.jar"
set "mod_name_lithium=lithium-fabric-mc1.20.6-0.12.5.jar"
set "mod_name_ferritecore=ferritecore-6.1.1-fabric.jar"
set "mod_name_modernfix=modernfix-fabric-5.18.0+mc1.20.6.jar"

echo Creating mods folder if it doesn't exist...
if not exist "%mods_folder%" (
    mkdir "%mods_folder%"
    if errorlevel 1 (
        echo Failed to create the mods folder...
        exit /b 1
    )
)

echo Downloading Sodium...
curl -L -o "%mods_folder%\%mod_name_sodium%" "%download_url_sodium%"
if errorlevel 1 (
    echo Failed to download Sodium. Please check your internet connection.
    goto download_failed
)

echo Downloading Lithium...
curl -L -o "%mods_folder%\%mod_name_lithium%" "%download_url_lithium%"
if errorlevel 1 (
    echo Failed to download Lithium. Please check your internet connection.
    goto download_failed
)

echo Downloading FerriteCore...
curl -L -o "%mods_folder%\%mod_name_ferritecore%" "%download_url_ferritecore%"
if errorlevel 1 (
    echo Failed to download FerriteCore. Please check your internet connection.
    goto download_failed
)

echo Downloading ModernFix...
curl -L -o "%mods_folder%\%mod_name_modernfix%" "%download_url_modernfix%"
if errorlevel 1 (
    echo Failed to download ModernFix. Please check your internet connection.
    goto download_failed
)

echo.
echo All files downloaded successfully!!
pause
exit /b 0

:download_failed
echo.
echo One or more files failed to download. Please check the error messages.
pause
exit /b 1
