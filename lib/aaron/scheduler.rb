module Aaron

  class Scheduler

    attr_reader :tasks

    def initialize
      @tasks = []
    end

    def run
      while true do
        n = next_sleep
        t = tasks.each { |task| task.apply_time!(n) }.select &:ready_to_trigger?
        sleep(n)
        t.each &:trigger
      end
    end

    def next_sleep
      tasks.map { |task| task.next_sleep }.sort.first
    end

    def add_task task
      self << task
    end

    def << task
      @tasks << task
    end

  end

end
