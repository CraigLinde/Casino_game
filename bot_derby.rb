  




  def get_horse_name

    first_arr = ["droopy", "romantic", "windy", "slappy", "crappy", "spastic", "lucky", "understood", "happy", "slap-happy", "underappreciated" ,"stumbling" ,"rabid" ,"funky", "plump", "musty", "groovy", "wet", "dusty", "scarlet", "wimpy", "jumpy", "whistling", "prancing", "dancing", "My favorite" ,"Mamma's favorite", "Evil", "Minor", "Imaginary", "lanky", "sleepy", "humble", "soupy", "tropical", "Painful", "Mary's", "Wally's", "Johnny's", "greasy", "supreme", "Bruised", "lumpy", "Margret's", "Mildrid's"]

    second_arr = ["tire",
      "lipstick","lipped","underwear","thunder","gravy","panic","rascal","captain","story","glory","cheddar","pocket","dutchman","belch","comedy","fig newton","hallucination","road apple","road kill","brisket","glue","holiday","delight","gamble","gristle","storm","bucket","bag","caramel","soup","sandwich","cheese",
      "science","hangover","mess","candy","clown","Tornado","fur","soul","wizard","princess","turnip","mud","onion","hammer","pumpkin","snickerdoodle","flapjack","post-it note","shenanigans","mothball","puddle","eyelash","cookie","gum wad","artificial sweetner","paperclip","monkey","igniter","gummy","boot","leather","glue stick","salad","salsa"]

      ar1count = first_arr.count
      ar2count = second_arr.count
      @f_name = first_arr[rand(ar1count)]
      @s_name = second_arr[rand(ar2count)]
      @l_name = @s_name
      until @l_name != @s_name do
        @l_name = second_arr[rand(ar2count)]
      end

      @horse_name = "#{@f_name} #{@s_name} #{@l_name}"

    end


    def get_odds
    end




    def win_bet
      bet_type = "Win"
      p line_up
      p "Pick your pony...who do you favor to win?"
      win = gets.chomp
      translate_selection(win)
      win = @selection
      get_wager
      


      puts (<<~HEREDOC)

      AND THEY'RE OFF!!!

      GO #{win}!!!!


      HEREDOC

      run_race

      if @first == win 
        wehaveawinner
        winamount = @wager.to_i * 10
        @Purse = @Purse.to_i + winamount
        p "You won #{winamount.to_s} dollars.  You now have #{@Purse.to_s}"  
      else
        wehavealoser
        @Purse = @Purse.to_i - @wager.to_i
        p "You lost #{@wager.to_s} dollars.  You now have #{@Purse.to_s}" 
      end

    end

    def place_bet
      bet_type = "Place"
      p line_up
      p "Pick your pony...who do you think might place?"
      place = gets.chomp
      translate_selection(place)
      place = @selection
      get_wager

      puts (<<~HEREDOC)

      AND THEY'RE OFF!!!

      GO #{place}!!!!


      HEREDOC


      run_race

      if @first == place || @second == place
        wehaveawinner
        winamount = @wager.to_i * 5
        @Purse = @Purse.to_i + winamount
        puts "You won #{winamount.to_s} dollars.  You now have #{@Purse.to_s}"  
      else
        wehavealoser
        @Purse = @Purse.to_i - @wager.to_i
        puts "You lost #{@wager.to_s} dollars.  You now have #{@Purse.to_s}" 
      end
      
    end




  def show_bet
    bet_type = "Show"
    p line_up
    p "Pick your pony...who do you feel will show?"
    show = gets.chomp
    translate_selection(show)
    show = @selection
    get_wager

    puts (<<~HEREDOC)

    AND THEY'RE OFF!!!

    GO #{show}!!!!


    HEREDOC

    run_race


    if @first == show || @second == show || @third == show
      wehaveawinner
      winamount = @wager.to_i * 3
      @Purse = @Purse.to_i + winamount.to_i
      p "You won #{winamount.to_s} dollars.  You now have #{@Purse.to_s}"  
    else
      wehavealoser
      @Purse = @Purse.to_i - @wager.to_i
      p "You lost #{@wager.to_s} dollars.  You now have #{@Purse.to_s}" 
    end

  end

  def tri_bet
    bet_type = "Trifecta"
    p line_up
    p "Pick your ponies...who will come in first?"
    win = gets.chomp
    translate_selection(win)
    win = @selection
    p "Who will come in second?"
    second = gets.chomp
    translate_selection(second)
    second = @selection
    p "Who will come in third?"
    third = gets.chomp
    translate_selection(third)
    third = @selection
    get_wager

    puts (<<~HEREDOC)

    AND THEY'RE OFF!!!

    GO #{win}!!!!
    GO #{second}!!!!
    GO #{third}!!!!


    HEREDOC



    run_race


    if @first == win && @second == second && @third == third
      wehaveawinner
      winamount = @wager.to_i * 100
      @Purse = @Purse.to_i + winamount.to_i
      p "You won #{winamount.to_s} dollars.  You now have #{@Purse.to_s}"  
    else
      wehavealoser
      @Purse = @Purse.to_i - @wager.to_i
      p "You lost #{@wager.to_s} dollars.  You now have #{@Purse.to_s}" 
    end

  end

  def exact_bet
    bet_type = "Exacta"
    p line_up
    p "Pick your ponies...who will come in first?"
    win = gets.chomp
    translate_selection(win)
    win = @selection
    p "Who will come in second?"
    second = gets.chomp
    translate_selection(second)
    second = @selection
    get_wager

    puts (<<~HEREDOC)

    AND THEY'RE OFF!!!

    GO #{win}!!!!
    GO #{second}!!!!


    HEREDOC

    run_race

    if @first == win && @second == second
      wehaveawinner
      winamount = @wager.to_i * 50
      @Purse = @Purse.to_i + winamount.to_i
      p "You won #{winamount.to_s} dollars.  You now have #{@Purse.to_s}"  
    else
      wehavealoser
      @Purse = @Purse.to_i - @wager.to_i
      p "You lost #{@wager.to_s} dollars.  You now have #{@Purse.to_s}" 
    end

  end


    def get_wager
      bet = "bad"
      until bet == "good"
        p "You have #{"$%.2f" % @Purse}. How much do you wish to wager?"
            @wager = gets.chomp
            @wager = @wager.to_i
          if @wager.to_i >  @Purse.to_i
            p "You don't have that much!!"
            bet = "bad"
          else
            bet = "good"
          end
      end
    end


def welcome
  puts (<<~HEREDOC)

██████╗  ██████╗ ████████╗████████╗███████╗ ██████╗  █████╗                 ██████╗ ███████╗██████╗ ██████╗ ██╗   ██╗
██╔══██╗██╔═══██╗╚══██╔══╝╚══██╔══╝██╔════╝██╔════╝ ██╔══██╗                ██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
██████╔╝██║   ██║   ██║      ██║   █████╗  ██║  ███╗███████║                ██║  ██║█████╗  ██████╔╝██████╔╝ ╚████╔╝ 
██╔══██╗██║   ██║   ██║      ██║   ██╔══╝  ██║   ██║██╔══██║                ██║  ██║██╔══╝  ██╔══██╗██╔══██╗  ╚██╔╝  
██████╔╝╚██████╔╝   ██║      ██║   ███████╗╚██████╔╝██║  ██║                ██████╔╝███████╗██║  ██║██████╔╝   ██║   
╚═════╝  ╚═════╝    ╚═╝      ╚═╝   ╚══════╝ ╚═════╝ ╚═╝  ╚═╝                ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝    ╚═╝   
      

HEREDOC

end


def wehaveawinner
  puts (<<~HEREDOC)

██╗   ██╗ ██████╗ ██╗   ██╗                ██╗    ██╗██╗███╗   ██╗
╚██╗ ██╔╝██╔═══██╗██║   ██║                ██║    ██║██║████╗  ██║
 ╚████╔╝ ██║   ██║██║   ██║                ██║ █╗ ██║██║██╔██╗ ██║
  ╚██╔╝  ██║   ██║██║   ██║                ██║███╗██║██║██║╚██╗██║
   ██║   ╚██████╔╝╚██████╔╝                ╚███╔███╔╝██║██║ ╚████║
   ╚═╝    ╚═════╝  ╚═════╝                  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝
                                                                                                                        

  HEREDOC
end

def wehavealoser
  puts (<<~HEREDOC)

██╗   ██╗ ██████╗ ██╗   ██╗            ██╗      ██████╗ ███████╗███████╗
╚██╗ ██╔╝██╔═══██╗██║   ██║            ██║     ██╔═══██╗██╔════╝██╔════╝
 ╚████╔╝ ██║   ██║██║   ██║            ██║     ██║   ██║███████╗█████╗  
  ╚██╔╝  ██║   ██║██║   ██║            ██║     ██║   ██║╚════██║██╔══╝  
   ██║   ╚██████╔╝╚██████╔╝            ███████╗╚██████╔╝███████║███████╗
   ╚═╝    ╚═════╝  ╚═════╝             ╚══════╝ ╚═════╝ ╚══════╝╚══════╝
                                                                                                                                  
 HEREDOC
end



def translate_placers (num)
  @hrs = @horse0 if num == 0  
  @hrs = @horse1 if num == 1 
  @hrs = @horse2 if num == 2 
  @hrs = @horse3 if num == 3 
  @hrs = @horse4 if num == 4 
  @hrs = @horse5 if num == 5 
  @hrs = @horse6 if num == 6
  @hrs = @horse7 if num == 7
  @hrs = @horse8 if num == 8
  @hrs = @horse9 if num == 9
end

def translate_selection (choice)
  @selection = @horse0 if choice == "1" 
  @selection = @horse1 if choice == "2"  
  @selection = @horse2 if choice == "3"  
  @selection = @horse3 if choice == "4"  
  @selection = @horse4 if choice == "5" 
  @selection = @horse5 if choice == "6"  
  @selection = @horse6 if choice == "7"
  @selection = @horse7 if choice == "8"
  @selection = @horse8 if choice == "9"
  @selection = @horse9 if choice == "10" 
end


def run_race
  @winners = [0,1,2,3,4,5,6,7,8,9].sort{ rand() - 0.5 }

  position = 0
  @winners.each do |i|
    position = position += 1
    translate_placers(i)
    @first = @hrs if position == 1
    @second = @hrs if position == 2 
    @third = @hrs if position == 3 
    @fourth = @hrs if position == 4 
    @fifth = @hrs if position == 5 
    @sixth = @hrs if position == 6 
    @seventh = @hrs if position == 7
    @eighth = @hrs if position == 8
    @ninth = @hrs if position == 9
    @tenth = @hrs if position == 10
  end
      p "AND THE WINNERS ARE (..in order of finish..)"
      p @first
      p @second
      p @third
      p @fourth
      p @fifth
      p @sixth
      p @seventh
      p @eighth
      p @ninth
      p @tenth
end


def race_types
  puts (<<~HEREDOC)
  Win Bet--- In a win bet you are betting which horse you think will win the race

  Place Bet --- In a place bet you are betting that your horse will come in either first or second.
  
  Show Bet --- In a show bet you are betting that your horse will come in either first or second or third.

  Exacta Bet --- In a exacta bet you are betting on two horses.  You must be able to pick which horse will come in first and which horse will come in second respectively.

  Trifecta Bet --- In a trifecta bet you are betting on three horses.  You must be able to pick which horse will come in first, which horse will come in second, and which horse will come in third respectively.



  HEREDOC
end

def line_up
  p "Gate 1 #{@horse0}" 
  p "Gate 2 #{@horse1}" 
  p "Gate 3 #{@horse2}" 
  p "Gate 4 #{@horse3}" 
  p "Gate 5 #{@horse4}" 
  p "Gate 6 #{@horse5}" 
  p "Gate 7 #{@horse6}" 
  p "Gate 8 #{@horse7}" 
  p "Gate 9 #{@horse8}" 
  p "Gate 10 #{@horse9}" 
  return "............."
end


def race_start
  gates = {}
  10.times do |i|
    get_horse_name
    instance_variable_set("@horse#{i}", String.new(@horse_name))
  end

  puts (<<~HEREDOC)
  The race is about to begin......What type of bet would you like to make?
    1 = Win Bet
    2 = Place Bet
    3 = Show Bet
    4 = Exacta Bet
    5 = Trifecta Bet
    6 = I don't know what any of these are?
    HEREDOC
  end

 
  @OriginalPurse = 200
  @Purse = 200
  # @Purse = "$%.2f" % 20

p "Welcome to the"
welcome

play = "y"
until play == "n"
  if @Purse == 0
    p "You are out of money"
    break
  end

  p "Would you like to bet on a race? (Y or N)"
  play = gets.chomp
  play = play.downcase
  break if play == "n"
  p race_start
  a = gets.chomp

  case a
  when "1"
    win_bet
  when "2"
    place_bet
  when "3"
    show_bet
  when "4"
    exact_bet
  when "5"
    tri_bet
  when "6"
    race_types
  else
    p "That is not a valid selection, please select the number of the number next to your choice."
    p race_start
  end
end

p "You started with #{@OriginalPurse} and you ended with #{@Purse}"
if @OriginalPurse.to_i > @Purse.to_i
  p "Go home, you are a terrible gambler"
else
  p "GREAT WORK treat yourself to a steak dinner!"
end



