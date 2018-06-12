//= require jquery
//= require jquery_ujs
//= require lib/typed
//= require typed-implementation
//= require_tree .

(function() {
  $(document).on('click', '.toggle-window', function(e) {
    e.preventDefault();
    var card = $(this).parent().parent();
    var messages_list = card.find('.messages-list');
 
    card.find('.card-body').toggle();
    card.attr('class', 'card card-default');
 
    if (card.find('.card-body').is(':visible')) {
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });
})();