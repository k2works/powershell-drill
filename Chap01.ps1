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
