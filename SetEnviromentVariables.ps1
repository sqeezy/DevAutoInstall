#This scripts assumes that all applications are installed in their default directory

$enviromentAdditions = Get-Content -Raw .\enviromentVariables.config| ConvertFrom-StringData

foreach($key in $enviromentAdditions.Keys){
[Environment]::SetEnvironmentVariable($key,$enviromentAdditions[$key],"Machine")
}