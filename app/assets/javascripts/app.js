$(function () {
  $('.card').each(function () {
    var $el = $(this);
    var id = $el.data('id');
    $.get('/wallets/' + id, function (data) {
      $el.find('.card-body').html(data);
      $('[data-toggle="popover"]').popover();
    }).fail(function() {
      $el.find('.card-body').html('<div class="alert alert-danger" role="alert">Eek! Something broke' + 
      '<i class="fa fa-frown-o" aria-hidden="true"></i></div>');
    });
  });
});
