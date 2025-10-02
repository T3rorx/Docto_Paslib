class UpdateDoctor < ActiveRecord::Migration[8.0]
  def change
    # supprime la colone, quel table, quel colone, ce qu'elle contient
    remove_column :doctors, :zip_code, :string

    add_reference :doctors, :city, foreign_key: true 
    add_reference :doctors, :speciality, foreign_key: true 
  end
end
