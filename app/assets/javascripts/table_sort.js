$(function(){
  $('#cards_list').sortable({
    update: function(e, ui){
      let item = ui.item;
      let item_data = item.data();
      // console.log(item_data)
      let params = {_method: 'put'};
      // console.log(params)
      params[item_data.modelName] = { row_order_position: item.index() }
      $.ajax({
        type: 'POST',
        url: item_data.updateUrl,
        dataType: 'json',
        data: params
      });
      // debugger;
    },
    // stop: function(e, ui){
    //   ui.item.children('li').effect('list', { color: "#FFFFCC" }, 500)
    // }
  });
  // debugger;
});