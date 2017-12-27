
item_types = [
  "Ham, cooked - 1-2 mos",
  "Tv Dinners  - 2-4 mos",
  "meat casseroles, cooked - 3-4 mos",
  "hamburger, uncooked - 3-4 mos",
  "stew meat (beef), uncooked - 2-4 mos",
  "ground turkey, veal, pork, lamb, uncooked - 3-4 mos",
  "lunch meats - 1-2 mos",
  "hot dogs - 1-2 mos",
  "soups and stews, cooked - 2-3 mos",

  "bacon, uncooked  - 1 mos",

  "sausage, uncooked - 1-2 mos",
  "smoked sausage - 1-2 mos",
  "steaks, uncooked  - 6-12 mos",
  "chops, uncooked - 4-6 mos",
  "roasts, uncooked - 4-12 mos",
  "offal, uncooked - 1-2 mos",
  "meat leftovers, cooked - 2-3 mos",
  "gravy & broth - 2-3 mos",
  "giblets, uncooked - 3-4 mos",

  "chicken or turkey, whole, uncooked - 12 mos",

  "chicken or turkey, parts, uncooked - 9 mos",

  "fried chicken - 4 mos",

  "poultry leftovers, cooked - 4-6 mos",

  "chicken nuggets or patties - 2 mos",

  "chicken covered in broth or sauce, cooked - 6 mos",

  "fresh lean fish - 6 mos",

  "fresh fatty fish - 2-3 mos",
  "cooked fish - 4-6 mos",

  "smoked fish - 2 mos",

  "fresh shellfish - 3-6 mos",

  "fruit pies, unbaked - 8 mos",

  "fruit & vegetables - 6-12 mos",
  "butter - 6-9 mos",

  "bread & cake - 3 mos",

  "cookies, baked or dough - 3 mos",

  "ice cream & sorbet - 2 mos",
  ]

  #creates item types
  item_types.each do |item_type|
    types = item_type.split(" - ")#splits string into array ["Ham, cooked", "1-2 mos"]
    range = types[1].split("-")
    if range.count == 2

      range.collect do |t|
        if t.include?("mos")
          range[1] = t.gsub("mos", "months")
        else
          range[0] = t + " months"
        end
      end
    else
      range[0] = range[0].gsub("mos", "months")

    end
    types.pop
    types += range
    if types.count > 2
      ItemType.create(title: types[0], storage_min: types[1], storage_max: types[2])
    else
      ItemType.create(title: types[0], storage_max: types[1])
    end
  end
