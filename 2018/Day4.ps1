$data = Get-Content -path "C:\Dev\Powershell\Advent2018\Day4_input.txt"

$array = @()

for ($i = 0; $i -lt 10; $i++) {
  $data[$i]

  $parts = $data[$i].split(']')

  $shiftD = [DateTime]$parts[0].split('[')[1].trim()
  $action = $parts[1]
  
}

