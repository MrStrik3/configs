# Set-PSDebug -Trace 2;

Set-Location C:\Users\LefrancoisC\Desktop\Travail

$ENV:WK="C:\Users\LefrancoisC\Desktop\Travail"
$ENV:TEMPDIR="C:\Users\LefrancoisC\Desktop\Temp"
$ENV:JAVA_HOME="C:\Program Files\Java\jdk-11.0.13"
$ENV:KUBE_EDITOR = "nvim"



function cd.wk {
  cd $ENV:WK
}
function cd.temp {
  cd $ENV:TEMPDIR
}

function ps.import.docker {
  Import-Module DockerCompletion
}
function ps.import.kb {
  Import-Module PSKubectlCompletion
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
  kubectl.exe config use-context aksprod-b
}
function kb.gc {
  kubectl.exe config get-contexts
}
function kb.gp {
  kubectl.exe -n iwls get pods -o wide
  # kubectl.exe -n dmp get pods -o wide
}
function kb {
  kubectl.exe -n iwls $args
  # kubectl.exe -n dmp $args
}
function kb.logs {
  kubectl.exe -n iwls logs $args
  # kubectl.exe -n dmp logs $args
}

function neptune.ng.serve {
  cd C:\Users\LefrancoisC\Desktop\Travail\CodeSource\Intellij\iwls\Neptune
  ng serve
}
# function kb.dev.geo.console {
#   kubectl.exe -n dmp exec -it geoserver-dev-geoserver-chart-0  -- bash
# }
#
function mvn.dep.tree {
    mvn dependency:tree
  }

function term.cfg.edit {
   nvim "%LOCALAPPDATA%\Microsoft\Windows Terminal\settings.json"
   # %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
}


# TERRAFORM cmds

# function t.plan {
#   terraform plan
# }
# function t.fmt {
#   terraform fmt
# }

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
  $env:JAVA_HOME = "C:\Program Files\Java\jdk-11.0.13"
  $env:CATALINA_HOME = "C:\Users\LefrancoisC\Desktop\Travail\apps\apache-tomcat-9.0.56"
  $env:CATALINA_OPTS = "-DENTITY_RESOLUTION_ALLOWLIST=www.patate.com"
  C:\Users\LefrancoisC\Desktop\Travail\apps\apache-tomcat-9.0.56\bin\catalina.bat start
}

function tomcat.stop {
  $env:CATALINA_HOME = "C:\Users\LefrancoisC\Desktop\Travail\apps\apache-tomcat-9.0.56"
  $env:JAVA_HOME = "C:\Program Files\Java\jdk-11.0.13"
  C:\Users\LefrancoisC\Desktop\Travail\apps\apache-tomcat-9.0.56\bin\catalina.bat stop
}

function arch.start {
  C:\Users\LefrancoisC\Desktop\Temp\wsl\archlinux\Arch.exe
}

function nvim.cfg {
  nvim $env:USERPROFILE/AppData/Local/nvim
}

function np {
  C:\Program Files (x86)\Notepad++\notepad++.exe $args
}


#function geo.b {
#  docker build . -t geoserver:2201
#}
#function geo.r {
#  docker run -it -p 8081:8080 -e GEOSERVER_KEYCLOAK_SECRET="9a6ab865-07de-42b1-a102-430e90d7ec88" geoserver:2201
#}

function wsl.arch {
  C:\Users\LefrancoisC\Desktop\Temp\wsl\archlinux\Arch.exe
}


# https://github.com/sakai135/wsl-vpnkit -- Fix WSL-VPN issues
function wsl.vpnkit.start {
  wsl -d wsl-vpnkit service wsl-vpnkit start
}
function wsl.vpnkit.stop {
  wsl -d wsl-vpnkit service wsl-vpnkit stop
}
function wsl.vpnkit.update {
  wsl --unregister wsl-vpnkit
  wsl --import wsl-vpnkit $env:USERPROFILE\wsl-vpnkit wsl-vpnkit.tar.gz --version 2
}

function wsl.vpnkit.logs {
  wsl.exe -d wsl-vpnkit tail -f /var/log/wsl-vpnkit.log
}
function wsl.vpnkit.cfg {
  nvim /mnt/c/Users/LefrancoisC/wsl-vpnkit/wsl-vpnkit.conf
}

function wsl.vpnkit.defaults {
  wsl -d wsl-vpnkit cat /app/defaults.conf
}

# PGSQL
function docker.pgsql.start {
  docker run -dp 5432:5432 -e POSTGRES_PASSWORD=support -e POSTGRES_DB="api-store" pgapiregistry:latest
}
function docker.wet.start {
  docker run -dp 8080:8080 wettemplate:latest
}

function docker.azurite.start {
  docker run -dp 10001:10001 -p 10000:10000 -p 10002:10002 mcr.microsoft.com/azure-storage/azurite
}

# Import-Module PSKubectlCompletion
Set-Alias k -Value kubectl

# Register-KubectlCompletion
# Add-Content --Path $PROFILE --Value "Import-Module PSKubectlCompletion"

$ENV:MyPAT = "huo3tuanqhseq2fmosjdrxzidp6s3cf7snezr6q4rd54xohxorga"

#
# Clear-Host

# Welcome message
# "You are now entering PowerShell : " + $env:Username
$ENV:STARSHIP_CONFIG = "$HOME\.starship\config.toml"
Invoke-Expression (&starship init powershell)

Import-Module posh-git

