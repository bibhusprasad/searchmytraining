
$(document).ready(function(){
    var dateToday = new Date();
var dates = $("#Fdate, #Tdate").datepicker({
    defaultDate: "+0",
    changeMonth: true,
    numberOfMonths: 2,
    minDate: 0,
    onSelect: function(selectedDate) {
        var option = this.id == "Fdate" ? "minDate" : "maxDate",
            instance = $(this).data("datepicker"),
            date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
        dates.not(this).datepicker("option", option, date);
    }
});
});
  
  
  
  