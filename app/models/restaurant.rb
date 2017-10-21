class Restaurant < ActiveRecord::Base
  has_many :favorites
  belongs_to :cuisine

  
end
