/* Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/ */

$(document).ready(function(){
   $('#toga').click(function() {	   
      $('.search_bar').toggle();  
   });
   
   $("#vehicles_search input").keyup(function() {
     $.get($("#vehicles_search").attr("action"), $("#vehicles_search").serialize(), null, "script");
     return false;
   });
});


