            $(document).ready(function() {
                $('#icon-menu').iconmenu();
            });
//==============================================================================

//==============================================================================
            $('#add').click(function() {
                $('.acord_cont').append('.contact');
            });
            
//=======================Vertical menu=========================================
                    $(function() {
                        $('#sidemenu a').on('click', function(e) {
                            e.preventDefault();

                            if ($(this).hasClass('open')) {
                                // do nothing because the link is already open
                            } else {
                                var oldcontent = $('#sidemenu a.open').attr('href');
                                var newcontent = $(this).attr('href');

                                $(oldcontent).fadeOut('fast', function() {
                                    $(newcontent).fadeIn().removeClass('hidden');
                                    $(oldcontent).addClass('hidden');
                                });


                                $('#sidemenu a').removeClass('open');
                                $(this).addClass('open');
                            }
                        });
                    });
                    
                    $('#acord1').accordion({
                        collapsible: true
                    });
                    
                    $('#acord2').accordion({
                        collapsible: true
                    });