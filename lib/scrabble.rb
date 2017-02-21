class Scrabble

  def score(word)
    1
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score(word)
    numbers = word.chars.map do |letter|
      point_values[letter.capitalize]
    end
    numbers.reduce(:+)
  end

  def score_with_multipliers(word, multipliers, word_bonus=2) #word [1,2,1,1,1] #multipliers[2,2,1,1,1]
    numbers = word.chars.map.with_index {|letter, index| point_values[letter.capitalize] * multipliers[index]}
    numbers.reduce(:+) * word_bonus
  end
  # scrabble = Scrabble.new
  # scrabble.score_with_multipliers("hello", [1,2,3,2,1], 2) --given parameters for the code above

  def highest_scoring_word(words)
    sorted_words = words.sort_by { |word| word.length }

    possibles = sorted_words.group_by { |word| score(word) }.max[1]
    return possibles.find { |w| w.length == 7 } if possibles.any? { |word| word.length == 7}
    possibles.first
  end

  def another_eg_scoring_word(words)
    result = words.first
    words.each do |word|
      if word.length == 7
        result = word unless result.length == 7 && score(word)
      else
      end
    end
  end
end

game = Scrabble.new
puts game.score('hello')
puts game.score_with_multipliers("hello", [2,2,2,2,2])
puts game.score_with_multipliers("hello", [2,2,2,2,2], 2)
puts game.highest_scoring_word(['hello' 'sound', 'aardwolf'])
puts game.highest_scoring_word
