text = %q{Ruby is a great programming language. It is object oriented and has many groovy features. Some people don't like it, but that's not our problem! It's easy to learn. It's great. To learn more about Ruby, visit the official Ruby Web site today.}

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
p one_third
ideal_sentences = sentences_sorted.slice(one_third, one_third) # to compensate for rounding due to integer division
p ideal_sentences
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
p ideal_sentences
puts ideal_sentences.join(". ")