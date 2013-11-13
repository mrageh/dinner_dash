require 'csv'

class Seeder
  def initialize
    create_item
    create_categories
    create_users
  end

  # def create_items
  #   22.times do
  #     item = create_item
  #     puts "Creating Item #{item.name}"
  #   end
  # end

  # def items_name
  #   ['Bagel', 'French Dip', 'Cinnamon', 'Veggie Sandwich', 'Coffee', 'Tea', 'Orange Juice', 'Rolls', 'Eclaire', 'Croissant'].sample
  # end

  def create_item
    contents = CSV.open "./db/db_seed.csv", headers: true, header_converters: :symbol
 
    contents.each do |row|
 
    name        = row[:name]
    description = row[:description]
    price       = row[:price]
    category_id = row[:category_id]

    item = Item.create(category_id: category_id, name: name, description: description, price: price)
  end
    # item = Item.new
    # this_item = items_name
    # item.name = this_item
    # item.description = Faker::Lorem.sentence
    # item.price = Random.rand(10..100)
    # item.category_id = Random.rand(1..3)
    # item.save
    # item
  end

  def create_categories
    4.times do
      category = create_category
      puts "Creating Category #{category.name}"
    end
  end

  def categories_name
    ['Sandwiches', 'Beverages', 'Sides', 'Baked Goods']
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
