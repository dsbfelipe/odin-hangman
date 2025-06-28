class Game
  def select_word
    path = File.join(__dir__, '..', 'data', 'google-10000-english-no-swears.txt')
    words = File.readlines(path, chomp: true)
    words.select! { |word| word.length >= 5 && word.length <= 12 }
    words.sample
  end

  def guess_letter(letter) 
    if @word.include?(letter)
      @word.chars.each_with_index do | char, index |
        if char == letter
          @word_display[index] = letter
          @guesses << letter
        end
      end
    else 
      @attempts_left -= 1
      @guesses << letter unless @guesses.include?(letter)
    end
  end

  def end_game
    if @word_display == @word
      puts "Congratulations! You've guessed the word: #{@word}"
      @game_over = true
    end

    if @attempts_left <= 0
      puts "Game over! The word was: #{@word}"
      @game_over = true
    end
  end

  def play_game
    first_round = true

    while !@game_over
      if !first_round
        puts "Do you want to save the game? (yes/no)"
        save_choice = gets.chomp.downcase
        save_game(save_choice)
      end

      puts "you have #{@attempts_left} attempts left."
      puts "Guess the word! It has #{@word.length} letters."
      puts "#{@word_display}"
      puts "Wrong letters #{(@guesses - @word.chars).join(", ")}"
      puts "Enter a letter: "
      letter = gets.chomp.downcase
      if letter.length != 1 || !letter.match?(/[a-z]/)
        puts "Please enter a single letter."
      end
      guess_letter(letter)
      end_game()
      first_round = false
    end
  end

  def start_new_game
    @word = select_word
    @guesses = []
    @max_attempts = 5
    @attempts_left = @max_attempts
    @game_over = false
    @word_display = "_" * @word.length

    puts "Welcome to Hangman!"
    puts "The word has been selected. Good luck!"
    play_game
  end

  def save_game(yes_or_no)
    if yes_or_no.downcase == 'yes'
      path = File.join(__dir__, '..', 'data', 'saved_game.txt')
      File.open(path, 'w') do |file|
        file.puts @word
        file.puts @guesses.join(',')
        file.puts @attempts_left
        file.puts @word_display
      end
      puts "Game saved successfully."
    end
  end

  def load_game
    path = File.join(__dir__, '..', 'data', 'saved_game.txt')
    if File.exist?(path)
      File.open(path, 'r') do |file|
        @word = file.readline.chomp
        @guesses = file.readline.chomp.split(',')
        @attempts_left = file.readline.to_i
        @word_display = file.readline.chomp
        @game_over = false
        @first_round = false
      end
      puts "Game loaded successfully."
      play_game
    else
      puts "No saved game found."
    end
  end
end