/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * Author:prashant Maskar
 */
                                                                                                                                                                                                                                         


 $(function() {
        var scntDiv = $('#achiv');
        /*var i = $('#achiv p').size() + 1;*/
        
        var assocNamesSize = $('#assocNameSize').val();
        var i = parseInt(assocNamesSize);
        i++;
        
        $('.addScnt').live('click', function() {
            $('<p style="margin-left:253px;"><select id="phonetypeid'+ i +'" onchange="return contactValidation();" style="margin-right:10px;"><option value="0" name="state">--Select--</option><option value="1">OFFICE-MOBILE</option><option value="2">OFFICE-LANDLINE</option><option value="3">PERSONAL-MOBILE</option><option value="5">FAX</option><option value="6">TOLL FREE</option><input type="text" id="institutecontact' + i +'" size="20" placeholder="Please Enter Number" name="institutecontact' + i +'" onkeypress="return validate15(event)"/> <a href="#" id="remScnt"><img style="margin-left:10px;margin-top:5px;float:left;" src="resources/images/Cancel-128.png"></a><input type="button" value="+" class="addScnt"><span id="error'+ i +'"></span></p>').appendTo(scntDiv);
                i++;
               $(this).hide();
        });
        
        $('#remScnt').live('click', function() { 
                if( i > 2 ) {
                	 $(this).closest('p').remove();
                        i--;
                }
                $('#achiv p').last().find('.addScnt').show();
                return false;
        });
});

 $(function() {
     var scntDiv = $('#cont');
     var i = $('#cont p').size() + 1;
     
     $('.addcontact').live('click', function() {
         $('<p style="margin-left:253px;"><select id="phonetypeid' + i +'" required><option value="0">--Select--</option><option value="3">PERSONAL-MOBILE</option><option value="4">PERSONAL-LANDLINE</option><input type="text" id="phonevalue'+i+'" size="20" name="phonevalue' + i +'"/> <a href="#" id="remScnt"><img style="margin-top:5px;float:left;margin-left:5px;" src="resources/images/Cancel-128.png"></a> <input type="button" value="+" class="addcontact"></p>').appendTo(scntDiv);
             i++;
             $(this).hide();
     });
     $('#remScnt').live('click', function() { 
             if( i > 2 ) {
                     $(this).closest('p').remove();
                     i--;
             }
             $('#cont p').last().find('.addcontact').show();
             return false;
     });
});

 
 $(function() {
     var scntDiv = $('#cont');
     var i = $('#cont p').size() + 1;
     
     $('.addcontact1').live('click', function() {
         $('<p style="margin-left:253px;height:30px;"><select id="traineephoneid' + i +'" required><option value="0">--Select--</option><option value="1">OFFICE-MOBILE</option><option value="2">OFFICE-LANDLINE</option><option value="3">PERSONAL-MOBILE</option><option value="4">PERSONAL-LANDLINE</option></select><input type="text" id="traineephone' + i +'"  required size="20" name="traineephone' + i +'" onkeypress="return validate13(event)"/><a href="#" id="remScnt"><img style="margin-top:5px;float:left;" src="resources/images/Cancel-128.png"></a><input style="margin-left:10px;" type="button" class="addcontact1" value="+"/></p>').appendTo(scntDiv);
         i++; 
            $(this).hide();
           
           
     });
     
     $('#remScnt').live('click', function() { 
             if( i > 2 ) {
                     $(this).closest('p').remove();
                    
                    i--;
                   
             }
             
             $('#cont p').last().find('.addcontact1').show();
             return false;             
     });
    
});
 
$(function() {
        var scntDiv = $('#association');
        /*var i = $('#association p').size() + 1;*/
        var assocNamesSize = $('#assocNameSize').val();
        var i = parseInt(assocNamesSize);
        i++;
        
        $('.addAsso').live('click', function() {
            $('<p style="margin-left:253px;"><input type="text" id="assocName'+ i +'" size="20" name="a_scnt_' + i +'"/><a href="#" id="remScnt"> <img style="margin-left:5px;margin-top:5px;float:left;" src="resources/images/Cancel-128.png"></a> <input type="button" class="addAsso" value="+"> </p>').appendTo(scntDiv);
                i++;
                $(this).hide();
        });
        
        $('#remScnt').live('click', function() { 
                if( i > 2 ) {
                        $(this).closest('p').remove();
                        i--;
                }
                $('#association p').last().find('.addAsso').show();
                return false;
        });
});


$(function() {
        var scntDiv = $('#client');
        /*var i = $('#client p').size() + 1;*/
        var clientSize = $('#clientSize').val();
        var i = parseInt(clientSize);
        i++;
        $('.addClient').live('click', function() {
            $('<p style="margin-left:253px;"><input type="text" id="clientName'+i+'" size="20" name="clientName'+i+'"/><a href="#" id="remScnt"><img style="margin-top:5px;float:left;margin-left:5px;" src="resources/images/Cancel-128.png"></a> <input type="button" value="+" class="addClient"> </p>').appendTo(scntDiv);
                i++;
                $(this).hide();
        });
        
        $('#remScnt').live('click', function() { 
                if( i > 2 ) {
                        $(this).closest('p').remove();
                        i--;
                }
                $('#client p').last().find('.addClient').show();
                return false;
        });
});

$(function() {
        var scntDiv = $('#achiv2');
        var i = $('#achiv2 p').size() + 1;
        
        $('.addAward').live('click', function() {
            $('<p><span>Award Name:</span> <input type="text" name="award' + i +'"/> <span>Type:</span> <select><option value="1">1</option><option value="2">2</option><option value="3">3</option></select> <span>Year Of Received:</span> <input style="width: 80px;" type="text"  value="" name="year' + i +'"/>  <input  type="file"><a href="#" id="remScnt"><img style="float:left;margin-top:5px;float:left;" src="resources/images/Cancel-128.png"></a><input style="margin-left:10px;" type="button" class="addAward" value="+"></p>').appendTo(scntDiv);
                i++;
                $(this).hide();
        });
        
        $('#remScnt').live('click', function() { 
                if( i > 2 ) {
                        $(this).closest('p').remove();
                        i--;
                }
                
                $('#achiv2 p').last().find('.addAward').show();
                return false;
        });         
});

