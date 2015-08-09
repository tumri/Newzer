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

30.times do |n|
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

users = User.order(:id)

2.times do
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

    boolean = Faker::Number.between(0, 1)
    if boolean == 1
      approval = true
    else
      approval = false
    end

    user.articles.create!(title: title,
                          body: body,
                          category_id: category,
                          approved: approval)
  end
end

articles = Article.order(:id)

10.times do
  users.each do |user|
    body = Faker::Hacker.say_something_smart
    user_id = user.id
    article_id = Faker::Number.between(1, articles.count)
    user.comments.create!(body: body,
                          user_id: user_id,
                          article_id: article_id)
  end
end

# comments = Comment.order(:id)

# 50.times do
#   users.each do |user|
#     body = Faker::Hacker.say_something_smart
#     user_id = user.id
#     article_id = Faker::Number.between(1, articles.count)
#     parent_id = Faker::Number.between(1, comments.count)
#     user.comments.create!(body: body,
#                           user_id: user_id,
#                           article_id: article_id,
#                           parent_id: parent_id)
#   end
# end
