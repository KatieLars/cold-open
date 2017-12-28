require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

User.create(username: "Leia", password: "sandcrawler", email: "cthulu@gmail.com")
User.create(username: "Han Solo", password: "Millenium Falcon", email: "ancient@gmail.com")
User.create(username: "Luke", password: "X-Wing", email: "force@gmail.com")

User.first.freezers.create(name: "basement", freezer_type: "chest")
User.first.freezers.create(name: "office", freezer_type: "beer")
User.second.freezers.create(name: "garage", freezer_type: "french door")

ItemType.create(title: "frozen veggies", storage_min: "1", storage_max: "2")
ItemType.create(title: "fruit pie", storage_min: "3", storage_max: "4")
ItemType.create(title: "raw hamburger", storage_min: "5", storage_max: "6")
ItemType.create(title: "TV dinners", storage_max: "6")
ItemType.create(title: "beef bones", storage_min: "12", storage_max: "14")

User.first.items.create(title: "casserole", item_type_id: 4, freezer_id: 1, date_stored: "Fri, 19 May 2017".to_datetime)
User.first.items.create(title: "beef stew", item_type_id: 3, freezer_id: 2, date_stored: "Sat, 29 Apr 2017".to_datetime)
User.first.items.create(title: "pizza", item_type_id: 4, freezer_id: 3, date_stored: "Mon, 09 Jan 2017".to_datetime)
User.first.items.create(title: "cow parts", item_type_id: 5, freezer_id: 1, date_stored: "Wed, 18 Jan 2017".to_datetime)
User.first.items.create(title: "apple pie", item_type_id: 2, freezer_id: 2, date_stored: "Thu, 14 Dec 2017".to_datetime)
User.first.items.create(title: "Manwich", item_type_id: 4, freezer_id: 3, date_stored: "Fri, 19 May 2017".to_datetime)
User.first.items.create(title: "beef patties", item_type_id: 3, freezer_id: 1, date_stored: "Mon, 14 Aug 2017".to_datetime)
User.first.items.create(title: "peas", item_type_id: 1, freezer_id: 2, date_stored: "Sun, 08 Oct 2017".to_datetime)
User.first.items.create(title: "cranberry pie", item_type_id: 2, freezer_id: 3, date_stored: "Sat, 21 Jan 2017".to_datetime)
User.first.items.create(title: "broccoli", item_type_id: 1, freezer_id: 1, date_stored: "Fri, 13 Jan 2017".to_datetime)

User.first.notes.create(content: "blahblah", item_id: 1)
User.second.notes.create(content: "so cool", item_id: 2)
User.furst.notes.create(content: "beepboop", item_id: 1)
