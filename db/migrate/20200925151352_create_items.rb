class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end
