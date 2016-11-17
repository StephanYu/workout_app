Fabricator(:exercise) do 
  user
  duration_in_min { Faker::Number.number(2) }
  workout { Faker::Lorem.word }
  workout_date Date.today
end