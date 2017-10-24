class Cuisine < ActiveRecord::Base
  has_many :restaurants

  def self.spin_wheel(degrees)
    index = (degrees / 17).floor % 7
    return self.all[index].name
  end
end
