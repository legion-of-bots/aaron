module Aaron

  class DSL

    attr_reader :scheduler

    def initialize
      @scheduler = Scheduler.new
    end

    def every range, &block
      scheduler << Task.new(range, &block)
      scheduler
    end

  end

end
