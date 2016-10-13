# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create({name: :admin})
Role.create({name: :manager})
Role.create({name: :sale_user})
@company = Company.create({title: "Kickstoro", activated: true})
@user = User.create({company_id: @company.id, email: "admin@tracksu.com",password: 'zxcvb123',name: 'Admin'})
@user.add_role :admin