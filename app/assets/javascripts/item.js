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

function showNotes() {//should be on item show page--shows notes when clicked
  $("button#show-notes").on('click', function(e){//might not need e . . .there is no default action
    e.preventDefault()
    var user = $(".main").data().userid
    var item = $(".main").data().itemid
    $.get("/users/"+user+"/items/"+item+".json", function(response){
      var notes = response.item.notes
      var noteList = ""
      notes.forEach(note => { //add a click to update note
        noteList += `
        <p><strong>${note.content}</strong></p>
        <span style="font-size: .67em">${note.create_or_updated_at}&emsp;|&emsp;<a href="#" id="update_note">Update Note</a></span><br></br>` //make a button to update note
      })
    $("button#show-notes").after(noteList)
    })
  })
}

function showNoteForm() {
  $("button#create-notes").on('click', function(e){ //sends a request to get the note form
      e.preventDefault()
      //grabs a notes form to populate with hidden ID in it
      //need a route
      $.get("/item/item_id/notes")
  })
}

$(function() {
    getFreezerItems()
    getItems()
    showNotes()
});
