// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize

$(document).ready(function(){
  $('.modal').modal();
  $(".button-collapse").sideNav();

  $('#login-form, #signup-form').submit(function() {
    e.preventDefault();
  });

  $('#login-btn').click(function (e) {
    e.preventDefault();
    var form = $(this).closest('form');
    $.ajax({
      url: form.attr('action'),
      data: form.serialize(),
      method: 'POST',
      dataType: 'JSON',
      success: function(data) {
        debugger
        localStorage.setItem('token', data.token)
        window.location = "/topics"
      },
      error: function(jqXHR) {
        toastr.error(jqXHR.responseJSON.error.message)
      }
    })
  });
});
