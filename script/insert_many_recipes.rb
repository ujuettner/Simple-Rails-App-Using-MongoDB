#!/usr/bin/env ruby1.8

require File.expand_path('../../config/environment', __FILE__)

def get_name
  ['Chocolate Cake',
   'Pumpkin Pie',
   'Mashed Potatoes',
   'Strawberry Milkshake'].sample
end

def get_ingredients
  ingredients = []
  r = rand(20)
  (1..r).each do |x|
    ingredients << Ingredient.new(:amount => get_amount, :stuff => get_stuff)
  end
  ingredients
end

def get_stuff
  ['glass water', 'tablespoon vanilla', 'cup flour', 'stick butter'].sample 
end

def get_amount
  ['1', '1/2', '3', '4.5'].sample
end

(1..2000).each do |num|
  r = Recipe.new(:name => get_name + ' ' + num.to_s,
                 :ingredients => get_ingredients)
  puts r.inspect
  r.save
end