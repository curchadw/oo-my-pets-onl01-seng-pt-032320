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

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(add_cat)
    new_cat = Cat.new(add_cat,self)
    @@all.push(new_cat)
    @@all
  end



   def buy_dog(add_dog)
    new_dog = Dog.new(add_dog,self)
    @@all.push(new_dog)
    @@all
  end

  def walk_dogs
    binding.pry
    self.all.select do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    cats.mood = 'happy'
  end

end
