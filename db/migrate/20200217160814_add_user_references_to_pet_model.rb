class AddUserReferencesToPetModel < ActiveRecord::Migration[6.0]
  def change
    add_reference :pet_models, :user, null: false, foreign_key: true
  end
end
