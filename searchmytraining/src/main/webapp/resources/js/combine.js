/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


          $ (document).ready(function() {
                $ ('#icon-menu').iconmenu();
            });
//=========================================================================================
 
//==========================================Feedback Js==================================================
            $(document).ready(function() {
                jQuery(".pull_feedback").toggle(function() {
                    jQuery("#feedback").animate({left: "0px"});
                    return false;
                },
                        function() {
                            jQuery("#feedback").animate({left: "-362px"});
                            return false;
                        }
                ); //toggle
            }); //document.ready
//===========================================================================================================

//==========================================Location Js==================================================
              

                function  ShowCountry(val) {


                    document.getElementById("Country").innerHTML = val;
                    document.getElementById("drop").style.display = "none";
                }


                function  ShowCountry(val) {


                    document.getElementById("Country").innerHTML = val;
                    document.getElementById("drop").style.display = "none";
                }


            
                $(document).on('click', '#Country' , function(e){
                	 $("#drop").slideToggle("slow");
                     e.stopPropagation();
                });
                
                $(document).click(function(){
                    $("#drop").slideUp();
                                    })
               
                
                
          //=========================================================================================================
          
          //==========================================Vertical Scroll Images=================================
                window.verticalScroller = function($elem) {
                    var top = parseInt($elem.css("top"));
                    var temp = -1 * $('#verticalScroller > div').height();
                    if (top < temp) {
                        top = $('#verticalScroller').height()
                        $elem.css("top", top);
                    }
                    $elem.animate({top: (parseInt(top) - 70)}, 900, 'linear', function() {
                        window.verticalScroller($(this))
                    });
                }


                $(document).ready(function() {
                    var i = 0;
                    $("#verticalScroller > div").each(function() {
                        $(this).css("top", i);
                        i += 135;
                        window.verticalScroller($(this));
                    });
                });
                    
                 
//===================================================================================================
        

//=======================================================================================================

//===============================garagedoor Image Slider====================================================
                var jQueryScriptOutputted = false;
                function initJQuery() {
                    if (typeof (jQuery) == 'undefined') {
                        if (!jQueryScriptOutputted) {
                            jQueryScriptOutputted = true;

                            document.write("<scr" + "ipt src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js\"></scr" + "ipt>");
                        }
                        setTimeout("initJQuery()", 50);

                    } else {
                        $.getScript('js/jquery.backgroundPosition.js', function() {
                            $("h2").text('This Browser is using a jQuery fallback for this effect.');

                            // Set CSS in Firefox (Required to use the backgroundPosition js)
                            $('#shutter1').css({backgroundPosition: '0px 0px'});
                            $('#shutter2').css({backgroundPosition: '0px 0px'});
                            $('#shutter3').css({backgroundPosition: '0px 0px'});
                            $('#shutter4').css({backgroundPosition: '0px 0px'});

                            // Animate the Shutter  
                            $("#garagedoor a").hover(function() {
                                $(this).parent().stop().animate({backgroundPosition: '(400px 100px)'}, 500);
                            }, function() {
                                $(this).parent().stop().animate({backgroundPosition: '(0px 0px)'}, 500);
                            });

                        });

                    }

                }

                if (!Modernizr.csstransitions) {
                    initJQuery();
                }
//====================================Captcha code==================================================================

        
                function randString(x){
             
                	 var text = " ";

                	    var charset = "QWERTYUIOPASDFGHJKLZXCVBNMabcdefghijklmnopqrstuvwxyz0123456789";

                	    for( var i=0; i < x; i++ )
                	        text += charset.charAt(Math.floor(Math.random() * charset.length));
                	    
                           $(".Ccode").html(text);
                	
                		
                	}
                
                
/*============================================Add class active in Browse training=====================================================*/
               $(document).ready(function() {
				
		
                $('.brow_obpt').on('click', 'li', function(){
                	
                    $('.brow_obpt li').removeClass('active');
                    $(this).addClass('active');
                });
});