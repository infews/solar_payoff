class CreatePgeHour < ActiveRecord::Migration[6.1]
  def change
    create_table :pge_hours do |t|
      t.time :start
      t.integer :dWh # using dekawatt-hours to store integers
      t.integer :cost # using pennies to store integergs
      t.timestamps
    end
  end
end
