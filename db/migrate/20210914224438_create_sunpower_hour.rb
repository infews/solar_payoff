class CreateSunpowerHour < ActiveRecord::Migration[6.1]
  def change
    create_table :sunpower_hours do |t|
      t.time :start
      t.integer :dWh # using dekawatt-hours to store integers
      t.timestamps
    end
  end
end
