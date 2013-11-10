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
    create_categories
    create_users
  end

  def create_items
    15.times do
      item = create_item
      puts "Creating Item #{item.name}"
    end
  end

  def items_name
    ['Bagel', 'French Dip', 'Cinnamon', 'Veggie Sandwich', 'Coffee', 'Tea', 'Orange Juice', 'Rolls', 'Eclaire', 'Croissant'].sample
  end

  def create_item
    item = Item.new
    this_item = items_name
    item.name = this_item
    item.description = Faker::Lorem.sentence
    item.price = Random.rand(10..100)
    item.category_id = Random.rand(1..3)
    item.save
    item
  end

  def create_categories
    3.times do
      category = create_category
      puts "Creating Category #{category.name}"
    end
  end

  def categories_name
    ['Beverages', 'Baked Goods', 'Sides', 'Sandwiches'].sample
  end

  def create_category
    category = Category.new
    this_category = categories_name
    category.name = this_category
    category.save
    category
  end

  def users_name
    ['John', 'Luke', 'Master Chief', 'Louisa', 'Elaine', 'Adam']
  end

  def create_user(name)
    user = User.new
    this_user = name
    user.name = this_user
    user.user_name = this_user
    user.email = "#{this_user}@example.com"
    user.password = 'password'
    user.password_confirmation = 'password'
    user.save!
    user
  end

  def create_users
    users_name.each do |name|
      user = create_user(name)
      puts "Created User #{user.email}"
    end
  end

end

Seeder.new
