Set-ExecutionPolicy Unrestricted #needed so script executes

iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

cinst dev.config -y