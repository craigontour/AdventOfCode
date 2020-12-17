require 'daru'

p1 = Daru::DataFrame.new(
  {
    "x" => [ 0, 0, 0 ],
    "y" => [ 0, 0, 0 ],
    "z" => [ 0, 0, 0 ]
},
index: ["x", "y", "z"]
)

puts p1['x'][0]
puts p1['x'].describe

df = Daru::DataFrame.new(
  {'Cat Names' => %w(Kitty Leo Felix),
    'Weight'   => [2,3,5]}
  )
p1.plot(type: :bar, x: 'Cat Names', y: 'Weight') do |plot, _|
  plot.x_label 'Cat Name'
  plot.y_label 'Weight'
  plot.yrange [0, 5]
end
.export_html