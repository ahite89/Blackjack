require 'pry'
require_relative 'models/card'
require_relative 'models/deck'
require_relative 'models/hand'

deck = Deck.new
player = Hand.new("Player", deck)
dealer = Hand.new("Dealer", deck)


2.times do
  player.draw(deck.deal!)
  dealer.draw(deck.deal!)
end


puts player
puts "Player's hand score: #{player.hand_score}"
puts
puts "Dealer's first card is #{dealer.hand.first.value} of #{dealer.hand.first.suit}."



if player.bust?("Player")
  exit
end

until player.bust?("Dealer") || player.blackjack?("Player")
  puts
  if player.prompt == "stand"
    puts
    break
  end
  puts
end

puts dealer
puts "Dealer's hand score: #{dealer.hand_score}"


until dealer.bust?("Player") || dealer.blackjack?("Dealer")
  if dealer.hand_score < 17
    new_card = dealer.draw(deck.deal!).last
    puts "Dealer was dealt #{new_card.value} of #{new_card.suit}."
    puts
    puts "Dealer's hand score: #{dealer.hand_score}"
  elsif
    dealer.hand_score >= 17 && player.hand_score < dealer.hand_score
    puts
    puts "Dealer wins."
    break
  elsif
    dealer.hand_score >= 17 && player.hand_score > dealer.hand_score
    puts
    puts "Player wins."
    break
  elsif
    dealer.hand_score >= 17 && player.hand_score == dealer.hand_score
    puts
    puts "Push."
    break
  end
end
