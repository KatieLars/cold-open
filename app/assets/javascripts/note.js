function showNotesFirst() {
  $("button#show-notes").on('click', showNotes)
}

function showNotes() {//good
  var user = $(".main").data().userid
  var item = $(".main").data().itemid
  $.get("/users/"+user+"/items/"+item+".json", function(response){
    var notes = response.item.notes
    if(notes.length) {//if notes exist
      var noteList = ""
      notes.forEach(note => {
        noteList += `
        <div id="${note.id}"><p><strong>${note.content}</strong></p>
        <span style="font-size: .67em">${note.create_or_updated_at}&emsp;|&emsp;<a href="#" data-noteid="${note.id}" class="update-note">Update Note</a></span><br></br></div>
        `
      })
      var hideButton = "<div><button id='hide-notes'>Hide Notes</button></div>"
      $("span#display-notes").html(hideButton + noteList).on('click', hideNotes)
      $(".update-note").on('click', editNoteForm)
    }else{
      $("button#show-notes").after("<p id='no-notes'><strong>No notes for this item.</strong></p>")
    }
  })
}

function hideNotes() {//good
    $("span#display-notes").html('<button id="show-notes">Show Notes</button>')
    $("button#show-notes").on('click', showNotes)
}

function showNoteForm() { //good
  $("#create-notes").on('click', function(){
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
        $("#create-notes").after(noteForm)
        $("form#note-form").on('submit', createNote)
  })
}


 function editNoteForm() {
   var item = $(".main").data().itemid
   var note = $(this).data().noteid
   $.get("/items/"+item+"/notes/"+note+".json", function(response) {
      debugger
      $("#show-notes").html(updateForm(response))
      $("form#edit-form").on('submit', updateNote)
   })
 }

 function updateForm(response) {
   var dataForm = `
          <form id="edit-form">
            <br></br><strong>Note: </strong><input type="text_area" name="content" placeholder="${response.note.content}"><br></br>
            <input type="hidden" name="updated_at" value="${Date()}">
            <input type="submit" id="update-form">Update Note</input>
          </form>
        `
  return dataForm
 }

 function updateNote() {
   //post to the update function and updates the note
   //have an alert signaling that the item was updated successfully
 }

 // <input type="hidden" name="item_id" value="${item}">
 // <input type="hidden" name="user_id" value="${user}">

function createNote(event) {
    event.preventDefault()
    var values = $(this).serialize()
    var item = $(".main").data().itemid
    var note =  $.post("/items/"+item+"/notes.json", values)
    note.done(function(response) {
      newNote = `
      <div><p><strong>${response.note.content}</strong></p>
      <span style="font-size: .67em">${response.note.create_or_updated_at}&emsp;|&emsp;<a href="#" class="update-note">Update Note</a></span><br></br></div>
      `
      buttonOrSpan(newNote)
      $(".update-note").on('click', editNoteForm)
      $("form").empty()
    })
}

function buttonOrSpan(newNote) {
  if($("span#display-notes div:last-child").length) {
    $("span#display-notes div:last-child").after(newNote)
  }else{
    $("p#no-notes").remove()
    $("button#show-notes").after(newNote)
  }
}

$(function() {
    showNotes()
    showNotesFirst()
    showNoteForm()
});
