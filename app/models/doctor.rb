class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :city
  belongs_to :speciality
end