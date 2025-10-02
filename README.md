
Visualisation de la  DB

Table doctor {
  id integer [primary key]
  first_name string
  last_name string
  speciality string
  zip_code integer
  city_id intager
  speciality_id string
  created_at timestamp
}


Table patient {
  id integer [primary key]
  first_name string
  last_name varchar
  created_at timestamp
}

Table appointment {
  id integer [primary key]
 date datetime
 doctor_id intager
 patient_id intager
  created_at timestamp
}

Table city {
id integer [primary key]
zip_code string
  created_at timestamp
}

Table speciality {
id integer [primary key]
specialty string
  created_at timestamp
}


Ref appointments_doctor: appointment.doctor_id > doctor.id
Ref appointments_patient: appointment.patient_id > patient.id
Ref doctor_city: doctor.city_id > city.id
Ref doctor_speciality: doctor.speciality_id > speciality.id


rails new ****

# rails g model Doctor first_name:string last_name:string specialty:string zip_code:string

## rails g migration Doctor city_id:intager speciality_id:intager

# rails g model Patient first_name:string last_name:string age:integer 
## rails g migration Patient first_name:string last_name:string age:integer city_id:intager

# rails g model Appointment date:datetime doctor_id:integer patient_id:integer
## rails g migration Appointment date:datetime doctor_id:integer patient_id:integer city_id:intager

## rails g model city name:string

## rails g model speciality name:string 

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
end

class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end

class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
end

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


# GENRES = %w[action horreur comédie drame aventure science-fiction fantasy thriller policier romance biopic guerre western animation]

# 100.times do
# movie = AllMovie.create!(
#     name: Faker::Movie.title,
#     year: rand(1900..2020),
#     genre: GENRES.sample,
#     synopsis: Faker::Lorem.sentence(word_count: 12), # ≥ 10 mots
#     director: Faker::Name.name,
#     allocine_rating: (rand * 5).round(1),            # 0.0..5.0, 1 décimale
#     already_seen: false,
#     my_rating: nil
#   )
# end


recherche de liens

Patient.third.doctors
Doctor.third.patients
Doctor.find(296).patients