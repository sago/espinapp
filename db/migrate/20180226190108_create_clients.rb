class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :full_name
      t.string :business
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
