get '/' do 
  p results = YelpAdapter.search("chinese", "San Francisco")[0]

end 