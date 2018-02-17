# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
      See: note.js and item.js
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
      See: show action in Notes Controller, note.js, and Note Serializer
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
      See: index action in Item Controller, item.js and Item Serializer
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
      See: Item has_many notes in Item Serializer
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
      See: Note Controller, note.js--renders a new note form and and update note form on Item show page without refresh
- [x] Translate JSON responses into js model objects.
      See: note.js: upon creation of a new note creates JS model to append HTML to DOM
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
      See: note.js: Note class created with methods based on AMS Note Serializer; prototype methods for rendering object-specific HTML; Note class methods for rendering class HTML (e.g. new note form)

Confirm
- [x] You have a large number of small Git commits (341)
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

