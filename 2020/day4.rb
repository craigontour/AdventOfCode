# keywords: regex scan/match, hash, args, case

data = File.open('day4.txt').readlines()

pstr = ''
passports = []

data.each_with_index do |line, i|
  # pp "line: #{i} = #{line.chomp} | length:#{line.chomp.length}"

  if line.chomp.length > 0
    pstr += line.chomp.scan(/(.*:.*)/)[0][0] + ' '
  end

  if line.chomp.length == 0 || i == data.length-1
    # create new hash
    passport = {}
    # add info data as k, v pairs
    pstr.split(' ').sort.reverse.each do |m|
      k, v = m.split(':')
      passport[k] = v
    end
    # puts "
    # passport: #{passport}
    # cid.nil?: #{passport['cid'].nil?}
    # length  : #{passport.length}
    # "

    # Criteria for valid passport
    if passport.length == 8
      passports << passport
      puts "Valid passport = #{passport}"
      readline()
    elsif passport.length == 7 && passport['cid'].nil?
      passports << passport
      puts "Valid passport = #{passport}"
      readline()
    end
    pstr = ''
  end

end

puts "Part 1: #{passports.length}"

#  ____            _     ____  
# |  _ \ __ _ _ __| |_  |___ \ 
# | |_) / _` | '__| __|   __) |
# |  __/ (_| | |  | |_   / __/ 
# |_|   \__,_|_|   \__| |_____|

data = File.open('day4.txt').readlines()

eyes = %w(amb blu brn gry grn hzl oth)
passports = []
pstr = ''
debug = (ARGV[0] != nil)

data.each_with_index do |line, i|
  if line.chomp.length > 0
    pstr += line.chomp.scan(/(.*:.*)/)[0][0] + ' '
  end

  if line.chomp.length == 0 || i == data.length-1
    # Extract passport fields into a hash
    passport = {}
    pstr.split(' ').sort.reverse.each do |m|
      k, v = m.split(':')
      passport[k] = v
    end
    puts "
    passport: #{passport}
    length  : #{passport.length}" if debug

    # Passport field validation
    valid = false
    if passport.length == 8 || (passport.length == 7 && passport['cid'].nil?)
      passport.each do |k, v|
        case k
        when 'byr'
          valid = (v.to_i >= 1920 && v.to_i <= 2002)
          puts "#{k}: 1920 => #{v} <= 2002 | #{valid}" if debug
        when 'iyr'
          valid = (v.to_i >= 2010 && v.to_i <= 2020)
          puts "#{k}: 2010 => #{v} <= 2020 | #{valid}" if debug
        when 'eyr'
          valid = (v.to_i >= 2020 && v.to_i <= 2030)
          puts "#{k}: 2020 => #{v} <= 2030 | #{valid}" if debug
        when 'hgt'
          if v.match(/\d+cm/)
            h = v.scan(/(\d+)cm/)[0][0].to_i
            valid = (h >= 150 && h <= 193)
            puts "#{k}: 150 => #{v} <= 193 | #{valid}" if debug
          elsif v.match(/(\d+)in/)
            h = v.scan(/(\d+)in/)[0][0].to_i
            valid = (h >= 59 && h <= 76)
            puts "#{k}: 59 >= #{v} <= 76 | #{valid}" if debug
          else
            valid = false
          end
        when 'ecl'
          valid = eyes.include?(v)
          puts "#{k}: #{v} included in #{eyes} = #{eyes.include?(v)} | #{valid}" if debug
        when 'hcl'
          valid = !!(v =~ /#[0-9a-f]{6}/)
          puts "#{k}: #{v} matches a-z-0-9*6 | #{valid}" if debug
        when 'pid'
          valid = v.length == 9
          puts "#{k}: #{v} has length eq 9: #{v.length == 9}? | #{valid}" if debug
        end
        break if !valid
      end
      passports << passport if valid
    end
    
    puts "passport: #{passport['pid']} | valid:#{valid} | passports: #{passports.length}" if debug
    pstr = ''

  end
end

puts passports if debug
puts "Part 2: #{passports.length}"
