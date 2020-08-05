require 'pry'

def all_seasons(data)
  data.values.flatten
end  

def get_first_name_of_season_winner data, season
  winning_contestant = data[season].find do |contestant|
    contestant["status"] == "Winner"
  end
  winning_contestant["name"].split.first
end


def get_contestant_name(data, occupation)
  contestant_hash = all_seasons(data).find do |contestant|
    contestant["occupation"] == occupation
  end
  contestant_hash["name"]
end


def count_contestants_by_hometown(data, hometown)
  all_seasons(data).reduce(0) do |sum, contestant|
    if contestant["hometown"] == hometown
      sum + 1
    else 
      sum 
    end
  end
end  

def get_occupation(data, hometown)
  all_seasons(data).find do |contestant|
    contestant["hometown"] == hometown
  end["occupation"]
end

def get_average_age_for_season(data, season)
  age_sum = data[season].reduce(0) do |sum, contestant|
    sum + contestant["age"].to_i
  end
  (age_sum / data[season].length.to_f).round()  
end
