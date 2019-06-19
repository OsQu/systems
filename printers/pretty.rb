#!/usr/bin/env ruby
module Printers
  class Pretty
    def header
      "Simulation started"
    end

    def footer
      "Simulation ended"
    end

    def tick_header(i)
      "#{i}:"
    end

    def initialize(stocks)
      @stocks = stocks
    end

    def print
      @stocks.map do |stock|
        "  #{stock.name} => #{stock.value}"
      end.join("\n")
    end
  end
end
