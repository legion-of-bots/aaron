module Aaron

  class Task

    attr_reader :range, :block

    def initialize range, proc = nil, &block
      @range = range
      @block = proc or block
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
      if block.type then self.send(block.type) else block.call end
    end

    protected

      def get_next_sleep
        if range.instance_of?(Range)
          rand(range)
        else
          range
        end
      end

      def exec
        cmd = block.call.split(' ')
        bin = File.expand_path(cmd[0])
        if not File.exists?(bin)
          bin = cmd[0]
        end
        rest = cmd.drop(1).join(' ')
        bin  += ' ' + rest
        `#{bin}`
      end

  end

end
