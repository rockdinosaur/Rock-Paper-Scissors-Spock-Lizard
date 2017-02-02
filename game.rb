VALID_CHOICES = %w(rock paper scissors spock lizard) # an array of strings

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

def return_choice(choice)
  case choice
  when "r"
    "rock"
  when "p"
    "paper"
  when "s"
    "scissors"
  when "sp"
    "spock"
  when "l"
    "lizard"
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
      prompt("'r' rock, 'p' paper, 's' scissors, 'sp' spock, 'l' lizard")
      choice = gets.chomp.downcase

      if VALID_CHOICES.include?(return_choice(choice))
        break
      else
        prompt("That's not a valid choice")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You: #{return_choice(choice)}; Computer: #{computer_choice}")

    display_results(return_choice(choice), computer_choice)

    player_score += player_score(return_choice(choice), computer_choice)
    computer_score += computer_score(return_choice(choice), computer_choice)
    prompt("Player score: #{player_score}")
    prompt("Computer score: #{computer_score}")

    break if player_score >= 5 || computer_score >= 5
  end

  player_score = 0
  computer_score = 0
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.casecmp("yes").zero? || answer.casecmp("y").zero?
end

prompt("Thanks for playing! Bye!")
