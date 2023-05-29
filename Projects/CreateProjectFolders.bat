

if not exist ".\ProjectFolder" mkdir .\ProjectFolder

mkdir .\ProjectFolder\sandbox
mkdir .\ProjectFolder\src

mkdir .\ProjectFolder\src\sources
mkdir .\ProjectFolder\src\simulation
mkdir .\ProjectFolder\src\blockDesign
mkdir .\ProjectFolder\src\constraints

xcopy .\_ForScript\RestoreProject.bat .\ProjectFolder\
xcopy .\_ForScript\.gitignore .\ProjectFolder\