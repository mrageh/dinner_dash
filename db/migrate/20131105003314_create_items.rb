class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string       :name
      t.text         :description
      t.decimal      :price
      t.timestamps
      t.references   :category, index: true

      t.timestamps
    end
  end
end
