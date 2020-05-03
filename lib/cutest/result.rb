class Cutest
  class Result
    STATES = %w[successed failed skipped].freeze

    attr_reader :name, :state, :exception

    def initialize(name, state, exception = nil)
      @name, @state, @exception = name, state, exception

      STATES.each do |method|
        define_singleton_method "#{method}?" do
          state == method
        end
      end
    end
  end
end
