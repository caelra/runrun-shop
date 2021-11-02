class CreateDealershipCars < ActiveRecord::Migration[6.1]
  def change
    create_table :dealership_cars do |t|
      t.references :dealership, null: false, foreign_key: true, index: true
      t.references :car, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
