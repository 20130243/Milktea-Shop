$(document).ready(function () {
    $(".delete-btn").click(function () {

        if (window.confirm("Bạn muốn xóa " + $(this).attr("data-name") + " ?")) {
            url = "#delete-form-" + $(this).attr("data-id");
            $(url).submit();
        } else {
            return false;
        }
    })
})