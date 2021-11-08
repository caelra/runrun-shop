class AddPriceColumnToDealershipCars < ActiveRecord::Migration[6.1]
  def change
    add_column :dealership_cars, :price, :decimal
  end
end
