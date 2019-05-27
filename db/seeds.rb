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

usernames = ["WebKill", "lazy_coder", "Thanie", "Biskoto", "cannan", "tasermonkey", "ykimmate14", "NickNotChuck", "drea.s", "heathbarATL", "Clutch365", "strig", "MxGamma", "toby_miller", "pororo2", "zombiemaster", "Vysetron", "andersonhall", "Hoeke", "dickywinsome", "kmanisles", "Neilan", "beardgoggles", "jasonday", "BROLAK", "protect3f", "CurtisVorley", "alchemental", "dustinos", "R0land1199", "shelbyt2392", "johnstonbl01", "monkeydelaney", "dstrawyer28", "remaat", "Fuzzwah", "cocoluva3", "jocelyn_kerbourch", "Fabimier",  "raenerl", "derekduff", "Two Robots", "Shekinah", "beardgoggles3000", "cmr6117", "Scottyos", "trentellingsen", "mineral2", "conzar", "majohnny", "ChaosMoss", "MaxBodelier", "june881019", "Meeple", "lsteinwi", "hojoos", "Djoyner", "funhillgames", "KonradMikula", "EmilyWan", "tyclone", "de-games", "NaughtRobot", "flingram", "BradansWorld2015", "David Lancashire", "bearguy", "SandoSaito", "sunshinesan", "laian", "philryuh", "nathbot", "Wis", "Robertcompton", "Jcagno", "artome", "aganerral", "1nf1n1ty", "MogMadness", "tallon.simmons", "petersch", "elfosardo", "ThatJimGuy", "joidan", "MixedCompanyGames", "Nicole"]

def get_lists(username)
  begin
    retries ||= 0
    res = RestClient.get("https://www.boardgameatlas.com/api/lists?username=#{username}&pretty=true&client_id=#{Rails.application.credentials.dig(:bga_api_key)}")
    results = JSON.parse(res)
    return results['lists']
  rescue SocketError => e
    puts e
    sleep 60
    retry if (retries += 1 < 3)
  end
end

def get_games_from_list(list)
  res = RestClient.get("https://www.boardgameatlas.com/api/search?list_id=#{list['id']}&pretty=true&client_id=#{Rails.application.credentials.dig(:bga_api_key)}")
  results = JSON.parse(res)
  results['games']
end

def find_or_create_game(g)
  game = Game.find_by(bga_id: g['id'])
  unless game
    mechanic_ids = get_mechanics(g)
    game = Game.create(
      name: g['name'],
      min_players: g['min_players'],
      max_players: g['max_players'],
      min_playtime: g['min_playtime'],
      max_playtime: g['max_playtime'],
      description: g['description'],
      image_url: g['image_url'],
      bga_id: g['id'],
      mechanic_ids: mechanic_ids
    )
  end
  game
end

def get_mechanics(game)
  mechanic_ids = []
  game['mechanics'].each do |m|
    mechanic = Mechanic.find_by(bga_id: m['id'])
    mechanic_ids << mechanic['id']
  end
  mechanic_ids
end

def generate_user(username)
  lists = get_lists(username)
  unless lists.length == 0
    user = User.create(username: username, password: 'password')
    lists.each do |l|
      games = get_games_from_list(l)
      games.each do |g|
        game = find_or_create_game(g)
        begin
          user.games << game
        rescue => ex
          puts ex
        end
      end
    end
  end
end

generate_user(usernames[0])
