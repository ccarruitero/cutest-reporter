module Kernel
  private

  def reporter
    cutest[:reporter] ||= Cutest::Reporter.new
  end

  def flunk(message = nil)
    backtrace = caller
    trace = backtrace.select { |line| line !~ Cutest::FILTER }
    exception = Cutest::AssertionFailed.new(message)
    exception.set_backtrace(trace)
    reporter.record(cutest[:test], 'failed', exception)
  end

  def success
    reporter.record(cutest[:test], 'successed')
  end

  def skip(name = nil, &block)
    backtrace = caller
    trace = backtrace.select { |line| line !~ Cutest::FILTER }
    exception = Cutest::AssertionFailed.new()
    exception.set_backtrace(trace)
    reporter.record(name, 'skipped', exception)
  end
end
