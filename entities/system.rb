require_relative 'entity'
require_relative 'sink'
require_relative 'source'
require_relative 'stock'
require_relative '../printers/pretty'

module Systems
  def self.define
    System.new.tap { |system| yield system }
  end
end

class System
  def initialize
    @stocks = []
  end

  def stock(name)
    Stock.new(name).tap do |stock|
      @stocks << stock
    end
  end

  def source(name, opts = {})
    Source.new(name, opts)
  end

  def sink(name, opts = {})
    Sink.new(name, opts)
  end

  def run(ticks = -1)
    printer = Printers::Pretty.new(@stocks)

    puts printer.header

    if ticks > 0
      ticks.times do |i|
        tick(i, printer)
      end
    else
      loop { |i| tick(i, printer) }
    end

    puts printer.footer
  end

  def tick(i, printer)
    puts printer.tick_header(i)

    @stocks.each(&:tick)

    puts printer.print
  end
end
