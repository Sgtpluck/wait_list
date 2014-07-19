$(function() {
  $("#newProblem").click(function(){
    $('.flash_notice').empty();
    $('#newProblemModal').modal('show');
  });

  $("#getHelp").click(function(){
    var problem = $("form.new_problem").serializeObject();
    $("#getHelp").button('Processing Problem...')
    $.ajax({
      url: '/help_me',
      dataType: 'json',
      type: 'POST',
      data: problem,
      error: function(xhr, status, message) {
        var errors = xhr.responseJSON['message'];
        $.each(errors, function(index, error){
          $('.listErrors').append('<li>'+ error + '</li>');
        });
      },
      success: function(data, status, xhr) {
        $('#newProblemModal').modal('hide');
        document.location.href = '/problems';
      }
    });
  });
});