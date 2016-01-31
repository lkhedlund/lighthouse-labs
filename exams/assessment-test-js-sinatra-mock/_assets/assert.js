function assert(condition, comment) {
    var status = $('<div>')
        .addClass('result')
        .appendTo($('#test-results .inner'));

    if(condition) {
        status.removeClass('fail').addClass('success').html("Correct!");
    } else {
        status.removeClass('success').addClass('fail').html(":( Test is currently failing... ");
        status.append(" <a href=''>Refresh</a> to try again. ");
    }


    if(comment !== undefined) {
        status.append(" (" + comment + ")");
    }
}

$(document).ready(function(){

    var testArea = $('<div>')
        .attr('id', 'test-results')
        .appendTo('body');

    var inner = $('<div>')
        .addClass('inner')
        .appendTo(testArea);
});
