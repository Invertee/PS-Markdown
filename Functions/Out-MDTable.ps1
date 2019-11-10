function Out-MDTable {
    Param(
        [parameter(Position=0)] [psobject] $InputObject,
        [parameter()] [switch] $Centered,
        [parameter()] [string] $File = "C:$env:HOMEPATH\Desktop\Output.md"
    )
    $Output = '|' ; $Header = '|'
    $Headers = @()

    # Header Creation
    $InputObject | Get-Member -MemberType Properties | ForEach-Object {
        $Headers += $_.Name
        $Output += $_.Name
        $Output += '|'
        if ($Centered) {$Header += ':-:|'} else {$Header += '-|'} 
    }
    $Output = $Output + "`r" + $Header + "`r"

    #Content
    ForEach ($Member in $InputObject) {
        for ($i = 0 ; $i -lt $Headers.Length ; $i++) {
            $D = $Member | select-object -ExpandProperty $Headers[$i] | Out-String -Stream
            $Output += ($D + '|')
        }
        $Output += "`r"
    }

    $Output | Out-File -FilePath $File -Encoding utf8 -Append
}