class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.references :user, index: true, foreign_key: true
    end
  end
end
