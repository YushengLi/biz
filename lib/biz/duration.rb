module Biz
  class Duration

    include Comparable

    extend Forwardable

    class << self

      def seconds(seconds)
        new(seconds)
      end

      alias second seconds

      def minutes(minutes)
        new(minutes * Time::SECONDS_IN_MINUTE)
      end

      alias minute minutes

      def hours(hours)
        new(hours * Time::SECONDS_IN_HOUR)
      end

      alias hour hours

    end

    attr_reader :seconds

    delegate to_i: :seconds

    def initialize(seconds)
      @seconds = Integer(seconds)
    end

    def in_seconds
      seconds
    end

    def in_minutes
      seconds / Time::SECONDS_IN_MINUTE
    end

    def in_hours
      seconds / Time::SECONDS_IN_HOUR
    end

    def +(other)
      self.class.new(seconds + other.seconds)
    end

    def -(other)
      self.class.new(seconds - other.seconds)
    end

    def positive?
      seconds > 0
    end

    def abs
      self.class.new(seconds.abs)
    end

    def <=>(other)
      return unless other.is_a?(self.class)

      seconds <=> other.seconds
    end

  end
end
