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


$(function() {
    getFreezerItems()
    getItems()
});
