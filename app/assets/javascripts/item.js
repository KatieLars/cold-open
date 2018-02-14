function getFreezerItems() {//list items in freezer on a freezer show page
$("#items-link").on('click',function(e){
  e.preventDefault()
  var freezer = $(this).data().freezer
  var user = $("#items-link").data().user
  $.get("/users/"+user+"/freezers/"+freezer+".json", function(response){ //get request to freezer show page
      var items = response.freezer.items
      var itemList = ""
      items.forEach(item => {
        itemList += '<a href="/users/'+user+'/items/'+item.id+'">'+item.title+': '+item.expiration_zone+'</a></br>'
      })
    $("#items-list").html(itemList)
   })
})
}

function getItems() {//list user items on whatever page the Items link in header is clicked
  $("#items-index").on('click', function(e){
    e.preventDefault()
    var user = $("#items-index").data().id
    $.get("/users/"+user+"/items.json", function(response){
      var items = response.items
      var header = "<h1>Your Frozen Items</h1><h3><em>Click to see the deets</em></h3>"
      var itemList = ""
      items.forEach(item => {
        itemList += '<a href="/users/'+user+'/items/'+item.id+'">'+item.title+': '+item.expiration_zone+'</a></br>'
      })
    $(".main").html(header+itemList)
    })
  })
}

function showNotesFirst() {
  $("button#show-notes").on('click', showNotes)
}

function showNotes() {//good
  var user = $(".main").data().userid
  var item = $(".main").data().itemid
  $.get("/users/"+user+"/items/"+item+".json", function(response){
    var notes = response.item.notes
    if(notes.length) {
      var noteList = ""
      notes.forEach(note => {
        noteList += `
        <div><p><strong>${note.content}</strong></p>
        <span style="font-size: .67em">${note.create_or_updated_at}&emsp;|&emsp;<a href="#" data-noteid=${note.id} class="update-note">Update Note</a></span><br></br></div>
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
        noteForm = `
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

 function editNoteForm() { //helper to be used in conjuctions with click events
   //var user = $(".main").data().userid
   var item = $(".main").data().itemid
   var note = $(this).data().noteid
   debugger
   $.get("/items/"+item+"/notes/"+note+".json", function(response){
      noteForm = `
          <form id="edit-form">
            <br></br><strong>Note: </strong><input type="text_area" name="content" placeholder="${note.content}"><br></br>
            <input type="hidden" name="updated_at" value="${Date()}">
            <input type="submit" id="submit-form">Update Note</input>
          </form>
        `
//   var hideButton = "<button id='hide-notes'>Hide Notes</button>"
//   $("span#display-notes").html(hideButton + noteList).on('click', hideNotes)
 })
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
    getFreezerItems()
    getItems()
    showNotesFirst()
    showNoteForm()
});
