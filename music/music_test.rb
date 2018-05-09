require 'minitest/autorun'
require_relative './tablature.rb'

class TablatureTest < Minitest::Test

  def test_display
    expected = '0--5--3--2--0-----1-----------------0-----------------------0--1--0--------------
---------------3--------------1--3-----------------------------------3--0--------
---------------------7--2--2-----------2--4--0-----------------------------0--2--
------------------------------------------------2--0-----------------------------
------------------------------------------------------1--0-----------------------
---------------------------------------------------------------------------------'

    g = TablatureGenerator.new
    assert_equal expected, g.process_file('./test_input.txt')
  end
end