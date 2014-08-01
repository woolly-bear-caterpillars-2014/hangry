require_relative '../../config/application'

class Cuisine < ActiveRecord::Base
  has_many :restaurants
end