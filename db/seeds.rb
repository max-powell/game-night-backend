# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def change_score(names, new_score)
  names.each do |n|
    m = Mechanic.find_by_name(n)
    m.update(agg_score: new_score)
  end
end

minus_two = 'Cooperative
Cooperative Play
D6 RPG
Role Playing
Social Deduction
Storytelling'

minus_one = 'Betting
Comodity Speculation
Deck Building
Deduction
Engine Building
Euro Game
Hand Management
Memory
Pattern Building
Pattern Recognition
Pick-up and Deliver
Pool Building
Press Your Luck
Resource Gathering
Route Building
Route/Network Building
Stock Holding
Teams
Partnerships
Tile Placement
Worker Placement'

plus_one = 'Asymmetric
Auction
Bluffing
Card Drafting
Drafting
Hidden Traitor
Player Elimination
Trick-taking'

plus_two = 'Area Control
Area Enclosure
Fighting
Player vs. Player
Rock-Paper-Scissors
Secret Unit Deployment
Hidden Movement
Take That
Voting
Wargame'

Mechanic.find_by_name('Party Game').update(agg_score: -3)
change_score(minus_two.split("\n"), -2)
change_score(minus_one.split("\n"), -1)
change_score(plus_one.split("\n"), 1)
change_score(plus_two.split("\n"), 2)
