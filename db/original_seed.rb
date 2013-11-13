

require 'bcrypt'
 
unencrypted_password = "password"
encrypted_password = BCrypt::Password.create(unencrypted_password)
 
user = User.create([{full_name: "Franklin Webber", display_name: "Franky", password: unencrypted_password, password_confirmation: unencrypted_password,   email: "demo+franklin@jumpstartlab.com" },
                    {full_name: "Jeff", display_name: "j3", password: unencrypted_password, password_confirmation: unencrypted_password, email: "demo+jeff@jumpstartlab.com"},
                    {full_name: "Katrina Owen", display_name: "kytrinyx", password: unencrypted_password, password_confirmation: unencrypted_password, email: "demo+katrina@jumpstartlab.com", admin_status: true }])
 
admin = User.create({full_name: "admin", display_name: "admin", password: unencrypted_password, password_confirmation: unencrypted_password,   email: "admin@example.com", admin_status: true })
 
require 'csv'
 
images = File.open "./app/assets/images"
 
contents = CSV.open "./db/db_seed.csv", headers: true, header_converters: :symbol
 
contents.each do |row|
 
  title       = row[:title]
  description = row[:description]
  price       = row[:price]
  category    = row[:category]
  image_file_name = row[:image_file_name]
 
  category_object = Category.find_or_create_by(title: category, type_of: 'main_menu')
  item = Item.create(title: title, description: description, price: price, image_file_name: image_file_name)
 
  ItemCategory.create(category_id: category_object.id, item_id: item.id)
end
category = Category.create(title: "House Special", type_of: 'main_menu')
 
ItemCategory.create([{ item_id: 9, category_id: category.id},
                      { item_id: 10, category_id: category.id},
                      { item_id: 16, category_id: category.id},
                      { item_id: 12, category_id: category.id},
                      { item_id: 38, category_id: category.id}])
 
Order.create([{ status: "pending"},
              { status: "pending"},
              { status: "in progress", user_id: 1},
              { status: "in progress", user_id: 2},
              { status: "paid", user_id: 3},
              { status: "paid", user_id: 1},
              { status: "completed", user_id: 2},
              { status: "completed", user_id: 3},
              { status: "cancelled", user_id: 1},
              { status: "cancelled", user_id: 2}])
 
OrderItem.create([{ item_id: 1, order_id: 1, quantity: 3},
                  { item_id: 16, order_id: 1},
                  { item_id: 24, order_id: 1, quantity: 2},
                  { item_id: 30, order_id: 2, quantity: 3},
                  { item_id: 16, order_id: 2},
                  { item_id: 12, order_id: 2, quantity: 2},
                  { item_id: 1, order_id: 3},
                  { item_id: 16, order_id: 3, quantity: 2},
                  { item_id: 17, order_id: 3, quantity: 3},
                  { item_id: 1, order_id: 4, quantity: 2},
                  { item_id: 16, order_id: 4, quantity: 2},
                  { item_id: 35, order_id: 4, quantity: 3},
                  { item_id: 2, order_id: 5, quantity: 2},
                  { item_id: 16, order_id: 5},
                  { item_id: 3, order_id: 6},
                  { item_id: 16, order_id: 6, quantity: 3},
                  { item_id: 30, order_id: 6, quantity: 3},
                  { item_id: 1, order_id: 7},
                  { item_id: 7, order_id: 8},
                  { item_id: 16, order_id: 9, quantity: 2},
                  { item_id: 4, order_id: 10, quantity: 5},
                  { item_id: 16, order_id: 10, quantity: 3},
                  { item_id: 31, order_id: 10, quantity: 7}])

