require 'csv'

class Seeder

  def initialize
    create_item
    create_categories
  end

  def create_item
    contents = CSV.open "./db/db_seed.csv", headers: true, header_converters: :symbol
 
    contents.each do |row|
      name        = row[:name]
      description = row[:description]
      price       = row[:price]
      category_id = row[:category_id]

      item = Item.create(category_id: category_id, name: name, description: description, price: price)
    end
  end

  def create_categories
    categories_names.each do |category_name|
      Category.create(name: category_name)
    end
  end

   def categories_names
     ['Sandwiches', 'Beverages', 'Sides', 'Baked Goods']
   end
end

Seeder.new
