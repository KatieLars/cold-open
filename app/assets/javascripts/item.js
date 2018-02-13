function getItems() {
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

$(function() {
    getItems()
});
