function Out-MDList {
    Param(
        [parameter(Position=0)] [array] $Items,
        [parameter()] [switch] $Ordered,
        [parameter()] [string] $File = "C:$env:HOMEPATH\Desktop\Output.md"
    )
    for ( $i = 0 ; $i -lt $items.Count ; $i++) {
        if ($Ordered) {
            $Output += "$($i + 1). " + $items[$i] + "`r"
        } else {
            $Output += "* " + $items[$i] + "`r"
        }
    }

    $Output | Out-File -FilePath $File -Encoding utf8 -Append
}