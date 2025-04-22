@echo off
setlocal

set "download_url=https://cdn.modrinth.com/data/AANobbMI/versions/OwLQelEI/sodium-fabric-0.5.11%2Bmc1.20.6.jar"
set "download_url2=https://cdn.modrinth.com/data/gvQqBUqZ/versions/5a3sPIH2/lithium-fabric-mc1.20.6-0.12.5.jar"
set "download_url3=https://cdn.modrinth.com/data/uXXizFIs/versions/i9RcCdZv/ferritecore-6.1.1-fabric.jar"
set "download_url4=https://cdn.modrinth.com/data/nmDcB62a/versions/dUdr6D7I/modernfix-fabric-5.18.0%2Bmc1.20.6.jar"
set "appdata_path=%appdata%"
set "mods_folder=%appdata_path%\.minecraft\mods"
set "mod_name=sodium-fabric-0.5.11-1.20.6.jar"
set "mod_name2=lithium-fabric-0.12.5-1.20.6.jar"
set "mod_name3=ferritecore-6.1.1-fabric.jar"
set "mod_name4=modernfix-fabric-5.18.0-1.20.6.jar"


if not exist "%mods_folder%" (
    mkdir "%mods_folder%"
    if errorlevel 1 (
        echo Nem sikerult a mods mappat megcsinalni...
        exit /b 1
    )
)


echo Letoltes 1....
curl -L -o "%mods_folder%\%mod_name%" "%download_url%"


echo Letoltes 2....
curl -L -o "%mods_folder%\%mod_name2%" "%download_url2%"


echo Letoltes 3....
curl -L -o "%mods_folder%\%mod_name3%" "%download_url3%"


echo Letoltes 4....
curl -L -o "%mods_folder%\%mod_name4%" "%download_url4%"
if %errorlevel% equ 0 goto download_success


echo Sikertelen volt a fajl letoltese...
pause
exit /b 1

:download_success
echo Sikeresen le vannak toltve a fajlok!!
pause
exit /b 0
