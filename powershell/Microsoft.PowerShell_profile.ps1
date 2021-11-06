Set-Location C:\Users\LefrancoisC

function scoop.reinstall {
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

# RESET secret WHEN NEW SECRET ARE ADDED TO THE POD
# kubectl delete secret geoserver-keyvault-secrets -n dmp

function kb.sc.dev {
  kubectl.exe config use-context aksdev
}
function kb.sc.test {
  kubectl.exe config use-context akstest
}
function kb.sc.prod {
  kubectl.exe config use-context aksprob-b
}
function kb.gc {
  kubectl.exe config get-contexts
}
function kb.gp {
  # kubectl.exe -n iwls get pods -o wide
  kubectl.exe -n dmp get pods -o wide
}
function kb {
  # kubectl.exe -n iwls $args
  kubectl.exe -n dmp $args
}
function kb.logs {
  # kubectl.exe -n iwls logs $args
  kubectl.exe -n dmp logs $args
}

function term.cfg.edit {
   nvim %LOCALAPPDATA%\Microsoft\Windows Terminal\settings.json
   # %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
}
function vim {
  nvim $args
}
function psql.co.dev.carl {
  psql -h tdp-pg-dev-db1.postgres.database.azure.com -U carl.lefrancois@dfo-mpo.gc.ca@tdp-pg-dev-db1 -d geoserver -W
}
function psql.co.dev.geoserver_user {
  psql -h tdp-pg-dev-db1.postgres.database.azure.com -U geoserver_user@tdp-pg-dev-db1 -d geoserver -W
}

function ll {
  dir $args
}

# AZ CLI commands 
function az.db.accesstoken {
  az account get-access-token --resource-type oss-rdbms 
}

# tomcat 
function tomcat.start {
  $env:JAVA_HOME = "C:\Program Files\Java\jre8"
  $env:CATALINA_HOME = "C:\Users\LefrancoisC\Desktop\Travail\apps\apache-tomcat-8.5.71"
  C:\Users\LefrancoisC\Desktop\Travail\apps\apache-tomcat-8.5.71\bin\catalina.bat start
}

function tomcat.stop {
  C:\Users\LefrancoisC\Desktop\Travail\apps\apache-tomcat-8.5.71\bin\catalina.bat stop
}

function nvim.cfg {
  nvim $env:USERPROFILE/AppData/Local/nvim/init.lua $env:USERPROFILE/AppData/Local/nvim/lua/plugins.lua $env:USERPROFILE/AppData/Local/nvim/lua/settings.lua $env:USERPROFILE/AppData/Local/nvim/lua/keymappings.lua
}

function np {
  C:\Program Files (x86)\Notepad++\notepad++.exe $args
}

Import-Module PSKubectlCompletion
Set-Alias k -Value kubectl

Register-KubectlCompletion
# Add-Content --Path $PROFILE --Value "Import-Module PSKubectlCompletion"

$ENV:MyPAT = "5qpq43f5ea4nnmemn3eroc7nuogcxkmgkukkbwmc47zpkccztrpa"

Clear-Host

# Welcome message
# "You are now entering PowerShell : " + $env:Username
$ENV:STARSHIP_CONFIG = "$HOME\.starship\config.toml"
Invoke-Expression (&starship init powershell)

 
 
