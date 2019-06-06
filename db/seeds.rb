# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def drop_base
	User.destroy_all
	Admin.destroy_all
	Formula.destroy_all
	#Contract.destroy_all
end

def create_users

	1.times do |variable|
		User.create(first_name: Faker::Name.first_name, 
			last_name: Faker::Name.last_name, 
			email: Faker::Internet.free_email,
			belt: "blanche",
			nationality: Faker::Nation.nationality,
			weight: Faker::Number.between(40, 150),
			phone: Faker::PhoneNumber.phone_number,
			age: Faker::Number.between(3, 70), 
			password: "blablabla")
		
	end

	User.create(first_name: "Jp", 
			last_name: "Magido", 
			email: "jpmagido@me.com",
			belt: "noire",
			nationality: "France",
			weight: 75,
			phone: "0686631554",
			age: 27, 
			password: "blablabla")
	puts "1 User crée"
	puts "Profil Jp crée"
end

def create_formula
	Formula.create(name: "GB1-1", price: 75)
	Formula.create(name: "GB1-2", price: 210)
	Formula.create(name: "GB1-3", price: 550)
	Formula.create(name: "GB2-1", price: 85)
	Formula.create(name: "GB2-2", price: 240)
	Formula.create(name: "GB2-3", price: 650)
	Formula.create(name: "GB3-1", price: 90)
	Formula.create(name: "GB3-2", price: 250)
	Formula.create(name: "GB3-3", price: 700)
	puts "Forfaits GB 1, 2 et 3 crées"
end

def create_admin

	Admin.create(first_name: "Gracie", 
			last_name: "Barra", 
			email: "admin@admin.com", 
			password: "administrateur")
	puts "1 Admin crée"
end

def perform
	drop_base
	create_users
	create_formula
	create_admin

end

perform







