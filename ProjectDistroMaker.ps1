#*Ask for a project name and description:
$FolderName = Read-Host "What is the name of your directory?"
$aboutDesc = Read-Host "Please enter a project description"

#*Add to .gitignore function:
$addignore = Read-Host "Do you want to add files to .gitignore? (Y/N)"
if($addignore -like "Y"){
echo "Enter Ignore File (Blank Line Exits):"
echo ""
 $ignorestring = while (1) { read-host | set r; if (!$r) {break}; $r} 
}
#*End .gitignore function


#*Ask to make it add in Html files, and if you want to open in VsCode:
$makehtmlsite = Read-Host "Do you want to make this a HTML Site? (Y/N)"
$opencode = Read-Host "Do you want to open in VSCODE? (Y/N)"

#*Stores the date of creation:
$CurrentDate = Get-Date -Format "MM-dd-yyyy"  # Customize the date format if needed

#*Stores Html header into a variable to be places in index.html:
$htmlheader = @"
 <!DOCTYPE html>
 <html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <link rel="stylesheet" href="style.css">
 </head>
 <body>
    
 </body>
 </html>
"@

#*Information to be injested into the about.md header.
$aboutheader = @"
ProjectName: **$FolderName**

Description: **$aboutDesc**

Date Created: **$CurrentDate**
"@

#*Base creation sequence for the project folder:
mkdir $FolderName
cd $FolderName
New-Item -Path . -Name "about.md" -ItemType "file" -Value $aboutheader
New-Item -Path . -Name ".gitignore" -ItemType "file"  -Value "about.md `n"
$ignorestring |Add-Content -Path .\.gitignore
New-Item -Path . -Name "read.me" -ItemType "file"


#*Function for creating the Html files/folders if approved:
 if($makehtmlsite -like "Y"){
    New-Item -Path . -Name "style.css" -ItemType "file"
    New-Item -Path . -Name "CNAME" -ItemType "file"
    New-Item -Path . -Name "index.html" -ItemType "file" -Value $htmlheader
    mkdir "Assets"
}

#*Function to open the created project in VsCode if approved: 
if($opencode -like "Y"){
    code .
}
