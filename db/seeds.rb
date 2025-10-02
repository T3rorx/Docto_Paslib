require "faker"

puts "Cleaning database..."
Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all
Speciality.destroy_all
City.destroy_all

puts "Creating cities..."
city_names = %w[Paris Lyon Marseille Toulouse Bordeaux Nantes Lille Nice Rennes Strasbourg]
cities = city_names.map { |name| City.create!(name: name) }

puts "Creating specialities..."
speciality_names = [
  "Medecine generale",
  "Cardiologie",
  "Dermatologie",
  "Pediatrie",
  "Ophtalmologie",
  "Neurologie"
]
specialities = speciality_names.map { |name| Speciality.create!(name: name) }

puts "Creating patients..."
patients = Array.new(25) do
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    age:        rand(1..95)
  )
end

puts "Creating doctors..."
doctors = []

# Ensure each speciality has at least one doctor associated
specialities.each do |speciality|
  doctors << Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    speciality: speciality,
    city:       cities.sample
  )
end

# Add a few more doctors with random combinations for variety
8.times do
  doctors << Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    speciality: specialities.sample,
    city:       cities.sample
  )
end

puts "Creating appointments..."
40.times do
  doctor = doctors.sample
  patient = patients.sample

  Appointment.create!(
    date:    Faker::Time.between(from: Time.current, to: 45.days.from_now),
    doctor:  doctor,
    patient: patient
  )
end

puts "Seeding completed!"
