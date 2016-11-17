Fabricator(:user) do 
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  exercises(count: 2)
  email { Faker::Internet.email }
  password { Faker::Internet.password }
end