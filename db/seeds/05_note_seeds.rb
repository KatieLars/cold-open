#create notes
  5.times do
    note = Note.new(
      content: Faker::Dune.quote
    )
    note.item_id = rand(Item.first.id..Item.last.id)
    note.user_id = rand(User.first.id..User.last.id)
    note.save

  end
