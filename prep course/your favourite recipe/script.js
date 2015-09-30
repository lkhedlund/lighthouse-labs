var main = function () {
    $('#directions li').prepend('<input type="checkbox">');
    $('#ingredients li').click(function() {
        $(this).wrap('<strike>')
    });
    $('#text_only').click(function() {
        $('img').toggle();
    });
};
