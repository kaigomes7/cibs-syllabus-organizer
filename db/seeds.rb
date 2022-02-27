# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TamuDepartment.create(tamu_department_name: "FINC")

University.create(university_name: "Monster's University", country: "Moon")

Student.create(student_email: "js@js.com", student_name: "jon smith", tamu_department: 1)