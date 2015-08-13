# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Category Seeds
Category.create!(name:               'Opinion')
Category.create!(name:              'Politics')
Category.create!(name:               'Economy')
Category.create!(name:            'Technology')
Category.create!(name:               'Science')
Category.create!(name:                'Health')
Category.create!(name:             'Lifestyle')
Category.create!(name:         'Entertainment')
Category.create!(name:                 'Other')

# User Seeds
User.create!(name:                               'Tumri',
             email:                     'tumri@live.com',
             password:              "#{ENV['PASSWORD']}",
             password_confirmation: "#{ENV['PASSWORD']}",
             admin:                                 true,
             mod:                                   true,
             activated:                             true,
             activated_at:                 Time.zone.now)

User.create!(name:                              'Siddhu',
             email:            'sixarmedfreak@gmail.com',
             password:                          'siddhu',
             password_confirmation:             'siddhu',
             admin:                                false,
             mod:                                   true,
             activated:                             true,
             activated_at:                 Time.zone.now)

User.create!(name:                              'Nicole',
             email:           'nickcummings11@gmail.com',
             password:                          'nicole',
             password_confirmation:             'nicole',
             admin:                                false,
             mod:                                   true,
             activated:                             true,
             activated_at:                 Time.zone.now)

User.create!(name:                       'Administrator',
             email:                    'admin@tumri.xyz',
             password:              "#{ENV['TESTPASS']}",
             password_confirmation: "#{ENV['TESTPASS']}",
             admin:                                 true,
             mod:                                   true,
             activated:                             true,
             activated_at:                 Time.zone.now)

User.create!(name:                           'Moderator',
             email:                      'mod@tumri.xyz',
             password:              "#{ENV['TESTPASS']}",
             password_confirmation: "#{ENV['TESTPASS']}",
             admin:                                false,
             mod:                                   true,
             activated:                             true,
             activated_at:                 Time.zone.now)

User.create!(name:                                'User',
             email:                     'user@tumri.xyz',
             password:              "#{ENV['TESTPASS']}",
             password_confirmation: "#{ENV['TESTPASS']}",
             admin:                                false,
             mod:                                  false,
             activated:                             true,
             activated_at:                 Time.zone.now)

30.times do |n|
  name  = Faker::Name.name
  email = "tester-#{n + 1}@tumri.xyz"
  password = 'password'
  User.create!(name:                                name,
               email:                              email,
               password:                        password,
               password_confirmation:           password,
               activated:                           true,
               activated_at:               Time.zone.now)
end

# Welcome Article Seed
1.times do
  @user = User.find_by_id(1)
  lorem = Faker::Lorem.paragraph(25)
  ipsum = Faker::Lorem.paragraph(25)
  body = "<img src='http://robohash.org/TUMRI.png?set=set2' class='center'>
          <div>
            <i> Write stuff about Newzer here. </i>
            <p> #{lorem} </p>
            <p> #{ipsum} </p>
          </div>"
  @user.articles.create!(title: 'Welcome to Newzer',
                         body: body,
                         category_id: 9,
                         approved: true,
                         featured: true)
end

# Article Seeds
users = User.order(:id)

5.times do
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

# Comment Seeds
articles = Article.order(:id)

10.times do
  users.each do |user|
    body = Faker::Hacker.say_something_smart
    user_id = user.id
    article_id = Faker::Number.between(2, articles.count)
    user.comments.create!(body: body,
                          user_id: user_id,
                          article_id: article_id)
  end
end

# Comment Reply Seeds [Warning: Causes DB to become corrupt often.]
# comments = Comment.order(:id)

# 25.times do
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
