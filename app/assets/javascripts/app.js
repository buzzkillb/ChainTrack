$(function () {
  var clipboard = new Clipboard('.clipboard-btn');
  
  var setTooltip = function (btn, message) {
    $(btn).tooltip('hide')
      .attr('data-original-title', message)
      .tooltip('show');
  };

  var hideTooltip = function (btn) {
    setTimeout(function() {
      $(btn).tooltip('dispose');
    }, 5000);
  };
  
  var toLocalDate = function(el) {
    var locale = window.navigator.userLanguage || window.navigator.language;
    var localDate = moment.utc(el.data('date'), 'MM-DD-YY HH:mm:ss').local().locale(locale).format('ll');
    el.html(localDate);
  };
  
  $('.clipboard-btn').tooltip({ trigger: 'click', placement: 'bottom' });
  
  clipboard.on('success', function(e) {
    setTooltip(e.trigger, 'Copied!');
    hideTooltip(e.trigger);
  });

  clipboard.on('error', function(e) {
    setTooltip(e.trigger, 'Failed!');
    hideTooltip(e.trigger);
  });
  
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
      toLocalDate($el.find('.utc-date'));
      $('[data-toggle="popover"]').popover();
      $('[data-toggle="tooltip"]').tooltip();
    }).fail(function() {
      $el.find('.card-body').html('<i class="fa fa-frown-o fa-3x" aria-hidden="true"></i>');
    })
  });
});
