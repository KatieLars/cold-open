function getItems() {
$("#items-link").on('click',function(e){
  var user = $("#items-link").data().userid
  $.get("/users/"+user+"/items.json", function(response){
      var data = response.data
      var itemList = ""
      data.forEach(item => {
        itemList += '<a href="/users/'+user+'/items/'+item.id+'">'+item.attributes.title+':</a></br>'
      })
    $("#items-list").html(itemList)
   })
})
}

$(function() {
    getItems()
});
