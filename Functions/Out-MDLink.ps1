function Out-MDLink {
    Param(
        [parameter(Mandatory=$true)] [string] $Text,
        [Parameter(Mandatory=$true)] [string] $Link,
        [parameter()] [switch] $AsString,
        [parameter()] [string] $File = "C:$env:HOMEPATH\Desktop\Output.md"
    )
    $Output = '[' + $Text + ']' + '(' + $Link + ')'
    if ($AsString) {
        $Output | Out-String -Stream
    } else {
        $Output | Out-File -FilePath $File -Encoding utf8 -Append
    }
}