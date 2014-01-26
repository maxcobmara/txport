

$(document).ready(function(){
  
  $('[data-behaviour=datepicker_before]').datepicker({
    format: "yyyy/mm/dd",
    endDate: "today",
    todayBtn: true
  });
  
  $('[data-behaviour=datepicker_after]').datepicker({
    format: "yyyy/mm/dd",
    startDate: "today",
    autoclose: true,
    todayBtn: true
  });
  
  $('[data-behaviour=datepicker_year]').datepicker({
      format: "yyyy",
      endDate: "today",
      startView: 1,
      minViewMode: 2,
      daysOfWeekDisabled: "6"
  });
  
  $('#datetimepicker1').datetimepicker({});
  
  $('.input-daterange').datepicker({
     format: "yyyy-mm-dd",
     autoclose: true
   });
  
  $('select').selectpicker();
  
  $('#myTab a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  });

})



