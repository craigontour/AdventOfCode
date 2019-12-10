# Data
# $data = gc "Day6_input.txt"
# Test data
$data = gc "c:\Dev\AdventOfCode\2018\Day6_test.txt"

# Calculate Manhattan distance between 2 points
function manDist {
  param ($p1, $p2, $q1, $q2)
  return ([math]::abs($p1-$q1))+([math]::abs($p2-$q2))
}

# Get min and max grid coordinates
$minX = $minY = $maxX = $maxY = -1
foreach ($coord in $data) {
  [int]$x = $coord.split(',')[0].trim()
  [int]$y = $coord.split(',')[1].trim()
  
  if ($minX -eq -1) {
    $minX = $maxX = $x
    $minY = $maxY = $y
  } 
  else
  {
    if ($minX -gt $x) { $minX = $x }
    if ($minY -gt $y) { $minY = $y }

    if ($maxX -lt $x) { $maxX = $x }
    if ($maxY -lt $y) { $maxY = $y }
  }
}

# $grid = New-Object 'object[,]' $maxX,$maxY
write-Host "Min coords: $minX , $minY"
write-Host "Max coords: $maxX , $maxY"

$totals = @{} # 2-dim array - New-Object 'object[,]' 2,$data.Count

# For each grid row (Y coord)
for ($y = $minY; $y -lt $maxY; $y++) {
  
  # For each grid column (X coord)
  for ($x = $minX; $x -lt $maxX; $x++) {

    # List of distances for x,y coord to locations
    $distances = @{}

    # For each location in data get distance to x, y coord.
    for ($c = 0; $c -lt $data.count; $c++) {
      $p1 = $data[$c].split(',')[0]
      $p2 = $data[$c].split(',')[1]
      $dist = manDist($x)($y)($p1)($p2)
      if ($dist -gt 0) { $distances[$c] = $dist }
    }

    # Find the lowest value
    $d = $distances.GetEnumerator() | sort Value | select -first 1

    # Ignore if 2+ locations closest
    $sorted = $distances | sort Value
    if ($sorted[0] -ne $sorted[1]) {
      $totals[$d.Name] += 1
    } else {
      $l = '.'
    }

    # exit
  }
}

Write-Host '--------------------------------------------'
$totals.GetEnumerator() | sort Value
Write-Host '--------------------------------------------'
($totals.GetEnumerator() | sort Value | select -Last 1).Value
