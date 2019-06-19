module Printers
  class CSV
    def header
      "tick,stock,value"
    end

    def initialize(stocks)
      @stocks = stocks
    end

    def print(tick_number)
      @stocks.map do |stock|
        "#{tick_number},#{stock.name},#{stock.value}"
      end.join("\n")
    end
  end
end
