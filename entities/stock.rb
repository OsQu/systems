class Stock
  include Entity

  attr_reader :value

  def initialize(name, initial_value: 0)
    super

    @value = initial_value

    @sources = []
    @sinks = []
  end

  def add_source(source)
    @sources << source
  end

  def add_sink(sink)
    @sinks << sink
  end

  def tick
    @value = @value + @sources.map(&:produce).sum - @sinks.map(&:consume).sum
  end
end
