/**
 * Created by eomimeh on 7/3/2014.
 */


function loadTemplate( data )
{
    if( data )
    {
        if( 'content' in data )
            $( '#message' ).val( data.content );
        else if( 'message' in data )
            $( '#message' ).val( data.message );
        updateLength();
    }
}

function updateLength()
{
    var len = $( '#message' ).val().length;
    $( '#msgLen' ).html( len );
}