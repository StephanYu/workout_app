Fabricator(:user) do 
  exercises(count: 2)
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  password { Faker::Internet.password }
  room { Fabricate.build(:room) }
end