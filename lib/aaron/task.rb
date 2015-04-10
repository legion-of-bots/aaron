module Aaron

  class Task

    attr_reader :range, :block

    def initialize range, &block
      @range = range
      @block = block
    end

    def next_sleep
      @next_sleep ||= get_next_sleep
    end

    def apply_time! time
      @next_sleep -= time
      if @next_sleep == 0
        @next_sleep = nil
      end
    end

    def ready_to_trigger?
      @next_sleep.nil?
    end

    def trigger
      block.call
    end

    protected

      def get_next_sleep
        if range.instance_of?(Range)
          rand(range)
        else
          range
        end
      end

  end

end
