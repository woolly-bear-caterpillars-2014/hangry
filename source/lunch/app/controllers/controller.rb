require 'launchy'
require_relative '../views/view'
require_relative '../../config/application'
require_relative '../models/cuisine'
require_relative '../models/restaurant'



class Controller
  attr_accessor :rest, :view, :input
  def initialize
    @view = View.new
    @input = ""
    @rest = ""
    run
  end

  def set_pick

  end

  def get_random_restaurant(zip)
    restaurants = Restaurant.where(zip: zip)
    self.rest = restaurants.sample

  end

  def run

    while true
      pick = get_random_restaurant(view.zip)
      view.display_pick(pick)
      input = view.get_input
      case input
      when "accept"
        Launchy.open(rest.url)
        break
      when "deny"
        redo
      when "exit"
        break
      else
        puts "That doesn't exist. Try again soon."
        break
      end
    end
  end




end

# class Restaurant
#   attr_reader :name, :cuisine, :address, :zip
#   def initialize(args = {})
#     @name = args[:name]
#     @cuisine = args[:cuisine]
#     @address = args[:address]
#     @zip = args[:zip]
#   end
# end

