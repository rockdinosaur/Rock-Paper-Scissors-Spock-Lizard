VALID_CHOICES = %w(rock paper scissors spock lizard) # an array of strings

def test_method
  prompt("test message")
end

# game logic
def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lost!")
  else
    prompt("It's a tie!")
  end
end

def player_score(player, computer)
  if win?(player, computer)
    1
  else
    0
  end
end

def computer_score(player, computer)
  if win?(computer, player)
    1
  else
    0
  end
end

def prompt(message)
  puts "=> #{message}"
end

# initialize player scores and choice
player_score = 0
computer_score = 0
choice = ''

loop do
  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("Type 'r' for rock, 'p' for paper, 's' for scissors, 'sp' for spock, and 'l' for lizard")
      choice = gets.chomp.downcase

      case choice
      when "r"
        choice = "rock"
      when "p"
        choice = "paper"
      when "s"
        choice = "scissors"
      when "sp"
        choice = "spock"
      when "l"
        choice = "lizard"
      end

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    player_score += player_score(choice, computer_choice)
    computer_score += computer_score(choice, computer_choice)
    prompt("Player score: #{player_score}")
    prompt("Computer score: #{computer_score}")

    if player_score >= 5 || computer_score >= 5
      break
    end
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing! Bye!")
