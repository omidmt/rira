// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

$( document).ready(function()
{
    $( "#sticker" ).sticky( { topSpacing:0 } );
//    $( 'input[type=text],input[type=email], input[type=password], textarea, select' ).addClass( "form-control" );
    $( 'input[type=text],input[type=email], input[type=password], textarea' ).addClass( "form-control" );
    $( "select" ).selectpicker && $( "select" ).selectpicker( { style: 'btn-md btn-primary', menuStyle: 'dropdown-inverse' } );

//    Date formating for datepicker
//    $( 'input.datepicker' ).each( function( k,v ){ v.value = moment( v.value, 'ddd MMM DD HH:mm:ss YYYY' ).format( 'ddd MMM DD HH:mm:ss YYYY' ) });
    $( '.datepicker' ).datetimepicker && $( '.datepicker' ).datetimepicker( { format: "ddd MMM DD HH:mm:ss YYYY", useStrict: true  } );
//    "Sun Dec 30 12:20:00 IRST 2012"
//    "D M d hh:mm:ss IRST yyyy"
//    "ddd MMM DD HH:mm:ss YYYY"
//    "YYYY-MM-DD HH:mm:ss"
//    "YYYY-MM-DD HH:mm:ss z"
//    $( '#navmenu' ).offcanvas( { autohide: false } );

//    Sidebar menu settings
    $(function () {
        $( '#navmenu' ).offcanvas({
            autohide: false,
            toggle: "offcanvas",
            target: "#navmenu",
            canvas: "#canvas",
            recalc: false,
            disableScrolling: false
        }).offcanvas( 'show' );
    });

    $( '#toggleMenu' ).click( function( e ) {
        $( '#navmenu' ).offcanvas( 'toggle' );
    });

    $( 'ul.dropdown-menu li a' ).click(function(e) {
        e.stopPropagation();
    });
});

function signin()
{
    var cyph = do_encrypt( $( '#username')[0].value + '|' + $( '#password')[0].value );
//    $( '#username' )[0].value = '';
//    $( '#password' )[0].value = '';
    $( '#cyph' )[0].value = cyph;
//    alert( 'SignIn:' + cyph );
    console.log( 'signin' );
    //$( '#loginForm').submit();
    return true;
}

//$(document).ready(function () {
//    $("#navmenu li a").click(function(event) {
//        // check if window is small enough so dropdown is created
//        $("#nav-collapse").removeClass("in").addClass("collapse");
//    });
//});