
#creates items

10.times do
  item = Item.new(
    title: Faker::Food.dish,
    date_stored: Faker::Date.between(2.years.ago, Date.today)
  )

  item.freezer_id = rand(Freezer.first.id..Freezer.last.id)
  item.item_type_id = rand(ItemType.first.id..ItemType.last.id)
  item.save
end
