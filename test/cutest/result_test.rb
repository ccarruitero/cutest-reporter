require "test_helper"

class Cutest::ResultTest
  setup do
    @result = Cutest::Result.new("test success", "successed")
  end

  test "has a defined state methods" do
    assert @result.respond_to?(:successed?)
    assert @result.respond_to?(:failed?)
    assert @result.respond_to?(:skipped?)
  end
end
