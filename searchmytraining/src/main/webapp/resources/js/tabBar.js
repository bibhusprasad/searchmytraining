/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * Author:Prashant Maskar
 */
//========================================Main Page tab bar===================================================


$(function() {
    $('#tabmenu a').on('click', function(e) {
        e.preventDefault();

        if ($(this).hasClass('open')) {
            // do nothing because the link is already open
        } else {
            var oldcontent = $('#tabmenu a.open').attr('href');
            var newcontent = $(this).attr('href');

            $(oldcontent).fadeOut('fast', function() {
                $(newcontent).fadeIn().removeClass('hidden');
                $(oldcontent).addClass('hidden');
            });


            $('#tabmenu a').removeClass('open');
            $(this).addClass('open');
        }
    });
});
//========================================Form Page tab bar===================================================
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
//=============================Form Page horizontal tab bar================================
/*$(function() {
    $('#topmenu a').on('click', function(e) {
        e.preventDefault();

        if ($(this).hasClass('open')) {
            // do nothing because the link is already open
        } else {
            var oldcontent = $('#topmenu a.open').attr('href');
            var newcontent = $(this).attr('href');

            $(oldcontent).fadeOut('fast', function() {
                $(newcontent).fadeIn().removeClass('hidden');
                $(oldcontent).addClass('hidden');
            });


            $('#topmenu a').removeClass('open');
            $(this).addClass('open');
        }
    });
});*/