class Sink
  include Entity

  def initialize(name, rate:)
    super
    @rate = rate
  end

  def consume
    @rate
  end
end
