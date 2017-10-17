class Restaurant < ActiveRecord::Base
  has_many :favorites
  beongs_to :cuisine 
end
