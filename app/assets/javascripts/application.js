// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap.min
//= require bootstrap-transition
//= require bootstrap-datepicker
//= require bootstrap-select
//= require bootstrap-datetimepicker
//= require jsapi
//= require chartkick
//= require global2
//= require_tree .

$(document).ready(function(){


  /* Why so many? If you need more than one search per page use id not classes */
  /* adn put them in the model js */
  $('.toga').click(function() {
    $('.searchit').toggle();
  });

  $(".bogus").click(function (e) {
      alert("Sorry! Feature not yet implemented");
  });
  $(".out_of_scope").click(function (e) {
      alert("Sorry! This feature for future implementation");
  });

  $('.selectpicker').selectpicker();

  $('[data-behaviour=datepicker_std]').datepicker({
    format: "yyyy-mm-dd",
    autoclose: true,
    todayBtn: true
  });

  $('.btn').tooltip( {placement: 'bottom', container: 'body'});
})
