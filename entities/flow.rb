class Flow
  include Entity

  def initialize(name, &block)
    super
    @evaluate = block
  end

  def process
    @evaluate.call
  end
end
