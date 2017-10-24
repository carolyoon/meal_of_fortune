names = %w(American Chinese Italian Indian Korean Japanese Mexican Middle-Eastern Thai)
search_terms = %w(newamerican chinese italian indpak korean japanese mexican mideastern thai)

names.each_with_index do |name, index|
  Cuisine.find_or_create_by(name: name, yelp_search_term: search_terms[index])
end

