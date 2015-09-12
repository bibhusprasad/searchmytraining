$(document).ready(function() {

	var from = $("#Fdate").val();
	var to = $("#Tdate").val();
	
	
	
$(function() {
    $("#Fdate").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });

    $("#Tdate").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    
    $("#Tdate1").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    $("#Tdate2").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    $("#Tdate3").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    $("#Tdate4").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    
    $("#Tdate5").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    $("#Tdate6").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    
    $("#Tdate7").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    
    $("#Tdate8").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    
    $("#Tdate9").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    
    $("#Tdate10").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    
    $("#Tdate11").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        onSelect: function(dateText, inst) {
            var date = $.datepicker.parseDate(inst.settings.dateFormat || $.datepicker._defaults.dateFormat, dateText, inst.settings);
            date.setDate(date.getDate() + 7);
            filter();
        }
    });
    
    
    
})
$("#Fdate").datepicker({
    numberOfMonths: 1,
    dateFormat: "yy-mm-dd",
    onSelect: function (selected) {
        var dt = new Date(selected);
        dt.setDate(dt.getDate() + 1);
        $("#Tdate").datepicker("option", "minDate", dt);
    }
});
$("#Tdate").datepicker({
    numberOfMonths: 1,
    dateFormat: "yy-mm-dd",
    onSelect: function (selected) {
        var dt = new Date(selected);
        dt.setDate(dt.getDate() - 1);
        $("#Fdate").datepicker("option", "maxDate", dt);
    }
});




});