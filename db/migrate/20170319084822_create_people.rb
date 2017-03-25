class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_name, null: false, index: true
      t.string :middle_name
      t.string :last_name, null: false, index: true
      t.date :date_of_birth, null: false
      t.string :email, null: false

      t.timestamps
    end

    add_index :people, :email, unique: true
  end
end
