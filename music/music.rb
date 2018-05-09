require_relative './tablature'

g = TablatureGenerator.new
notes = g.process_file(ARGV[0])
puts notes


# Worries:
#
# 1. Command line argument for the filename may be missing
# 2. Unable to open an input file
# 3. File is empty
# 4. Our input file is not a text file
# 5. A line has more than two numbers
# 6. A line has less than two numbers
# 7. A line has fields that cannot be parsed as numbers
# 8. The string number is less than one or more than six
# 9. The fret number is less than zero or more than twenty-four
