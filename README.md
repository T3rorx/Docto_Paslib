**Docto Paslib**
- Rails 8 training app that models doctors, patients, and appointments across French cities with speciality assignments.
- Built from a vanilla `rails new` setup; relies on ActiveRecord associations and Faker-generated seed data.

**Requirements**
- Ruby and Bundler compatible with the Rails version in `Gemfile`.
- PostgreSQL or SQLite depending on your local `config/database.yml` (default is SQLite for dev/test).

**Getting Started**
- `bundle install` to fetch gems.
- `bin/rails db:create db:migrate` to prepare the database.
- `bin/rails db:seed` to populate baseline cities, specialities, doctors, patients, and appointments.

**Domain Model**
- `Doctor` belongs to a `City` and a `Speciality`; has many `Appointments` and through them many `Patients`.
- `Patient` has many `Appointments` and many `Doctors` through appointments.
- `Appointment` joins a doctor and a patient on a scheduled `date`.
- `City` hosts many doctors.
- `Speciality` is linked to doctors; every seed speciality receives at least one doctor.

**Database Snapshot**
- `doctors`: `first_name`, `last_name`, foreign keys `city_id`, `speciality_id`, timestamps.
- `patients`: `first_name`, `last_name`, `age`, timestamps.
- `appointments`: `date`, `doctor_id`, `patient_id`, timestamps.
- `cities`: `name`, timestamps.
- `specialities`: `name`, timestamps.

**Seeding Details**
- Seeds clear the tables in dependency order and recreate reference data first.
- Ten French cities and six medical specialities are added before creating doctors.
- 25 patients, at least one doctor per speciality, and 40 appointments are generated via Faker for realistic data.
- Re-run `bin/rails db:seed` anytime to refresh demo data.

**Rails Console Tips**
- `Doctor.first.patients` lists patients seen by the first doctor.
- `Patient.find_by(first_name: "Alice").appointments` returns Alice's visits.
- `City.find_by(name: "Paris").doctors.pluck(:last_name)` shows Paris-based doctors.

**Project Scripts**
- `bin/rails server` launches the web app at `http://localhost:3000`.
- `bin/rails routes` inspects available endpoints once controllers are added.
- Run tests with `bin/rails test` (none included yet).

Happy coding!
