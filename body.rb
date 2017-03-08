
def cls
  system('cls')
end
def s
  sleep 2
end
def scls

  s
  cls

end
def clss
  cls
  s
end
def get_i
  return gets.to_i
end
def get_c
  return gets.chomp

end
def gets_s
  return gets.to_s
end

def info(text, x)

  i = 0
  while i < text.length

    print text[i]
    sleep x
    i+= 1


  end
  puts
end

def pinfo(text, x)
  i = 0
  while i < text.length

    print text[i]
    sleep x
    i+= 1


  end

end
def welcome
  cls

  info("Welcome to Hangman", 0.05)
  puts ""
  scls


end
def desriptions

  info("You have to choose the correct letters in a word to win", 0.05)
  s
  info("you have 10 tries, good luck", 0.05)
  s
  scls
  info("Begin!",0.05)
  scls
end


def random_word
  i = 0
  m = @word_list.length - 1

  x = rand(i..m)

  return @word_list[x]

end
def correct_word_example

  i = 0

  @len = @correct_word.length

  list_example = []

  while i < @len

    list_example << "_"
    i += 1
  end

  return list_example

end


def initz
  @word_list = ["one", "two", "three","four","five","six","seven","eight","nine","ten","eleven","twelve","welcome", "goodbye","greetings", "how", "why", "not", "helicopter", "boat", "letter",
     "triangle", "vortex", "town", "bucket", "house", "list", "mugged", "grammar", "words", "output", "if", "same", "someone", "renting", "bills", "taxes", "texas", "corn", "pump", "put",
     "delete", "choose", "pick", "lost", "won", "great", "future", "further", "atom", "tries", "body", "strength", "power", "test", "call", "bussnies", "sorting"]

  @minus_tries = true
  @correct_word = random_word.downcase

  @correct_example = correct_word_example

  @guessed_word = 0

  @wrong_list = []

  @false = false

  @all_used_words = []

  @tries = 10




end

def check_word

  i = 0
  x = false
  while i < @correct_word.length

    if @guessed_word == @correct_word[i]
      @correct_example[i] = @guessed_word
      x = true
    else

    end


    i += 1


  end

  @all_used_words << @guessed_word

  if x != true

    @wrong_list << @guessed_word

  end



end

def win

  info("you won, The correct word was: #{@correct_word}", 0.05)
  s
  scls
  r = true
  puts ""


  while r
    info("do you want to play again (Y/N)",0.05)
    puts ""

    print ":: "
    x = get_c

    if yes(x)
      game
    end
    if no(x)
      exit
    end
    scls
  end
end

def fix_word

  i = 0

  while i < @all_used_words.length

    if @all_used_words[i] == @guessed_word
      @false = true
      return
    end

    i += 1

  end




end

def check_if_integer

  temp = @guessed_word.to_i

  if temp > 0
    @false = true
    return
  end

end

def win?




  i = 0
  count = 0
  while i < @correct_example.length

    if @correct_example[i] == "_"
      count += 1


    end

    i += 1


  end

  if count == 0
    win
  end
end

def whole_word

  if @guessed_word == @correct_word

    i = 0

    while i < @correct_word.length
      @correct_example[i] = @guessed_word[i]

      i += 1
    end



  end

end

def control_word
  puts ""
  puts "Your choice (#{@guessed_word})"

  win?


  check_if_integer

  if @false == true
    @false = false
    @minus_tries = false
    return

  end


  fix_word


  if @false == true
    @false = false
    return

  end

  check_word


end

def check_tries
  if @tries == 0
    return true
  else
    puts "you have #{@tries} tries left."
    puts ""
  end
end

def yes(x)


  if x == "Yes" || x == "yes" || x == "YES" || x == "y" || x == "Y"
    return true
  end
end

def no(x)

  if x == "No" || x == "NO" || x == "n" || x == "N" || x == "no"
    return true
  end

end

def loose
  s
  scls
  pinfo("you lost, The correct word was: ", 0.05)
  s
  info(@correct_word, 0.05)
  r = true
  puts ""


  while r
    info("do you want to play again (Y/N)", 0.05)
    puts ""
    print ":: "
    x = get_c

    if yes(x)
      game
    end
    if no(x)
      exit
    end
    scls
  end
end

def body

  x = true

  while x
    scls
    whole_word
    puts ""
    puts "words length (#{@len})"
    puts ""
    print @correct_example
    puts ""
    puts ""
    print "incorrect words #{@wrong_list}"
    puts ""
    puts ""
    win?
    if check_tries
      loose
    end
    print ":: "

    sleep 2


    win?

    @guessed_word = get_c.downcase





    win?


    control_word


    if @minus_tries
      @tries -= 1
    end
    @minus_tries = true





  end


end

def game
  initz
  body
end
