require 'launchy'
require_relative '../views/view'

class Controller
  attr_reader :rest, :view
  def initialize
    @view = View.new
    @rest = [Restaurant.new(name: 'Chipotle', cuisine: 'mexican', address: 'somewhere', zip: '10001'),
             Restaurant.new(name: 'Chipotle2', cuisine: 'mexican2', address: 'somewhere2', zip: '10002'),
             Restaurant.new(name: 'Chipotle3', cuisine: 'mexican3', address: 'somewhere3', zip: '10003')]
    run
  end

  def run
    while true
      pick = get_random_restaurant(view.zip)
      view.display_pick(pick)
      input = view.get_input
      acceptable = true
      case input
      when "accept"
        # Launchy.open(pick.url)
        puts "Launchy makey"
        break
      when "deny"
        redo
      when "exit"
        break
      else
        # acceptable
        # "#{input}?? What's that. Look up!"

      end
    end
  end

  def get_random_restaurant(zip)
    # restaurants = Restaurant.where(zip: zip)
    # offset = rand(restaurants.count)
    # restaurants.first(:offset => offset)
    rest.sample
  end


end

class Restaurant
  attr_reader :name, :cuisine, :address, :zip
  def initialize(args = {})
    @name = args[:name]
    @cuisine = args[:cuisine]
    @address = args[:address]
    @zip = args[:zip]
  end
end

