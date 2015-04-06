/**
 * Created by eomimeh on 8/21/2014.
 */

function checkConsistency()
{
    $.ajax( "/nodeState/checkConsistency",
        {
            dataType: 'json'
        })
        .done(function() {
            alert( "success" );
        })
        .fail(function() {
            alert( "error" );
        })
        .always(function() {
            alert( "complete" );
        });
}
