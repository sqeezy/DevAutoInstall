#This scripts assumes that all applications are installed in their default directory

$enviromentAdditions = @{
                            #Add variables here
                        }

foreach($key in $enviromentAdditions.Keys){
[Environment]::SetEnvironmentVariable($key,$enviromentAdditions[$key],"Machine")
}