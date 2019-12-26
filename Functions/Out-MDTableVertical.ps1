function Out-MDTableVertical {
    Param(
        [parameter(Position=0)] $InputObject, # Removed hashtable requirment because it messes ordering
        [parameter()] [switch] $Centered,
        [parameter(Mandatory=$true)] [string] $HeaderTitle,
        [parameter()] [string] $File = "C:$env:HOMEPATH\Desktop\Output.md"
    )

    # Header Creation
    $Output = "| $HeaderTitle ||" + "`n"
    if ($Centered) {$Output += "|:-:|:-:|`n"} else {$Output += "|-|-|`n"} 

    foreach ($item in $InputObject.keys) {
        if ( $($InputObject.Item($item)).GetType().BaseType.Name -eq 'Array' ) {
            Foreach ( $index in $InputObject.Item($item) ) {
                $str += "$index<br>"
            }
            $Output += "|" + ${item}   + "|" + $str + "|`n"
        } else {
            $Output += "|" + ${item}   + "|" + $($InputObject.Item($item)) + "|`n"
        }
    }
    $Output | Out-File -FilePath $File -Encoding utf8 -Append
}