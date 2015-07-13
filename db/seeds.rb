# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:                     'Tumri',
             email:           'tumri@live.com',
             password:              'tumri202',
             password_confirmation: 'tumri202',
             admin:                       true,
             activated:                   true,
             activated_at:       Time.zone.now)

User.create!(name:                    'Tester',
             email:         'tester@newzer.io',
             password:                'tester',
             password_confirmation:   'tester',
             admin:                      false,
             activated:                   true,
             activated_at:       Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "tester-#{n + 1}@faker.io"
  password = 'password'
  User.create!(name:                      name,
               email:                    email,
               password:              password,
               password_confirmation: password,
               activated:                 true,
               activated_at:     Time.zone.now)
end
