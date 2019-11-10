function Out-MDCodeBlock {
    Param(
        [parameter(Position=0)] [string] $Text,
        [parameter()] [string] $File = "C:$env:HOMEPATH\Desktop\Output.md"
    )
    $Output = '```' + $Text + '```'
    $Output | Out-File -FilePath $File -Encoding utf8 -Append
}