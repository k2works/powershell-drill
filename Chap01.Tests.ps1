$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "３値の最大値" {
    $testCase = @(
        @{ a = 3; b = 2; c = 1; expected = 3 }
        @{ a = 3; b = 2; c = 2; expected = 3 }
        @{ a = 3; b = 1; c = 2; expected = 3 }
        @{ a = 3; b = 2; c = 3; expected = 3 }
        @{ a = 2; b = 1; c = 3; expected = 3 }
        @{ a = 3; b = 3; c = 2; expected = 3 }
        @{ a = 3; b = 3; c = 3; expected = 3 }
        @{ a = 2; b = 2; c = 3; expected = 3 }
        @{ a = 2; b = 3; c = 1; expected = 3 }
        @{ a = 2; b = 3; c = 2; expected = 3 }
        @{ a = 1; b = 3; c = 2; expected = 3 }
        @{ a = 2; b = 3; c = 3; expected = 3 }
        @{ a = 1; b = 2; c = 3; expected = 3 }
    )

    It '<a> <b> <c> ならば <expected> を返す' -TestCases $testCase {
        param ($a, $b, $c, $expected)
        Max3 $a $b $c | Should -Be $expected
    }
}

function Max3 {
    param (
        [int] $a,
        [int] $b,
        [int] $c
    )
    $result = $a
    if ($b -gt $result) { $result = $b }
    if ($c -gt $result) { $result = $c }
    return $result
}