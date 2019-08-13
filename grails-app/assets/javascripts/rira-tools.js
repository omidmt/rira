/**
 * Created by eomimeh on 1/01/2017.
 */

var RIRA =  (function (rira) {
    rira.VERSION = '0.7.4';

    rira.REQUEST_TYPE_JSON = 'json';
    rira.REQUEST_TYPE_HTML = 'html';
    rira.REQUEST_TYPE_XML = 'xml';

    rira.request = function(method, type, controller, action, successFunc, errorFunc, postData, id) {
        var baseUrl;
        if(typeof window.grailsSupport !== 'undefined')
            baseUrl = window.grailsSupport.baseUrl;
        else if(typeof window.grails !== 'undefined')
            baseUrl = window.grails.baseUrl;
        else {
            console.error('window.grails is not set, check layout is rira compatible or not. request failed.');
            return false;
        }

        var contentType = '';
        var extension = '';
        switch(type) {
            case rira.REQUEST_TYPE_HTML:
                contentType = 'text/html';
                extension = '';
                break;
            case rira.REQUEST_TYPE_JSON:
                contentType = 'application/json';
                extension = '.json'
                break;
            case rira.REQUEST_TYPE_XML:
                contentType = 'application/xml';
                extension = '.xml'
                break;
        }

        $.ajax({
            type: method,
            url: baseUrl + controller + '/' + action + (typeof id != 'undefined' ? '/' + id : '') + extension,
            contentType: contentType,
            data: postData,
            success: function(responseData, textStatus, jqXHR) {
                successFunc(responseData, jqXHR.status, postData, id);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                errorFunc(jqXHR, textStatus, errorThrown, postData, id);
            }
        });
    };

    rira.requestJSON = function(method, controller, action, successFunc, errorFunc, postData, id) {
        return rira.request(method, rira.REQUEST_TYPE_JSON, controller, action, successFunc, errorFunc, postData, id);
    };

    rira.requestHTML = function(method, controller, action, successFunc, errorFunc, postData, id) {
        return rira.request(method, rira.REQUEST_TYPE_HTML, controller, action, successFunc, errorFunc, postData, id);
    };

    rira.requestXML = function(method, controller, action, successFunc, errorFunc, postData, id) {
        return rira.request(method, rira.REQUEST_TYPE_XML, controller, action, successFunc, errorFunc, postData, id);
    };

    rira.getMessage = function(jqXHR) {
        var status = jqXHR.status;
        var msg = jqXHR.statusText;

        switch(status) {
            case 500:
            case 422:
                return "Operation failed, server error."
            case 401:
                return "Unauthorized operation";
            default:
                return "Error";
        }
    };

    return rira;
}(RIRA || {}));
