# Write your code here!

def game_hash
  game={
    :home=>{
      team_name:"Brooklyn Nets",
      colors:["Black", "White"],
      :players=>{"Alan Anderson" =>{number:0,shoe:16,points:22,rebounds:12,assists:12,steals:3,blocks:1,slam_dunks:1},
      "Reggie Evans" =>{number:30,shoe:14,points:12,rebounds:12,assists:12,steals:12,blocks:12,slam_dunks:7},
      "Brook Lopez" =>{number:11,shoe:17,points:17,rebounds:19,assists:10,steals:3,blocks:1,slam_dunks:15},
      "Mason Plumlee" =>{number:1,shoe:19,points:26,rebounds:12,assists:6,steals:3,blocks:8,slam_dunks:5},
      "Jason Terry" =>{number:31,shoe:15,points:19,rebounds:2,assists:2,steals:4,blocks:11,slam_dunks:1}
      }
    },
    :away=>{
      team_name:"Charlotte Hornets",
      colors:["Turquoise", "Purple"],
      :players=>{"Jeff Adrien" =>{number:4,shoe:18,points:10,rebounds:1,assists:1,steals:2,blocks:7,slam_dunks:2},
      "Bismak Biyombo" =>{number:0,shoe:16,points:12,rebounds:4,assists:7,steals:7,blocks:15,slam_dunks:10},
      "DeSagna Diop" =>{number:2,shoe:14,points:24,rebounds:12,assists:12,steals:4,blocks:5,slam_dunks:5},
      "Ben Gordon" =>{number:8,shoe:15,points:33,rebounds:3,assists:2,steals:1,blocks:1,slam_dunks:0},
      "Brendan Haywood" =>{number:33,shoe:15,points:6,rebounds:12,assists:12,steals:22,blocks:5,slam_dunks:12}
      }

    }

  }

end

def num_points_scored(player)
  scored= nil
  game_hash.each do |key, value|
    if game_hash[key][:players].include?(player)
      scored = game_hash[key][:players][player][:points]
    end
  end
  scored
end

def shoe_size(player)
  size= nil
  game_hash.each do |key, value|
    if game_hash[key][:players].include?(player)
      size = game_hash[key][:players][player][:shoe]
    end
  end
  size
end

def team_colors(team_name)
color= nil
  game_hash.each do |side,data|
      if game_hash[side][:team_name].include?(team_name)
        color = game_hash[side][:colors]
      end
    end

  color
end

def team_names
  names = []
  game_hash.select do |side,data|
  names << game_hash[side][:team_name]
end
  names
end

def player_numbers(team_name)
if game_hash[:home][:team_name] == team_name
  game_hash[:home][:players].collect do |key, value|
    value[:number]
end
  else
    game_hash[:away][:team_name] == team_name
      game_hash[:away][:players].collect do |key, value|
        value[:number]
    end
  end
end

def player_stats(player)
  if game_hash[:home][:players].include? (player)
    game_hash[:home][:players][player]

    else
       game_hash[:away][:players][player]
      end
end


def big_shoe_rebounds
shoe_size=[]
game_hash.collect do |team,team_data|
  team_data[:players].collect do |team_name,stats|
    shoe_size << stats[:shoe]
  end
end
shoe_size_updated= shoe_size.sort.reverse
game_hash.each do |team,team_data|
  game_hash[team][:players].each do |team_name,stats|
    if game_hash[team][:players][team_name][:shoe] == shoe_size_updated[0]
      return game_hash[team][:players][team_name][:rebounds]
    end
  end
end
end
