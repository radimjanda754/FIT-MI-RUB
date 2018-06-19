#!/usr/bin/env ruby

# @TODO: define class Duck with constructor
# that takes as parameters `name` and `age` of
# the duck

class Duck
  @@total_quacks = 0
  def initialize(name, age)
    @duck_name = name
    @duck_age = age
    @duck_flying = false
    @duck_swimming = false
    @duck_quack = 0
  end

  def name
    @duck_name
  end

  def age
    @duck_age
  end

  def can_fly
    !@duck_swimming
  end

  def self.can_fly
    true
  end

  def can_swim
    !@duck_flying
  end

  def self.can_swim
    true
  end

  def self.num_quacks
    @@total_quacks
  end

  def num_quacks
    @duck_quack
  end

  def flying?
    @duck_flying
  end

  def swimming?
    @duck_swimming
  end

  def flying=(fly)
    if fly
      @duck_flying = true
      @duck_swimming = false
    else
      @duck_flying = false
    end
  end

  def swimming=(swim)
    if swim
      @duck_swimming = true
      @duck_flying = false
    else
      @duck_swimming = false
    end
  end

  def quack
    @duck_quack += 2
    @@total_quacks += 2
    'quack quack'
  end

  def compare(snake_case)
    secondage = snake_case.instance_eval { age }
    if @duck_age < secondage
      -1
    else
      if @duck_age > secondage
        1
      else
        0
      end
    end
  end

  def fly!
    self.flying = true
  end

  private :age
end
