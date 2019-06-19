module Entity
  def initialize(name, opts = {})
    @name = name
  end

  def self.included(base)
    base.attr_reader :name
  end
end
