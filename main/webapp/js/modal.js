



$(document).ready(function () {

    $('#modal-sum-btn').click(function (e) {
        $('#modal-quantity').val(parseInt($('#modal-quantity').val()) + 1);
    });
    $('#modal-sub-btn').click(function (e) {
        if (parseInt($('#modal-quantity').val()) > 1) {
            $('#modal-quantity').val(parseInt($('#modal-quantity').val()) - 1);
        }

    });
});
