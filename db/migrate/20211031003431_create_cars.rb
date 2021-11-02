class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.decimal :initial_price, precision: 10, scale: 2
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
