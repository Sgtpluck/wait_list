$(function() {
  $("#profilePage").click(function(){
    $('#profileModal').modal('show');
  });

  $("#resetProfile").click(function(){
    var adieInfo = $("form#edit_adie_1").serializeObject();
    $("#resetProfile").button('Updating...');
    $.ajax({
      url: '/profile',
      dataType: 'json',
      type: 'PATCH',
      data: adieInfo,
      error: function(xhr, status, message) {
        var errors = xhr.responseJSON['message'];
        $.each(errors, function(index, error){
          $('.listErrors').append('<li>'+ error + '</li>');
        });
      },
      success: function(data, status, xhr) {
        $('#profileModal').modal('hide');
      }
    });
  });
});