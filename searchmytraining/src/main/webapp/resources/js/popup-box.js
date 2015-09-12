/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//    ===============================Enquiry form=========================================================
;
(function($) {
    $(function() {
        $('.my-button').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box').bPopup({
            	
            	contentContainer:'.enquiryt',
                loadUrl: 'TER'
          
            });
        });
    });
})(jQuery);

//    ===========================================Group Training=============================================
;
(function($) {
    $(function() {
        $('.my-button-new').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_1').bPopup({
            	
            	contentContainer:'.grouptraining',
                loadUrl: 'GTR'
          
            });
        });
    });
})(jQuery);
//    ============================================trainee============================================
;
(function($) {
    $(function() {
        $('#regi_pop').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_2').bPopup({
            	contentContainer:'.traineebox',
                loadUrl: 'TR'
            	
           
            } );
        });
    });
})(jQuery);
//    ========================================================================================


//    ========================================================================================


 // ======================================Training Provider Registration==================================================

;(function($) {
    $(function() {
        $('#regi_pop2').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_4').bPopup({
            	contentContainer:'.tproviderbox',
                loadUrl: 'TPR'
           
            });
        });
    });
})(jQuery);
//    ===============================================Sign in page=========================================
;(function($) {
    $(function() {
        $('#sign-up').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_6').bPopup({
            	closeClass:'close1',
                follow: [false, false],           
                 contentContainer:'.signin',
                 loadUrl: 'sign'
           
            });
        });
    });
})(jQuery);
//=========================================================================
;(function($) {
    $(function() {
        $('.login_pop').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_5').bPopup({
            	contentContainer:'.logpag',
                loadUrl: 'LoginH'
            	
            });
            $('#pop_up_box_6').hide();
        });
    });
})(jQuery);
//=========================================================================
/*;(function($) {
    $(function() {
        $('.login_pop2').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_5').bPopup({
            	contentContainer:'.logpag',
                loadUrl: 'LoginH'
            });
            $('#pop_up_box_6').hide();
            
            
        });
    });
})(jQuery);
//=========================================================================
;(function($) {
    $(function() {
        $('.login_pop3').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_5').bPopup({
            	
            } );
            $('#pop_up_box_6').hide();
        });
    });
})(jQuery);*/

//=========================================================================

;(function($) {
    $(function() {
        $('#regi_pop3').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_8').bPopup({
            	contentContainer:'.boxContaint',
                loadUrl: 'FLR'
            
            } );
        });
    });
})(jQuery);
	



//=================================Advance search========================================

(function($) {
    $(function() {
        $('#advsearch1').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_9').bPopup({
            	contentContainer:'.advances',
                loadUrl: 'AdvSearch'
          
            } );
        });
    });
})(jQuery);

//======================================Place Add==========================================
;(function($) {
    $(function() {
        $('#placeadd').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_10').bPopup({
            
            
            } );
        });
    });
})(jQuery);
/*======================Get Contact=============================*/
(function($) {
    $(function() {
        $('.Get_C').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_11').bPopup({
            } );
        });
    });
})(jQuery);
/*======================view Details=============================*/
(function($) {
    $(function() {
        $('.group').bind('click', function(e) {
            e.preventDefault();
            $('#pop_up_box_1').bPopup({
            } );
       
        });
    });
})(jQuery);


