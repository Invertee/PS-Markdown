function Out-MDTable {
    Param(
        [parameter(Position=0)] [psobject] $InputObject,
        [parameter()] [switch] $Centered,
        [parameter()] [string] $File = "C:$env:HOMEPATH\Desktop\Output.md"
    )
    $Output = '|' ; $Header = '|'
    $Headers = @()

    # Header Creation
    $InputObject[0].psobject.properties.name | ForEach-Object {
        $Headers += $_
        $Output +=  $_
        $Output += '|'
        if ($Centered) {$Header += ':-:|'} else {$Header += '-|'} 
    }
    $Output = $Output + "`n" + $Header + "`n"

    #Content
    ForEach ($Member in $InputObject) {
        $Output += '|'
        for ($i = 0 ; $i -lt $Headers.Length ; $i++) {
            $D = $Member | select-object -ExpandProperty $Headers[$i] | Out-String -Stream
            $Output += ($D + '|')
        }
        $Output += "`n"
    }
    $Output | Out-File -FilePath $File -Encoding utf8 -Append
}