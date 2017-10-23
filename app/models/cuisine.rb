class Cuisine < ActiveRecord::Base
  has_many :restaurants

  def self.spin_wheel
    self.all.sample.name
  end
end
