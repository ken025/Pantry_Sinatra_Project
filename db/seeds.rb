# Creating mass data to test the app
5.times do 
    User.create(username: Faker::Name.name, email: Faker::Internet.email)
end 

5.times do 
    Item.create(name: Faker::Food.fruits, quantity: Faker::Number.within(range: 1..10), user_id: 1)
end 

5.times do 
    Item.create(name: Faker::Food.fruits, quantity: Faker::Number.within(range: 1..10), user_id: 2)
end 

5.times do 
    Item.create(name: Faker::Food.fruits, quantity: Faker::Number.within(range: 1..10), user_id: 3)
end 

5.times do 
    Item.create(name: Faker::Food.fruits, quantity: Faker::Number.within(range: 1..10), user_id: 4)
end 

5.times do 
    Item.create(name: Faker::Food.fruits, quantity: Faker::Number.within(range: 1..10), user_id: 5)
end 