# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(name:             'Editorial')
Category.create!(name:              'Politics')
Category.create!(name:               'Economy')
Category.create!(name:            'Technology')
Category.create!(name:               'Science')
Category.create!(name:                'Health')
Category.create!(name:             'Lifestyle')
Category.create!(name:         'Entertainment')
Category.create!(name:                 'Other')

User.create!(name:                     'Tumri',
             email:           'tumri@live.com',
             password:              'tumri202',
             password_confirmation: 'tumri202',
             admin:                       true,
             activated:                   true,
             activated_at:       Time.zone.now)

User.create!(name:                    'Siddhu',
             email:  'sixarmedfreak@gmail.com',
             password:                'tester',
             password_confirmation:   'tester',
             admin:                       true,
             activated:                   true,
             activated_at:       Time.zone.now)

User.create!(name:                    'Nicole',
             email:    'nickchance1@gmail.com',
             password:                'tester',
             password_confirmation:   'tester',
             admin:                      true,
             activated:                   true,
             activated_at:       Time.zone.now)

User.create!(name:              'Admin Tester',
             email:   'admin_tester@tumri.xyz',
             password:                'tester',
             password_confirmation:   'tester',
             admin:                       true,
             activated:                   true,
             activated_at:       Time.zone.now)

User.create!(name:               'User Tester',
             email:    'user_tester@tumri.xyz',
             password:                'tester',
             password_confirmation:   'tester',
             admin:                      false,
             activated:                   true,
             activated_at:       Time.zone.now)

50.times do |n|
  name  = Faker::Name.name
  email = "tester-#{n + 1}@tumri.xyz"
  password = 'password'
  User.create!(name:                      name,
               email:                    email,
               password:              password,
               password_confirmation: password,
               activated:                 true,
               activated_at:     Time.zone.now)
end

users = User.order(:id).take(1)
1.times do
  users.each do |user|
    title_0 = Faker::App.name
    title_1 = Faker::Hacker.adjective
    title_2 = Faker::Hacker.abbreviation
    title_3 = Faker::Hacker.ingverb
    title_4 = Faker::Hacker.noun
    title = "#{title_0}: #{title_1} #{title_2} #{title_3} #{title_4}"
    image = Faker::Avatar.image
    lorem = Faker::Lorem.paragraph(25)
    ipsum = Faker::Lorem.paragraph(25)
    body = "<img src='#{image}' class='center'>
           <div>
            <p> #{lorem}<p>
            <p> #{ipsum}<p>
           </div>"
    category = Faker::Number.between(1, 9)
    user.articles.create!(title: title,
                          body: body,
                          category_id: category)
  end
end

articles = Article.order(:id)
1.times do
  users.each do |user|
    user_id = user.id
    article_id = Faker::Number.between(1, articles.count)
    body = Faker::Hacker.say_something_smart
    user.comments.create!(body: body,
                          article_id: article_id,
                          user_id: user_id)
  end
end
