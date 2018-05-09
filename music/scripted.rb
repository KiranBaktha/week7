STRING_COUNT = 6

def tab_column(string, fret)
  ["---"] * (string - 1) +
  [fret.ljust(3, '-')] +
  ["---"] * (STRING_COUNT - string)
end

File.open(ARGV[0], "r") do |f|
  puts f.each_line
        .map(&:split)
        .map {|string, fret| tab_column(string.to_i, fret) }
        .transpose
        .map(&:join)
        .join("\n")
end
