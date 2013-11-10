# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Location, location, location
brooklyn = Location.create(:city => 'Brooklyn', :state => 'NY')
saxapahaw = Location.create(:city => 'Saxapahaw', :state => 'NC')
boston = Location.create(:city => 'Boston', :state => 'MA')

#some users
u = User.create(
  :email        => 'superadmin@superadmin.com', 
  :password     => 'superadmin',
  :first_name   => 'Super',
  :last_name    => 'Admin',
  :about        => 'Im so super admin.  super',
  :location_id  => brooklyn.id
)
u.add_role :super_admin

u = User.create(
  :email        => 'theman@theman.com', 
  :password     => 'themantheman',
  :first_name   => 'The',
  :last_name    => 'Man',
  :about        => 'The Man.  nuff said.',
  :location_id  => saxapahaw.id
)
u.add_role :the_man

u = User.create(
  :email        => 'theworker@theworker.com', 
  :password     => 'theworker',
  :first_name   => 'The',
  :last_name    => 'Worker',
  :about        => 'I work for the man',
  :location_id  => boston.id
)
u.add_role :the_worker


