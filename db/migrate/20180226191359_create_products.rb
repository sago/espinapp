class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price_unit
      t.string :type

      t.timestamps
    end
  end
end
