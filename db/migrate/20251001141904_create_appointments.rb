class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
