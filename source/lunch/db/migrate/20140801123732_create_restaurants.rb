require_relative '../../config/application'

class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |restaurant|
      restaurant.belongs_to :cuisine
      restaurant.string :name
      restaurant.string :address
      restaurant.string :zip
      restaurant.string :yelp_rating
      restaurant.string :description
      restaurant.string :neighborhood
      restaurant.string :url
      restaurant.timestamps
    end
  end
end