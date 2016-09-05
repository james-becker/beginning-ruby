module NumberStuff
  def random
    rand(1000000)
  end
end

include NumberStuff

module LetterStuff
  def LetterStuff.random
    (rand(26) + 65).chr
  end
end

puts random
puts LetterStuff.random
