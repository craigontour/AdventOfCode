# keywords: array, match/captures, sub (replace first), deduplicate (uniq)
  
# Start molecule
molecule = 'CRnSiRnCaPTiMgYCaPTiRnFArSiThFArCaSiThSiThPBCaCaSiRnSiRnTiTiMgArPBCaPMgYPTiRnFArFArCaSiRnBPMgArPRnCaPTiRnFArCaSiThCaCaFArPBCaCaPTiTiRnFArCaSiRnSiAlYSiThRnFArArCaSiRnBFArCaCaSiRnSiThCaCaCaFYCaPTiBCaSiThCaSiThPMgArSiRnCaPBFYCaCaFArCaCaCaCaSiThCaSiRnPRnFArPBSiThPRnFArSiRnMgArCaFYFArCaSiRnSiAlArTiTiTiTiTiTiTiRnPMgArPTiTiTiBSiRnSiAlArTiTiRnPMgArCaFYBPBPTiRnSiRnMgArSiThCaFArCaSiThFArPRnFArCaSiRnTiBSiThSiRnSiAlYCaFArPRnFArSiThCaFArCaCaSiThCaCaCaSiRnPRnCaFArFYPMgArCaPBCaPBSiRnFYPBCaFArCaSiAl'

# Reproducing the solution from day19.py
replacements = []
File.readlines('day19.txt').each do |line|
  replacements << line.chomp.match('(\w+) => (\w+)').captures
end

results = []
ml = molecule.length-1

# for each k/v pair
replacements.each do |k, v|

  # go through the molecule char by char
  for i in 0..ml do

    # if key is found then replace it
    if molecule[i..ml].include?(k)
      if i == 0
        left = ''
      else
        left = molecule[0..(i-1)]
      end
      
      # sub replaces the first only
      right = molecule[i..ml].sub(k, v)
      # puts "k:#{k} found at #{i} r:#{right}, m:#{molecules.length}"
      results << "#{left}#{right}"
    end
  end
end

# deduplicate
pp "Part 1: #{results.uniq.length}"

molecule = 'e'
ml = 0
part2 = ''
replacements.reverse!

replacements.each do |k, v|
  for i in 0..ml do
    if molecule[i..ml].include?(k)

      pp "i:#{i}, k:#{k}, v:#{v}, m:#{molecule}"
      molecule = molecule.sub(k, v)
      pp "i:#{i}, k:#{k}, v:#{v}, m:#{molecule}"

      replacements.pop
    end
  end
  pp replacements.length
end
