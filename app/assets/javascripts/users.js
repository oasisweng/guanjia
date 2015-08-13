var ready,change,update,partial_load;
ready = function() {
  console.log("page:ready");
};

change = function(){
  l("page:change");
};

update = function(){
  l("page:update");
  $.each($('a[id |= "suspend"]'), function(index, a) {
    $(a).click(function(evt){
      evt.preventDefault();
      $('div#'+$(this).attr('id') + "-confirmation").toggleClass('hidden');
    });
  });
};

partial_load = function(){
  l("page:partial_load");
};

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('page:change', change);
$(document).on('page:update', update);
$(document).on('page:partial-load', partial_load);


function l(msg){
  console.log(msg);
}
