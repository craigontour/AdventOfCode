# Data
# $data = gc "Day6_input.txt"
# Test data
$data = gc "Day6_test.txt"
$colours = @('red','cyan','green','orange','blue','light grey','yellow','pink')

# Calculate Manhattan distance between 2 points
function manDist {
  param ($p1, $p2, $q1, $q2)
  return ([math]::abs($p1-$q1))+([math]::abs($p2-$q2))
}

function add_table_row {
  param ([string]$row)
  $row | Out-File './Day6_out2.html' -append
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

$html = "<html><head><title>Advent Of Code Part 6</title></head><body><h1>Advent Of Code Part 6</h1><table cellpadding='2' cellspacing='0' border-collapse='collapse' border-spacing='0' margin='0' padding='0'>"
$html | Out-File 'Day6_out2.html'

$totals = @{} # 2-dim array - New-Object 'object[,]' 2,$data.Count

# For each grid row (Y coord)
for ($y = $minY; $y -lt $maxY; $y++) {
  add_table_row("<tr>")
  
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
      $col = '{0:X2}' -f (140 - [int]$d.Name) + '{0:X2}' -f (140 - [int]$d.Name) + '{0:X2}' -f (140 - [int]$d.Name)
    } else {
      $l = '.'
      $col = 'FFFFFF'
    }
    
    # HTML - colour cell for that location
    [string[]]$coord = [string]$x + ", " + [string]$y
    if ($data.Contains($coord)) {
      # add_table_row("<td><strong>" + [string]$l + "</strong></td>")
      add_table_row("<td margin:'0 0' cellpadding='0' bgcolor='#000000'></td>")
    } else {
      add_table_row("<td margin:'0 0' cellpadding='0' bgcolor='#" + $col + "'></td>")
    }

    # exit
  }
  add_table_row("</tr>")
}

Write-Host '--------------------------------------------'
$totals.GetEnumerator() | sort Value
Write-Host '--------------------------------------------'
($totals.GetEnumerator() | sort Value | select -Last 1).Value

$html = "</table></body></head>"
$html | Out-File 'Day6_out2.html' -Append