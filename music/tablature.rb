
# Code that Jeff wrote to generate the tablature.
class TablatureGenerator
  STRING_COUNT = 6

 # Each tab has a number and 2 -. 
  # 0--5--3--2--0-----1-----------------0--------
  # ---------------3--------------1--3-----------
  # ---------------------7--2--2-----------2--4--
  # ---------------------------------------------
  # ---------------------------------------------
  # ---------------------------------------------

  # Code is amazing beacuse ther eis no if statements and error handlers. But it is not production ready. 
  
  def generate_notes(lines)
    tablature_sections = generate_tabs(lines)
    tablature = tablature_sections.map { |parts| parts.join }
    return tablature.join("\n")
  end

  def generate_tabs(lines)  
    tablature = lines.map do |line|
      parts = line.split(' ')
      tab_column(parts[0].to_i, parts[1])
    end
    return tablature.transpose
  end

  def tab_column(string, fret)
    return ["---"] * (string - 1) +
           [fret.ljust(3, '-')] +
           ["---"] * (STRING_COUNT - string)
  end

  def process_file(filename)
    File.open(filename, "r") do |f|
      input_lines = f.readlines
      generate_notes(input_lines)
    end
  end
end

# Worries:  # Stuff that can go wrong.
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
