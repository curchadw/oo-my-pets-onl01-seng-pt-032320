require 'pry'

class Owner
  attr_reader :species, :name


  @@all = Array.new

  def initialize(name,species = 'human')
    @name= name
    @species = species
    @@all.push(self)

  end

  def say_species
   "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = Array.new
  end

  def cat
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dog
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(add_cat)
    new_cat = Cat.new(add_cat)
    @cat.push(new_cat)
    @cat
  end



   def buy_dog(add_dog)
    new_dog = Dog.new(add_dog)
    @dog.push(new_dog)
    @dog
  end

  def walk_dogs
    self.each{|dog| mood = 'happy'}
  end

  def feed_cats
    self.each{|cat| mood = 'happy'}
  end

end
