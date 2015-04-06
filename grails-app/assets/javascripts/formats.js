/**
 * Created by eomimeh on 12/17/2014.
 */

function formatNodes( nodes )
{
    $( '#nodes' ).empty();

    var html = '<div class="row">';
    $.each( nodes, function( key, val ) {
        html += '<div class="col-md-2"><label class="simple-label"><input name="nodes" type="checkbox" ' +
                             'value="' + val[ 'id' ] + '"> ' + val[ 'name' ] + '</label></div>';
    } );
    html += '</div>';

    html += '<div class="col-md-2"><label class="simple-label"><input name="all" onclick="toggleAllChkBox( \'#nodes\', this )" ' +
                         'type="checkbox" value="All"> All</label></div></div>';
    $( '#nodes' ).append( html );
}

function formatModules( modules )
{
    $( '#module' ).empty();

    var html = '<option value=""></option>';
    $.each( modules, function( key, val ) {
        html += '<option value="' + val + '">' + val + "</option>";
    } );

    $( '#module').append( html );
}

function formatNodesAndModules( data )
{
    formatNodes( data[ 'nodes' ] );
    formatModules( data[ 'modules' ] );
}

function formatLevels( levels )
{
    $( '#level').empty();
    var html = '';
    $.each( levels, function( key, val ) {
        html += '<option value="' + val[ 'id' ] + '">' + val[ 'name' ] + ' [' + val[ 'module' ][ 'name' ] + "]</option>";
    } );

    $( '#level').append( html );
}

function toggleAllChkBox( container, object )
{
    if( object.checked )
        $( container + ' input[name*=node]' ).prop( 'checked', true );
    else
        $( container + ' input[name*=node]' ).prop( 'checked', false );
}

function selectAllChkBox( container )
{
    $( container + ' input[name*=node]' ).prop( 'checked', true );
}

function unselectAllChkBox( container )
{
    $( container + ' input[name*=node]' ).prop( 'checked', false );
}