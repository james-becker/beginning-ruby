# analyzer.rb -- Text Analyzer
stopwords = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

# Count the characters
total_characters = text.length
total_chars_no_spaces = text.gsub(/\s+/, "").length

# Count the words, sentences, and paragraphs
total_words = text.split.length
total_sentences = text.split(/\.|\?|!/).length
total_paragraphs = text.split(/\n\n/).length


# Make a list of words in the text that aren't stop words,
# count them, and work out the percentage of non-stop words
# against all words
words = text.scan(/\w+/)
keywords = words.select {|word| !stopwords.include?(word)}
keyword_percentage = ((keywords.length.to_f / words.length.to_f) * 100).to_i

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third) # to compensate for rounding due to integer division
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_chars_no_spaces} characters without spaces"
puts "#{total_words} total words"
puts "#{total_sentences} total sentences"
puts "#{total_paragraphs} total paragraphs"
puts "#{total_sentences / total_paragraphs} sentences per paragraph (mean)"
puts "#{total_words / total_sentences} words per sentence (mean)"
puts "#{keyword_percentage} percent are keywords and #{100 - keyword_percentage} percent are stopwords"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"