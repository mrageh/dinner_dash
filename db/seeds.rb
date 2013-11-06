# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class Seeder
  def initialize
    create_items
  end

  def create_items
    10.times do
      item = create_item
      puts "Creating Item #{item.name}"
    end
  end

  def create_item
    item = Item.new
    item.name = Faker::Lorem.word
    item.description = Faker::Lorem.sentence
    item.price = Random.rand(10..100)
    item.save
    item
  end
end

Seeder.new
