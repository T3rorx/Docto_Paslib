# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require "faker"

specialties = %w[ophtalmo generale kine cardiologie angiologie]

# 10 patients
10.times do
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    age: rand(10..80)
  )
end

# 10 doctors
10.times do
  Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    specialty:  specialties.sample,
    zip_code:   Faker::Address.zip_code
  )
end

# 30 appointments
30.times do
  Appointment.create!(
    date:       Faker::Time.between(from: Time.now, to: 30.days.from_now),
    doctor_id:  rand(1..10),
    patient_id: rand(1..10)
  )
end