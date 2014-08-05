$(function() {
  var haveEmail = $("#profileModal").data("email");
  if (haveEmail === false) {
    $('#profileModal').modal('show');
    $('#profileModal .alerts').append("<div class='alert alert-warning'>Please add an email address; otherwise, you might get locked out of your account!</div>");
  }
});