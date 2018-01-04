#creates freezers
3.times do
  Freezer.create(
    name: Faker::LordOfTheRings.location,
    freezer_type: Faker::GameOfThrones.house
  )
end
