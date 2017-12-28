require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

3.times do
  User.create(
    username: Faker::StarWars.character,
    password: Faker::StarWars.vehicle,
    email: "#{Faker::Lovecraft.deity}@gmail.com"
  )
end

3.times do
  Freezer.create(
    name: Faker::LordOfTheRings.location,
    freezer_type: Faker::GameOfThrones.house
  )
end

5.times do
  ItemType.create(
    title: Faker::Dune.character,
    storage_min: "#{rand(1..4)}",
    storage_max: "#{rand(5..10)}"
  )
end

10.times do
User.first.items.create(
  title: Faker::Food.dish,
  item_type_id: 3,
  freezer_id: 1,
  date_stored: Faker::Date.between(1.year.ago, Date.tomorrow)
)
end
