/**
 * 
 */

function Validate() {
	var image = document.getElementById("fileupload").value;
	if (typeof image === 'undefined' && image == '' && image == null) {
		alert("Please enter Image Path");
		document.getElementById("image").focus();
		return false;
	}
	var title = document.forms["Add_calender"]["ctitle"].value;
    if (title == null || title == "") {
        alert("Name must be filled out");
        return false;
    }
}


function checkEmail() {

    var email = document.getElementById('txtEmail');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
    return false;
 }
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function isAlphaNumeric(str) {
	  var code, i, len;
	  for (i = 0, len = str.length; i < len; i++) {
	    code = str.charCodeAt(i);
	    if (!(code > 47 && code < 58) && // numeric (0-9)
	        !(code > 64 && code < 91) && // upper alpha (A-Z)
	        !(code > 96 && code < 123)) { // lower alpha (a-z)
	      return false;
	    }
	  }
	  return true;
}

(function() {
    var elm = document.getElementById('Chour'),
        df = document.createDocumentFragment();
    for (var i = 1; i <= 12; i++) {
        var option = document.createElement('option');
        option.value = i;
        option.appendChild(document.createTextNode(i));
        df.appendChild(option);
    }
    elm.appendChild(df);
}());
(function() {
    var elm = document.getElementById('Cmin'),
        df = document.createDocumentFragment();
    for (var i = 01; i <60; i++) {
        var option = document.createElement('option');
        option.value = i;
        option.appendChild(document.createTextNode(i));
        df.appendChild(option);
    }
    elm.appendChild(df);
}());

