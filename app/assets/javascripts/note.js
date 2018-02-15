function Note(attributes){
  this.content = attributes.content
  this.user_id = attributes.user.id
  this.item_id = attributes.item.id
  this.created_at = attributes.created_at
  this.updated_at = attributes.updated_at
}

function showNotesFirst() {//first button listener
  $("button#show-notes").on('click', showNotes)
}

function showNotes() {//displays notes for item
  var user = $(".main").data().userid
  var item = $(".main").data().itemid
  $.get("/users/"+user+"/items/"+item+".json", function(response){
    var notes = response.item.notes
    if(notes.length) {
      var hideButton = "<div><button id='hide-notes'>Hide Notes</button></div>"
      $("span#display-notes").html(hideButton + noteList(notes)).on('click', hideNotes)
      $(".update-note").on('click', editNoteForm)
    }else{
      $("button#show-notes").after("<p id='no-notes'><strong>No notes for this item.</strong></p>")
    }
  })
}

function noteList(notes){//generates list of note divs
  var lister = ""
  notes.forEach(note => {
    lister += noteDiv(note)
  })
  return lister
}

Note.prototype.noteDiv = function(){ //generates single note div
  var oneNoteDiv = `<div id="${this.id}"><p><strong>${this.content}</strong></p>
  <span style="font-size: .67em">${this.create_or_updated_at}&emsp;|&emsp;<a href="#" data-noteid="${this.id}" class="update-note">Update Note</a></span><br></br></div>
  `
  return oneNoteDiv
}

function hideNotes() {//makes hideNotes button disappear
    $("span#display-notes").html('<button id="show-notes">Show Notes</button>')
    $("button#show-notes").on('click', showNotes)
}

function showNoteForm() { //shows create note form
  $("#create-notes").on('click', function(){
        $("#create-notes").after(newNoteForm())
        $("form#note-form").on('submit', createNote)
  })
}

function newNoteForm() { //html for new note form
  var item = $(".main").data().itemid
  var user = $(".main").data().userid
  var noteForm = `
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

function createNote(event) { //post request for creating new note
    event.preventDefault()
    var values = $(this).serialize()
    var item = $(".main").data().itemid
    var note =  $.post("/items/"+item+"/notes.json", values)
    note.done(function(response) {
      var note = new Note(response.note)//
      var noteHtml = note.noteDiv()
      note.buttonOrSpan(noteHMTL)
      $(".update-note").on('click', editNoteForm)
      $("form").empty()
    })
}

Note.prototype.buttonOrSpan = function(){//displays note after last div or after show notes if no notes
  if($("span#display-notes div:last-child").length) {
    $("span#display-notes div:last-child").after(this)
  }else{
    $("p#no-notes").remove()
    $("button#show-notes").after(this)
  }
}

 function editNoteForm() {//displays edit note form--deletes create button
   var item = $(".main").data().itemid
   var note = $(this).data().noteid
   $.get("/items/"+item+"/notes/"+note+".json", function(response) {
      $("#note-form").html(updateForm(response))
      $("form#edit-form").on('submit', updateNote)
   })
 }

 function updateForm(response) {//edit form
   var dataForm = `
          <form id="edit-form">
            <br></br><strong>Note: </strong><input type="text_area" name="content" placeholder="${response.note.content}" onclick=""><br></br>
            <input type="hidden" name="id" value="${response.note.id}">
            <input type="hidden" name="updated_at" value="${Date()}">
            <input type="submit" id="update-form" value="Update Note"><br></br>
          </form>
        `
  return dataForm
 }

function updateNote(event) { //updating a note
  event.preventDefault()
  var values = $(this).serialize()
  var item = $(".main").data().itemid
  var note = this.id.value
  var newNote = $.post("/items/"+item+"/notes/"+note+".json", values)
  newNote.done(function(response) {
    buttonOrSpan(noteDiv(response.note))//nothing to do with  create button
    $(".update-note").on('click', editNoteForm)//attaches event listener
    $("span#note-form").html("<button id='create-notes'>Create Note</button>")//span becomes create note again
    $("button#create-notes").on('click', showNoteForm)//hideNotes()//need to add create note button
  })
}

$(function() {
    showNotesFirst()
    showNoteForm()
});
