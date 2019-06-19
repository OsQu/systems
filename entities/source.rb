class Source
  include Entity

  def initialize(name, rate:)
    super
    @rate = rate
  end

  def produce
    @rate
  end
end
