require "cutest"
require "cutest/kernel"
require "cutest/runner"
require "cutest/reporter/version"
require "cutest/result"

class Cutest
  class Reporter
    attr_reader :results

    def initialize
      @results = []
    end

    # Store test result
    def record name, state, exception = nil
      results.push(Result.new(name, state, exception))
      print display(state)
    end

    # Output summary report
    def report
      successed = results.select(&:successed?)
      failed = results.select(&:failed?)
      skipped = results.select(&:skipped?)

      puts
      puts "#{results.count} tests"
      puts "#{successed.count} successed"
      puts "#{failed.count} failed"
      puts "#{skipped.count} skipped"

      display_result_trace(failed, "Failed:") if failed.count > 0
      display_result_trace(skipped, "Skipped:") if skipped.count > 0
    end

    private

    def display_result_trace(results, header)
      puts header
      results.each do |result|
        puts "test: #{result.name}"
        result&.exception&.backtrace&.each { |line| Cutest.display_trace(line) }
      end
    end

    def display state
      case state
      when "successed"
        "."
      when "failed"
        "F"
      when "skipped"
        "S"
      end
    end
  end
end
