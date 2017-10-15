$(function () {
  if($('#summary').length > 0) {
      var token = $('#summary').data('token');
      $.get('/summary/' + token, function (data) {
        $('#summary').html(data);
      }).fail(function() {
        $('#summary').html('<i class="fa fa-frown-o fa-3x" aria-hidden="true"></i>');
    });
  }
  
  $('.card').each(function () {
    var $el = $(this);
    var id = $el.data('id');
    $.get('/wallets/' + id, function (data) {
      $el.find('.card-body').html(data);
      $('[data-toggle="popover"]').popover();
    }).fail(function() {
      $el.find('.card-body').html('<i class="fa fa-frown-o fa-3x" aria-hidden="true"></i>');
    });
  });
});
