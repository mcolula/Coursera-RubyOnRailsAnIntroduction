class Recipe 
  
  include HTTParty
  
  key_value = ENV["FOOD2FORK_KEY"] || "e4c98f0576601eedb230ac82f3075f1d"
  hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || "www.food2fork.com"
  base_uri "http://#{hostport}/api"
  default_params key: key_value 
  format :json
  
  def self.for(term)
    get("/search", query: { q: term })["recipes"]
  end
  
end