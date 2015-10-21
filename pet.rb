require 'active_support/all'

class Horse
  def initialize(name)
    @name = name
    @hunger = 10
    @happy = 100
    @dirty = 0
    @tired = 0
    @health = 100
    @current_time = Time.now.beginning_of_day
  end

  def spend_time(time = 1800)
    @current_time += time
  end

  def eat
    @hunger -= @hunger < 10 ? @hunger : 10
    @happy = @happy > 90 ? 100 : @happy + 10
  end

  def run
    @tired += 1
    @dirty += 1
  end

  def jog_trot
    @tired += 1
    @dirty += 1
  end

  def take_bath
    @dirty = 0
  end

  def sleep
    @tired = 0
  end

  def obstacle_race
    @tired += 1
    @dirty += 1
  end

  def put_saddle
    @dirty += 1
  end

  def observe
    puts('Your pet has died, go outside and play again') if health < 0
  end

  def help
    puts 'The list of possible commands ( type what pet have to do ):'
    puts '1. eat'
    puts '2. run'
    puts '3. jog_trot'
    puts '4. get_bath'
    puts '5. sleep'
    puts '6. ostacle_race'
    puts '7. put_saddle'
    puts '8. observe'
  end

  def info
    puts 'Some information about your pet:'
    puts 'Your #{@type} has name: #{@name}'
    puts 'Age: #{@age}'
    puts 'Happy: #{@happy}'
    puts 'Hungry: #{@hungry}'
    puts 'Sleep: #{@sleep}'
    puts 'Dirty: #{@dirty}'
    puts 'Tired: #{@tired}'
    puts 'Health: #{@health}'
  end

  private

  def start_day
    while @current_time > Time.now.end_of_day
      help

      action = gets.chomp
      send(action)

      spend_time
      info
    end
  end
end
Horse.new('')
