require "test_helper"

class TryCorderTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TryCorder::VERSION
  end
end
