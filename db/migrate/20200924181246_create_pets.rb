class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :pet_type, default: 0
      t.string :slug, unique: true

      t.timestamps
    end
  end
end
