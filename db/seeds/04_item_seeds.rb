
#creates items

10.times do
  item = Item.new(
    title: Faker::Food.dish,
    date_stored: Faker::Date.between(1.year.ago, Date.tomorrow)
  )

  item.freezer_id = rand(Freezer.first.id..Freezer.last.id)
  item.item_type_id = rand(ItemType.first.id..ItemType.last.id)
  item.save
end
