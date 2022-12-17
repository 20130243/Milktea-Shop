
var btnCart = document.getElementsByClassName('modal-btn');
for (var i = 0; i < btnCart.length; i++) {
    btnCart[i].addEventListener("click", function () {
        var name = document.getElementById('name');
        var testName = document.getElementById('test');
        testName.innerHTML = name.innerHTML;
    })
}
