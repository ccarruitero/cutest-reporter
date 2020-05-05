class Cutest
  module Runner
    def autorun
      at_exit { reporter.report }
    end
  end
end

Cutest.extend Cutest::Runner

Cutest.autorun
