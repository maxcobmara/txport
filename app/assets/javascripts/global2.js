

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
  //http://stackoverflow.com/questions/11933173/how-to-restrict-the-selectable-date-ranges-in-bootstrap-datepicker
  $('[data-behaviour=datepicker_2beforeafter]').datepicker({
    format: "yyyy/mm/dd",
    startDate: "-2m",
	endDate: "+2m"
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

function switchvisibility(el) {
  if (document.getElementById(el).checked) {
    document.getElementById('bstaff').style.display = "table-row";
    document.getElementById('bstudent').style.display = "none";
  } else {
    document.getElementById('bstaff').style.display = "none";
    document.getElementById('bstudent').style.display = "table-row";
  }
}

//for datepicker to works in nested forms
//http://stackoverflow.com/questions/10824587/adding-a-date-picker-to-a-nested-form-field
$(function() {
  $(".add_fields_datepicker").datepicker({ format: 'yyyy/mm/dd', autoSize:true, startDate: "-2m", endDate: "+2m"});
});

$(function() {
    $('.add_fields').on('click', function(){
      $(this).datepicker({ format: 'yyyy/mm/dd', autoSize:true, startDate: "-2m", endDate: "+2m"});
    });
});


