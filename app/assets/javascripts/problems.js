$(function() {
  $("#newProblem").click(function(){
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
      },
      success: function(data, status, xhr) {
        $('#newProblemModal').modal('hide');
        document.location.href = '/problems';
      }
    });
  });
});