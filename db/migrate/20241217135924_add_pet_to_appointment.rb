class AddPetToAppointment < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :pet, null: false, foreign_key: true
  end
end
