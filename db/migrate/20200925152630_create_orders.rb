class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :address
      t.float :amount

      t.timestamps
    end
  end
end
