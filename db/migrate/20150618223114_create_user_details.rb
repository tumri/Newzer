class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.references :user, index: true, foreign_key: true
      t.date :dob
      t.text :location
      t.text :about

      t.timestamps null: false
    end
  end
end
