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

function assertArraysEqual(a, b, comment) {
  var status = $('<div>')
      .addClass('result')
      .appendTo($('#test-results .inner'));

  if(arraysEqual(a, b)) {
    status.removeClass('fail').addClass('success').html("Correct!");
  } else {
    status.removeClass('success').addClass('fail').html(":( Test is currently failing... ");
    status.append(" <a href=''>Refresh</a> to try again. ");
  }

  if(comment !== undefined) {
    status.append(" (" + comment + ")");
  }
}

function arraysEqual(a, b) {
  if (a === b) return true;
  if (a == null || b == null) return false;
  if (a.length != b.length) return false;

  for (var i = 0; i < a.length; ++i) {
    if (a[i] !== b[i]) return false;
  }
  return true;
}

$(document).ready(function(){

    var testArea = $('<div>')
        .attr('id', 'test-results')
        .appendTo('body');

    var inner = $('<div>')
        .addClass('inner')
        .appendTo(testArea);
});
