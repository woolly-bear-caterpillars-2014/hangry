class View
  attr_reader :cuisine, :zip
  def initialize
    @zip = ARGV.first
  end

  def display_restaurant(restaurant)
    puts "\tname: #{restaurant.name}"
    puts "\tcuisine: #{restaurant.cuisine.name}"
    puts "\taddress: #{restaurant.address}"
    puts "\tzip: #{restaurant.zip}"
  end

  def display_pick(restaurant)
    clear_screen!
    move_to_home!
    options
    display_8_empty_lines
    display_restaurant(restaurant)
    display_8_empty_lines
    # display_error_msg if controller.acceptable = false
  end

  def options
    puts "\taccept | deny | exit "
  end

  def display_8_empty_lines
    8.times do
      puts ""
    end
  end

  def get_input
    print "  > "
    $stdin.gets.chomp
  end

  def clear_screen!
    puts "\e[2J"
  end

  def move_to_home!
    puts "\e[H"
  end
end
