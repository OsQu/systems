module Printers
  class CSV
    def header
      "stock,value"
    end

    def initialize(stocks)
      @stocks = stocks
    end

    def print
      @stocks.map do |stock|
        "#{stock.name},#{stock.value}"
      end.join("\n")
    end
  end
end
