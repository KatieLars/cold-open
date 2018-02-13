function getItems() {
$("#items-link").on('click',function(e){
  e.preventDefault()
  var freezer = $(this).data().freezer
  var user = $("#items-link").data().user
  $.get("/users/"+user+"/freezers/"+freezer+".json", function(response){
      debugger
      var items = response.data.relationships.items

      var itemList = ""
      items.forEach(item => {
        itemList += '<a href="/users/'+user+'/items/'+item.id+'">'+item.attributes.title+':</a></br>'
      })
    $("#items-list").html(itemList)
   })
})
}

$(function() {
    getItems()
});
