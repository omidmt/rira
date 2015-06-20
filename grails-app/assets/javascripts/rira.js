// This is a manifest file that'll be compiled into application.js.
// Omid Mehdizadeh omid . mt |@| gmail . com
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

    initEventHandlers();
});

function signin()
{
    var cyph = do_encrypt( $( '#username')[0].value + '|' + $( '#password')[0].value );
    //$( '#username' )[0].value = '';
    //$( '#password' )[0].value = '';
    $( '#cyph' )[0].value = cyph;
//    alert( 'SignIn:' + cyph );
//    console.log( 'signin' );
    //$( '#loginForm').submit();
    return true;
}

//$(document).ready(function () {
//    $("#navmenu li a").click(function(event) {
//        // check if window is small enough so dropdown is created
//        $("#nav-collapse").removeClass("in").addClass("collapse");
//    });
//});


function loadNAppend( url, parent )
{
    $.ajax({
        url: url,
        cache: false
    }).done(function( html ) {
        $( parent ).append( html );
    })
}

function loadNAppendAsCollapsiblePanel( name, url, parent )
{
    $.ajax({
        url: url,
        cache: false
    }).done(function( html ) {
        appendCollapsiblePanel( name, parent, html );
    });
}


function appendCollapsiblePanel( name, parent, item )
{
    var stdName = name.replace(/\s/g, "_");
    var html = '<div class="panel panel-default">' +
        '<div class="panel-heading" role="tab" id="heading' + stdName + '">' +
        '<h4 class="panel-title">' +
        '<a data-toggle="collapse" data-parent="' + parent + '" href="#collapse' + stdName +'" aria-expanded="true" aria-controls="collapse' + stdName + '">' + name + '</a>' +
        '</h4>' +
        '</div>' +
        '<div id="collapse' + stdName + '" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading' + stdName + '">' +
        '<div class="panel-body">' +
        item +
        '</div>' +
        '</div>' +
        '</div>';

    $( parent ).append( html );
}

/****
 * generic function to submti a form by ajax
 * @param container The elemet that contains the form
 * @param successFunction the function ti be executed after successful ajax query
 * if it is null or a non function value, is ignored. It should accept only parameter as result data
 * @returns false to prevent form submission
 */
function submitFormAjax( container, successFunction, errorFunction ) {
    //var data = $( container + ' form' ).serialize();
    var data = JSON.stringify( $( container + ' form' ).serializeObject() );
    if( data.length < 0 )
    {
        //return false;
    }
    var url = $( container + ' form' ).attr( 'action' );
    var method = $( container + ' form' ).attr( 'method' );

    if( method == undefined )
        method = 'post';

    $.ajax({
        type: method,
        url: url + '.json',
        data: data,
        contentType: 'application/json',
        success: function( data, textStatus, jqXHR )
        {
            if( $.isFunction( successFunction )) {
                successFunction( data, textStatus, jqXHR );
            }
        },
        error: function( jqXHR, textStatus, errorThrown )
        {
            if( $.isFunction( errorFunction )) {
                errorFunction( jqXHR, textStatus, errorThrown );
            }
        }
    });
    return false;
}

/****
 * Initialize event handlers like form submit, menu click, ...
 */
function initEventHandlers() {

    $( '#toggleMenu' ).click( function( e ) {
        $( '#navmenu' ).offcanvas( 'toggle' );
    });

    $( 'ul.dropdown-menu li a' ).click(function(e) {
        e.stopPropagation();
    });

    $( '#' + rDialogSaveBtn ).click( function(){
        submitFormAjax( '#' + rDialog, dialogSuccessSubmission, dialogFailedSubmission )
    }  );
}


/****
 * Add json form serializer function to jQuery
 * @returns {{}}
 */
$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

//RIRA layout dialog related function
/****
 * Load the content of the dialog
 * @param url the path to load dialog content
 */
function loadDialog( url, target )
{
    target = typeof target !== 'undefined' ? target : null;
    $( '#' + rDialogBody ).load( url )

    if( target == null )
    {
        return;
    }

    $( '#' + rDialogBody ).data( 'target', target );
    $( '#' + rDialogLabel ).html( target.camelCase() );
}

function dialogSuccessSubmission( data )
{
    $( '#' + rDialog ).modal( 'hide' );
    var target = $( '#' + rDialogBody ).data( 'target' );

    if( typeof target === 'undefined' )
    {
        console.log( 'Type of taget is undefined.' );
        return;
    }

    // Update target field of dialog
    var typeOfTarget = $( target ).prop( 'tagName' );

    if( typeof typeOfTarget !== 'undefined' ) {
        if( typeOfTarget.toUpperCase() == 'SELECT' ) {
            var html = '<option value="' + data.id + '">' + ( 'name' in data ?  data.name : data.id ) + '</option>';
            $( target ).append( html );
            $( target ).val( data.id.toString() );
        }
        else if( typeOfTarget.toUpperCase() == 'UL'  )
        {
            var link = $( taget ).data( 'link' );
            var html = '<li><a href="' + link + data.id + '">' + 'name' in data ? data.name : data.id + '</li>';
            $( target ).prepend( html );
        }
        else
        {
            console.log( 'Type of taget is not supported: ' + typeOfTarget );
        }
    }
    else
    {
        console.log( 'Type of target is undefined.' );
    }

}

function dialogFailedSubmission( jqXHR )
{
    data = 'responseJSON' in jqXHR ? jqXHR.responseJSON : []
    errors = 'errors' in data ? data.errors : []

    var html = '<div class="alert alert-danger" role="alert">';

    for( i in errors )
    {
        html += 'message' in errors[i] ? errors[i].message : 'Unknown Error' + '<br/>';
    }

    html += '</div>';

    $( '#' + rDialogBody ).scrollTop( 0 );
    $( '#' + rDialogBody ).prepend( html );


}