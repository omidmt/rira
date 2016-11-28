/**
 * Created by Omid Mehdizadeh on 7/3/2014.
 */

var CONTROLLER_TEMPLATE = 'template';
var CONTROLLER_NOTIFICATION_HISTORY = 'notificationHistory';
var ACTION_SHOW = 'show';

$(function() {
        $('#template').off();
        $('#template').on('change', function () {
            RIRA.requestJSON('GET',
                CONTROLLER_TEMPLATE,
                ACTION_SHOW,
                loadTemplate,
                function () {
                    console.error('Loading notification template failed');
                },
                null,
                this.value
            );
        });

        $('#history').off();
        $('#history').on('change', function () {
            RIRA.requestJSON('GET',
                CONTROLLER_NOTIFICATION_HISTORY,
                ACTION_SHOW,
                loadTemplate,
                function () {
                    console.error('Loading history failed');
                },
                null,
                this.value
            );
        });
    }
);

function loadTemplate( data, status, postData, id) {
    if( data )
    {
        if( 'content' in data )
            $('#message').val(data.content);
        else if( 'message' in data )
            $('#message').val(data.message);
        updateLength();
    }
}

function updateLength() {
    var len = $('#message').val().length;
    $('#msgLen').html(len);
}