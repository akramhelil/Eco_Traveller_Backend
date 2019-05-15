class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :traveller_id
      t.string :date
      t.string :name

      t.timestamps
    end
  end
end
