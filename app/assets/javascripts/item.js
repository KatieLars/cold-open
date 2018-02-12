function getItems() {
$("#items-link").on("click", function(){
  var user = $("#items-link").data().userid
  $.get("/users/"+user+"/items.json", function(response){
      var data = response.data
      var itemList = ""
      data.forEach(item => {//eventually refactor into Item.prototype function ---may need to fuck with serializer to allow for expiration expiration_zone
        itemList += '<a href="/users/'+user+'/items/'+item.id+'">'+item.attributes.title+':</a></br>'
      })
    $("#items-list").html(itemList)
   })
})
}

$(function() {
    getItems()
});
