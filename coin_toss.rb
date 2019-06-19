require './entities/system'

coin_toss = Systems.define do |s|
  score = s.stock(:score)
  coin = s.flow(:coin) do
    if rand(2) == 0
      -1
    else
      1
    end
  end

  score.add_source coin
end

coin_toss.run
