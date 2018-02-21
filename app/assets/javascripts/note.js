function Note(attributes){
  this.content = attributes.content
  this.userId = attributes.user_id
  this.itemId = attributes.item_id
  this.createdAt = attributes.created_at
  this.updatedAt = attributes.updated_at
  this.id = attributes.id
  this.createOrUpdatedAt = attributes.create_or_updated_at
}

Note.showNotesFirst = function() {//good
  $("button#show-notes").on('click', Note.showNotes)
}

Note.showNotes = function() {//displays notes for item
  var user = $(".main").data().userid
  var item = $(".main").data().itemid
  $.get("/users/"+user+"/items/"+item+".json", function(response){
    var notes = response.item.notes
    if(notes.length) {
      var hideButton = "<button id='hide-notes'>Hide Notes</button>"
      $("span#display-notes").html(hideButton).on('click', Note.hideNotes)
      $("#note-list").html(noteList(notes))
      $(".update-note").on('click', editNoteForm)
    }else{
      $("#note-list").html("<p id='no-notes'><strong>No notes for this item.</strong></p>")
      $("button#show-notes").off('click')
    }
  })
}

Note.prototype.noteDiv = function(){ //generates single note div
  var oneNoteDiv = `<div id="${this.id}"><p><strong>${this.content}</strong></p>
  <span style="font-size: .67em">${this.createOrUpdatedAt}&emsp;|&emsp;<a href="#" data-noteid="${this.id}" class="update-note">Update Note</a></span><br></br></div>
  `
  return oneNoteDiv
}

function noteList(notes){//generates list of note divs--Item class?
  var lister = ""
  notes.forEach(note => {
    var jsNote = new Note(note)
    lister += jsNote.noteDiv()
  })
  return lister
}

Note.hideNotes = function() {//makes hideNotes button disappear
    $("span#display-notes").html('<button id="show-notes">Show Notes</button>')
    $("button#show-notes").on('click', Note.showNotes)
    $("#note-list").empty()
}

Note.prototype.showOneNote = function(noteHtml) {//shows only last created note
  //SEE WHERE SHOWONENOTE IS ALSO CALLED
  //var note = new Note(this)
  //var noteHtml = note.noteDiv()
  $("#note-list").html(noteHtml)
  $(".update-note").on('click', editNoteForm)
  $("#note-form").html('<button id="create-notes">Create Note</button>')
  Note.showNoteForm()
}

Note.showNoteForm = function() { //call this to attach click event
  $("#create-notes").on('click', function(){
        $("#note-list").empty()
        $("#create-notes").after(Note.newNoteForm())
        $("form#note-form").on('submit', Note.createNote)
        $("#create-notes").off('click')
  })
}

Note.newNoteForm = function() { //html for new note form
  const item = $(".main").data().itemid
  const user = $(".main").data().userid
  const noteForm = `
    <form id="note-form">
      <br></br><strong>New Note: </strong><input type="text_area" name="content"><br></br>
      <input type="hidden" name="item_id" value="${item}">
      <input type="hidden" name="user_id" value="${user}">
      <input type="hidden" name="created_at" value="${Date()}">
      <input type="submit" id="submit-form">
    </form>
  `
  return noteForm
}

Note.createNote = function(event) { //post request for creating new note
    event.preventDefault()
    var values = $(this).serialize()
    var item = $(".main").data().itemid
    var jsonNote =  $.post("/items/"+item+"/notes.json", values)
    jsonNote.done(function(response) {
      var note = new Note(response.note)
      //debugger
      var noteHtml = note.noteDiv()
      note.buttonOrSpan(noteHtml)
      $(".update-note").on('click', editNoteForm)
      alert("Note created!")
      $("#note-form").empty()
      note.showOneNote(noteHtml)
    })
}

Note.prototype.buttonOrSpan = function(){//displays note after last div or after show notes if no notes
  if($("span#display-notes div:last-child").length) {
    $("span#display-notes").append(this)
  }else{
    $("p#no-notes").remove()
    $("#note-list").html(this)
  }
}

function editNoteForm() {//displays edit note form/deletes create button
   var item = $(".main").data().itemid
   var note = $(this).data().noteid
   $.get("/items/"+item+"/notes/"+note+".json", function(response) {
      var updatedNote = new Note(response.note)
      $("#note-form").html(updatedNote.updateForm())
      $("form#edit-form").on('submit', updatedNote.updateNote)
   })
 }

 Note.prototype.updateForm = function() {//edit form
   var dataForm = `
          <form id="edit-form">
            <br></br><strong>Note: </strong><input type="text_area" name="content" placeholder="${this.content}" onclick=""><br></br>
            <input type="hidden" name="id" value="${this.id}">
            <input type="hidden" name="updated_at" value="${Date()}">
            <input type="submit" id="update-form" value="Update Note"></br>
          </form>
        `
  return dataForm
 }

Note.prototype.updateNote = function(event) { //updating a note
  event.preventDefault()
  var values = $(this).serialize()
  var item = $(".main").data().itemid
  var note = this.id.value
  var newNote = $.post("/items/"+item+"/notes/"+note+".json", values)
  newNote.done(function(response) {
    var updatedNote = new Note(response.note)
    var noteHtml = updatedNote.noteDiv()
    updatedNote.buttonOrSpan(noteHtml)
    $(".update-note").on('click', editNoteForm)
    alert("Note Updated!")
    updatedNote.showOneNote()
  })
}

$(function() {
    Note.showNotesFirst()
    Note.showNoteForm()
});
