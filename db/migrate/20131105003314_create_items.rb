class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string       :name,        :null => false
      t.text         :description, :null => false
      t.decimal      :price
      # t.references   :category, index: true

      t.timestamps
    end
  end
end
