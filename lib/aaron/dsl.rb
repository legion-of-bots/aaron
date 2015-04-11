module Aaron

  class DSL

    attr_reader :scheduler

    def initialize
      @scheduler = Scheduler.new
    end

    def every range, proc = nil, &block
      scheduler << Task.new(range, proc, &block)
      scheduler
    end

    def exec &block
      block.type = :exec
      block
    end

  end

end
