function Out-MDText {
    Param(
        [parameter(Position=0)] [string] $Text,
        [parameter()] [switch] $AsString,
        [parameter()] [string] $File = "C:$env:HOMEPATH\Desktop\Output.md",
        [parameter()] [switch] $NoNewLine
    )
    if (!$NoNewLine) {
     $Output = "`r" + $Text
    } else {
        $Output = $Text
    }
    
    if ($AsString) {
        $Output | Out-String -Stream
    } else {
        $Output | Out-File -FilePath $File -Encoding utf8 -Append
    }
}