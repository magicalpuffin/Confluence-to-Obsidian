# ConvetHTMLToMarkdown.ps1

# Set the path to the folder containing the HTML files
$sourceFolder = "./confluence_workspace"

# Set the path to the folder containing generated Markdown files
$destinationFolder = "./markdown"

# Set the path to the lua filter script
$luaFilterPath = "filter_html.lua"

# Get all HTML files in the folder
$htmlFiles = Get-ChildItem -Path $sourceFolder -Filter "*.html" -File

# Loop through each HTML file and convert to Markdown using Pandoc
# foreach ($htmlFile in $htmlFiles[0..10]) {
foreach ($htmlFile in $htmlFiles) {
    $htmlFilePath = $htmlFile.FullName
    $markdownFileName = Join-Path -Path $destinationFolder -ChildPath ([System.IO.Path]::ChangeExtension($htmlFile.Name, "md"))
   
    $command = "pandoc '$htmlFilePath' -f html -t gfm -L '$luaFilterPath' -s -o '$markdownFileName'"
    Invoke-Expression $command
}