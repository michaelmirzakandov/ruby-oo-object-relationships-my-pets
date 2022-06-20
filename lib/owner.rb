require 'pry'

class Owner
  # code goes here

    attr_reader :name, :species, :cats, :dogs

    @@all = []

    def initialize(name)
      @name = name
      @species = "human"
      @cats = []
      @dogs = []
      @@all << self
    end

    def say_species
      "I am a #{self.species}."
    end

    def self.all
      @@all
    end

    def self.count
      @@all.size
    end

    def self.reset_all
      @@all = []
    end


    def cats
      Cat.all.each do |cat|
        if cat.owner == self && @cats.include?(cat) == false
            @cats << cat
        end
    end
    @cats
  end

  def dogs
    Dog.all.each do |dog|
      if dog.owner == self && @dogs.include?(dog) == false
        @dogs << dog
      end
    end
    @dogs
  end

  def buy_cat(cat)
    cat = Cat.new(cat) 
    cat.owner = self 
  end 

  def buy_dog(dog)
    dog = Dog.new(dog)
    dog.owner = self
  end 

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end 
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil 
    end 
    @cats = []
    @dogs = []
  end 

  def list_pets
    cat_count = self.cats.count
    dog_count = self.dogs.count
    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end 


end