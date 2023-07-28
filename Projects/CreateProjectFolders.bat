

if not exist ".\ProjectFolder" mkdir .\ProjectFolder

mkdir .\ProjectFolder\sandbox
mkdir .\ProjectFolder\src
mkdir .\ProjectFolder\vitis

mkdir .\ProjectFolder\src\sources
mkdir .\ProjectFolder\src\simulation
mkdir .\ProjectFolder\src\blockDesign
mkdir .\ProjectFolder\src\constraints
mkdir .\ProjectFolder\src\hardwareFiles
mkdir .\ProjectFolder\src\ipCores

xcopy .\_ForScript\RestoreProject.bat .\ProjectFolder\
xcopy .\_ForScript\.gitignore .\ProjectFolder\