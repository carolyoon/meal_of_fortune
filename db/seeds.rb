names = %w(American Italian Indian Korean Japanese Mexican Thai)
search_terms = %w(newamerican italian indpak korean japanese mexican thai)

names.each_with_index do |name, index|
  Cuisine.find_or_create_by(name: name, yelp_search_term: search_terms[index])
end

