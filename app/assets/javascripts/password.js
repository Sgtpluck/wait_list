$(function() {
  $("#forgot").click(function(){
    $('.flash_notice').empty();
    $('#forgotPassword').modal('show');
  });

  $("#createPassword").click(function(){
    var email = $('#adie_email').val()
    $.ajax({
      url: '/reset',
      type: 'PATCH',
      data: {
        'adie[email]': email
      },
      error: function(xhr, status, message) {
       $('.flash_notice').append("I'm sorry, there does not appear to be an Adie with that email address.");
      },
      success: function(data, status, xhr) {
        $('.flash_notice').append("You should soon receive an email with your new password.");
      }
    });
    $('#forgotPassword').modal('hide');
  });
});