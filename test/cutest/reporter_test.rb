require "test_helper"

class Cutest::ReporterTest
  setup do
    @reporter = Cutest::Reporter.new
  end

  test "has a version number" do
    assert ::Cutest::Reporter::VERSION
  end

  test "#record add new result" do
    assert_equal @reporter.results.count, 0

    @reporter.record('test', 'successed')
    assert_equal @reporter.results.count, 1
  end

  test "#display with successed state" do
    assert_equal @reporter.send(:display, 'successed'), "."
  end

  test "#display with failed state" do
    assert_equal @reporter.send(:display, 'failed'), "F"
  end

  test "#display with skipped state" do
    assert_equal @reporter.send(:display, 'skipped'), "S"
  end
end
