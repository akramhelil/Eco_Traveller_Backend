class CreateTravellers < ActiveRecord::Migration[5.2]
  def change
    create_table :travellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.string :profile_photo
      t.string :email
      t.string :about

      t.timestamps
    end
  end
end
