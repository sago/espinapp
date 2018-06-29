class ChangeOrderNumericFields < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :payment,  :decimal, default: 0.0
    change_column :orders, :total,    :decimal, default: 0.0
  end
end
