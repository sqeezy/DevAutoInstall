$packageFilePath = ".\chocolateyPackages.config"

#Get installed chocolatey-packages by name
$installedPackagesIds = Get-ChildItem (Join-Path $ENV:chocolateyinstall 'lib')| Select-Object -Property Name | ForEach {$_."Name"}

#Load package file as xml tree
[xml]$packageFile = Get-Content $packageFilePath

#Determine which packages are on the system but not in the file
$packageFileIds = $packageFile.packages.ChildNodes | ForEach {$_."Name"}
$toAdd = $installedPackagesIds | where {!$packageFileIds.Contains($_)}

#Build xml elements
foreach($newPackageName in $toAdd)
{
    $xmlElement = $packageFile.CreateElement("package")
    $xmlElement.SetAttribute("Name",$newPackageName)
    $packageFile.packages.PrependChild($xmlElement)
}

$packageFile.Save($packageFilePath)