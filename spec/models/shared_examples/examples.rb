require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean
#3 users
User.create(username: "Leia", password: "sandcrawler", email: "cthulu@gmail.com")
User.create(username: "Han Solo", password: "Millenium Falcon", email: "ancient@gmail.com")
User.create(username: "Luke", password: "X-Wing", email: "force@gmail.com")
#3 freezers
Freezer.create(name: "basement", freezer_type: "chest")
Freezer.create(name: "office", freezer_type: "beer")
Freezer.create(name: "garage", freezer_type: "french door")
#5 item types
ItemType.create(title: "frozen veggies", storage_min: "1", storage_max: "2")
ItemType.create(title: "fruit pie", storage_min: "2", storage_max: "4")
ItemType.create(title: "raw hamburger", storage_min: "5", storage_max: "7")
ItemType.create(title: "TV dinners", storage_max: "6")
ItemType.create(title: "beef bones", storage_max: "1")
#10 items
#max 4 mos
User.first.items.create(title: "casserole", item_type_id: 4, freezer_id: 1, date_stored: Time.now.months_ago(3))#still good
User.first.items.create(title: "pizza", item_type_id: 4, freezer_id: 3, date_stored: Time.now.months_ago(8)) #expired
User.first.items.create(title: "Manwich", item_type_id: 4, freezer_id: 3, date_stored: Time.now.months_ago(7)) #expired
User.second.items.create(title: "curry", item_type_id: 4, freezer_id: 3, date_stored: Time.now.months_ago(3)) #expire in 1 mo
#5-7 mos
User.first.items.create(title: "beef patties", item_type_id: 3, freezer_id: 1, date_stored: Time.now.months_ago(4)) #still good
User.first.items.create(title: "beef stew", item_type_id: 3, freezer_id: 2, date_stored: Time.now.months_ago(6)) #expiration_zone, 1 mo
#1 mos
User.second.items.create(title: "broth", item_type_id: 5, freezer_id: 2, date_stored: Time.now.weeks_ago(3)) #in 1 week
User.first.items.create(title: "cow parts", item_type_id: 5, freezer_id: 1, date_stored: Time.now.weeks_ago(1)) #still good
#2-4 mos
User.first.items.create(title: "apple pie", item_type_id: 2, freezer_id: 2, date_stored: Time.now.months_ago(3)) #expiration zone, 1 mo
User.first.items.create(title: "cranberry pie", item_type_id: 2, freezer_id: 3, date_stored: Time.now.months_ago(8)) #expired
#1-2 mos
User.first.items.create(title: "peas", item_type_id: 1, freezer_id: 2, date_stored: Time.now.months_ago(3)) #expired
User.first.items.create(title: "broccoli", item_type_id: 1, freezer_id: 1, date_stored: Time.now.weeks_ago(2)) #still_good

#3 notes
User.first.notes.create(content: "blahblah", item_id: 1)
User.second.notes.create(content: "so cool", item_id: 2)
User.first.notes.create(content: "beepboop", item_id: 1)
