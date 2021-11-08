User.create(
    name: 'happi',
    email: 'hguruman@gmail.com',
    password: 'password',
    password_confirmation:'password'
)

8.times do
    House.create({
        name: Faker::Name.first_name,
        description: Faker::Lorem.sentence,
        price: Faker::Lorem.sentence,
        image: Faker::Lorem.sentence,
        user_id: user.id
    })
end