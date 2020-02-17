class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.boolean :pedigree
      t.string :skill
      t.string :species
      t.boolean :status

      t.timestamps
    end
  end
end
