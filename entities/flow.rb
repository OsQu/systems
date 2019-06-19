class Flow
  include Entity

  def initialize(name, rate:)
    super
    @rate = rate
  end

  def process
    @rate
  end
end
