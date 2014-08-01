require_relative '../../config/application'

class CreateCuisines <ActiveRecord::Migration
  def change
    create_table :cuisines do |cuisine|
      cuisine.string :name
      cuisine.timestamps
    end
  end
end