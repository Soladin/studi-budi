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
    # something about setting up the collection hash & file here
    @file = File.open("#{@collection_path}/#{collection_name}.rb", "r+")
    adding_cards
  end

  def load
    puts "Enter the name of your existing collection:"
    @collection_name = gets.chomp
    puts "Enter the file path of your existing collection (leave off the last \"/\"):"
    @collection_path = gets.chomp
    @file = File.open("#{@collection_path}/#{collection_name}.rb", "r+")
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
      reviewing_cards   # need to do same kind of thing as in initialize
    end
  end


  # so they're going to need to read the first line

  def adding_cards
    puts "Type the term you'd like to practice and its answer separated by a comma, then hit [enter]. This adds that 'card' to your collection. This will continue until BLAHBLAH To review your cards BLAHBLAHBLAH"
    set = gets.chomp.split(",")
    key = set[0]
    value = set[1]
    @file.write(key, "\n", value, "\n")

    # until set == "review"
      

    #   puts "Please enter '1' to create or '2' to load."
    #   action = gets.chomp
    # end
    # if set == "review"
    # end










    if gets.chomp == "review"
      reviewing_cards
    else
      gets.chomp.split(",")
    end
  # for key, value in the_gets do
  #   {} << key => value
  #   until gets == "end"
  end

  def reviewing_cards
    puts "Let's review some of your cards. To exit, simply hit [enter]."

    while gets.chomp != nil
      cards_correct = 0
      cards_wrong = 0

      puts current_card = HASHHH[rand]
      user_answer = gets.chomp
      if user_answer == HASHHH[current_card]
        puts "CORRECT"
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

start = StudiBudi.new
