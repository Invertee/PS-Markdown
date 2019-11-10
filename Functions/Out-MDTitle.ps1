function Out-MDTitle {
    Param(
        [parameter(Position=0)] [ValidateScript({$_.Length -lt 80})] [string] $Title,
        [parameter()] [ValidateSet('h1','h2','h3','h4','h5','h6')] $Header,
        [parameter()] [string] $File = "C:$env:HOMEPATH\Desktop\Output.md"
    )

    switch ($Header) {
        'h1' { $Output = '# '  }
        'h2' { $Output = '## '  }
        'h3' { $Output = '### '  }
        'h4' { $Output = '#### '  }
        'h5' { $Output = '##### '  }
        'h6' { $Output = '###### '  }
        Default { $Output = '# '}
    }
    $Output = $Output + $Title
    $Output | Out-File -FilePath $File -Encoding utf8 -Append
}