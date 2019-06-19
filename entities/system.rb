require_relative 'entity'
require_relative 'flow'
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

  def static_flow(name, rate:)
    Flow.new(name) do
      rate
    end
  end

  def flow(name, &block)
    Flow.new(name, &block)
  end

  def run(ticks: 100, printer_klass: Printers::Pretty, printer_rate: 1)
    printer = printer_klass.new(@stocks)

    puts printer.header if printer.respond_to?(:header)

    ticks.times do |i|
      puts printer.tick_header(tick_number) if printer.respond_to?(:tick_header)
      tick
      puts printer.print(i) if i % printer_rate == 0
    end

    puts printer.footer if printer.respond_to?(:footer)
  end

  def tick
    @stocks.each(&:tick)
  end
end
