[System.int64[]]$Numbers = (Get-Content -Path C:\DEV\Powershell\Advent2018\Day1_input.txt)

#region Part 1
[System.Int32]$Part1 = ($Numbers | Measure-Object -sum).sum
#endregion

Write-Host -Object "Answer to Part 1: $Part1" -ForegroundColor Yellow


#region Part 2
[System.Boolean]$FrequencyFound = $false
[System.Int32]$CurrentSum = 0
[System.Collections.ArrayList]$Seen = @(5)
while (!$FrequencyFound)
{
    :frequencyloop foreach ($number in $Numbers)
    {
        $CurrentSum += $number
        #$numberhash.$CurrentSum += 1
        if ($CurrentSum -in $Seen)
        {
            $FrequencyFound = $true
            $Part2 = $CurrentSum
            break frequencyloop
        }
        $null = $Seen.Add($CurrentSum)
    }
}
#endregion

Write-Host -Object "Answer to Part 2: $Part2" -ForegroundColor Yellow
