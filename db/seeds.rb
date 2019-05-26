# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# For mechanics
# def change_score(names, new_score)
#   names.each do |n|
#     m = Mechanic.find_by_name(n)
#     m.update(agg_score: new_score)
#   end
# end
#
# minus_two = 'Cooperative
# Cooperative Play
# D6 RPG
# Role Playing
# Social Deduction
# Storytelling'
#
# minus_one = 'Betting
# Comodity Speculation
# Deck Building
# Deduction
# Engine Building
# Euro Game
# Hand Management
# Memory
# Pattern Building
# Pattern Recognition
# Pick-up and Deliver
# Pool Building
# Press Your Luck
# Resource Gathering
# Route Building
# Route/Network Building
# Stock Holding
# Teams
# Partnerships
# Tile Placement
# Worker Placement'
#
# plus_one = 'Asymmetric
# Auction
# Bluffing
# Card Drafting
# Drafting
# Hidden Traitor
# Player Elimination
# Trick-taking'
#
# plus_two = 'Area Control
# Area Enclosure
# Fighting
# Player vs. Player
# Rock-Paper-Scissors
# Secret Unit Deployment
# Hidden Movement
# Take That
# Voting
# Wargame'
#
# # Mechanic.find_by_name('Party Game').update(agg_score: -3)
# # change_score(minus_two.split("\n"), -2)
# # change_score(minus_one.split("\n"), -1)
# # change_score(plus_one.split("\n"), 1)
# change_score(plus_two.split("\n"), 2)

# Seed users
# require 'open-uri'
#
# doc = Nokogiri::HTML(open('https://www.boardgameatlas.com/users'))
#
# def get_usernames (doc)
#   doc.css('h4').each {|n| usernames << n.content}
# end

usernames = ["Ultrascorpion", "WabiSabi3", "cysi4k", "Burning Skull1", "corbinmontego", "charlesj", "Matmanmoos", "Sasquatch101", "cixelyn2", "battlegame", "hachidan", "Mikey23", "Fizberry144", "WebKill", "lazy_coder", "Thanie30", "Biskoto1", "cannan", "tasermonkey", "ykimmate14", "NickNotChuck", "drea.s3", "heathbarATL191", "Clutch365", "strig", "MxGamma82", "toby_miller", "pororo2134", "zombiemaster", "Vysetron240", "marinero_mfp", "andersonhall", "Hoeke", "dickywinsome", "kmanisles7", "Neilan141", "beardgoggles", "jasonday5626", "BROLAK16", "protect3f", "CurtisVorley", "alchemental", "dustinos", "R0land1199231", "shelbyt23921", "johnstonbl01", "monkeydelaney", "dstrawyer28", "remaat98", "Fuzzwah2", "cocoluva3", "jocelyn_kerbourch", "Fabimier22",  "raenerl46", "derekduff37", "Two Robots7", "Shekinah53", "beardgoggles300034", "cmr6117", "Scottyos", "trentellingsen19,980", "mineral245", "conzar4", "majohnny67", "ChaosMoss125", "MaxBodelier32", "june881019", "Meeple2", "lsteinwi", "hojoos1", "Djoyner2", "funhillgames1", "KonradMikula", "EmilyWan", "tyclone3", "de-games2", "NaughtRobot43", "flingram1", "BradansWorld201528", "David Lancashire3", "bearguy3", "SandoSaito8", "sunshinesan19", "laian21", "philryuh444", "nathbot", "Wis274", "Robertcompton490", "Jcagno", "artome", "aganerral6", "1nf1n1ty696", "MogMadness", "tallon.simmons117", "petersch", "elfosardo", "ThatJimGuy", "joidan", "MixedCompanyGames2", "Nicole7"]

def get_lists(username)
  res = RestClient.get("https://www.boardgameatlas.com/api/lists?username=#{username}&pretty=true&client_id=#{Rails.application.credentials.dig(:bga_api_key)}")
  results = JSON.parse(res)
  results['lists']
end

def get_games_from_list(list)
  res = RestClient.get("https://www.boardgameatlas.com/api/search?list_id=#{list['id']}&pretty=true&client_id=#{Rails.application.credentials.dig(:bga_api_key)}")
  results = JSON.parse(res)
  results['games']
end

def generate_user(username)
  lists = get_lists(username)
  unless lists.length == 0
    user = User.create(username: username)
    lists.each do |l|
      games = get_games_from_list(l)
      games.each do |g|
        game = Game.where(
          bga_id: game_params[:bga_id]
        ).first_or_create(
          name: game['name'],
          min_players: game['min_players'],
          max_players: game['max_players'],
          min_playtime: game['min_playtime'],
          max_playtime: game['max_playtime'],
          description: game['description'],
          image_url: game['image_url'],
          bga_id: game['id']
        )
      end
    end
  end
end
