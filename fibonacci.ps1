param(
    [int]$n = -1
)

function Get-Fibonacci {
    param([int]$n)
    
    if ($n -eq 0) {
        return 0
    }
    elseif ($n -eq 1) {
        return 1
    }
    else {
        return (Get-Fibonacci($n - 1)) + (Get-Fibonacci($n - 2))
    }
}

# To print all the fibonacci series till 100th value in 0.5 seconds
if ($n -eq -1) {
    $fibonacciArray = @()
    for ($i = 0; $i -le 100; $i++) {
        $fib = Get-Fibonacci -n $i
        $fibonacciArray += $fib
        Write-Output $fib
        Start-Sleep -Seconds 0.5
    }
}

# To print the corresponding fibonacci number which is passed as a parameter
else {
    $result = Get-Fibonacci -n $n
    Write-Output $result
}
