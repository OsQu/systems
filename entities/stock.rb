class Stock
  include Entity

  attr_reader :value

  def initialize(name, initial_value: 0)
    super

    @value = initial_value

    @sources = []
    @sinks = []
  end

  def add_source(flow)
    @sources << flow
  end

  def add_sink(flow)
    @sinks << flow
  end

  def tick
    @value = @value + @sources.map(&:process).sum - @sinks.map(&:process).sum
  end
end
