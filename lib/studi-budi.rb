class StudiBudi
  def initialize
    puts "Welcome to Studi Budi!
    Would you like to start a new flash card collection or
    load a previously saved collection?
    1. Create
    2. Load"
    action = gets.chomp

    until (action == "1" or action == "2")
      puts "Please enter '1' to create or '2' to load."
      action = gets.chomp
    end
    if action == "1"
      create
    elsif action == "2"
      load
    end
  end

            ##### could really just make one method for opening. don't need two for create/load
  # def opening(create_or_load)
  #   puts "Enter the name of your new collection:"
  #   @collection_name = gets.chomp
  #   puts "Enter the file path of your new collection (leave off the last \"/\"):"
  #   @collection_path = gets.chomp
  #   # something about setting up the collection hash & file here
  #   @file = File.open("#{@collection_path}/#{collection_name}.rb", "r+")
  #   adding_cards

  def create
    puts "Enter the name of your new collection:"
    @collection_name = gets.chomp
    puts "Enter the file path of your new collection (leave off the last \"/\"):"
    @collection_path = gets.chomp
    @file = File.open("#{@collection_path}/#{@collection_name}.txt", "w+")
    adding_cards
  end

  def load
    puts "Enter the name of your existing collection:"
    @collection_name = gets.chomp
    puts "Enter the file path of your existing collection (leave off the last \"/\"):"
    @collection_path = gets.chomp
    @file = File.open("#{@collection_path}/#{@collection_name}.txt", "a+")
    @readlines_set = @file.readlines
    menu
  end

  def menu
    puts "'#{@collection_name}' Collection Menu
    Would you like to add cards to this collection or review cards already in this collection?
    1. Add cards
    2. Review cards"
    pref = gets.chomp
    if pref == "1"
      adding_cards
    elsif pref == "2"
      reviewing_cards
    end
  end

  def adding_cards
    puts "Type the term you'd like to practice and its answer separated by a comma, then hit [enter]. This adds that 'card' to your collection. This will continue until BLAHBLAH To review your cards BLAHBLAHBLAH"
    answer = gets.chomp

    until answer == "review"
      set = answer.split(",")
      key = set[0]
      value = set[1]
      @file.write(key)
      @file.write("\n")
      @file.write(value)
      @file.write("\n")
      puts "Type the next term & answer:"
      answer = gets.chomp
    end
    if answer == "review"
      reviewing_cards
    end
  end

  def reviewing_cards
    prompt = "Back: "
    cards_correct = 0
    cards_wrong = 0
    puts "Let's review some of your cards. How many incorrect answers to you want to enter before quitting because you failed?"
    stop_at = gets.chomp.to_i
    puts "Okay, we'll stop after #{stop_at} wrong answers."

    total_lines = (@readlines_set.size - 1)
    random_line = rand(0..total_lines)
    answer_line = random_line + 1

    while cards_wrong < stop_at
      random_line = rand(0..total_lines)
      until random_line % 2 == 0
        random_line = rand(0..total_lines)
      end
      answer_line = random_line + 1
      puts "What's on the back of this card?"
      puts @readlines_set[random_line]
      user_answer = gets.chomp
      if user_answer == @readlines_set[answer_line].chomp
        puts "CORRECT\n"
        cards_correct += 1
      else
        puts "WRONG"
        cards_wrong += 1
      end
    end

    puts "You got #{cards_correct} flash cards correct. Good job!
    Pst! You also got #{cards_wrong} flash cards wrong."
  end
end