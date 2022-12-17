
if (document.readyState == "loading") {
    var modal = document.getElementsByClassName("modal");
    for (var i = 0; i < modal.length; i++) {
        var modalElement = modal[i];
        modalElement.addEventListener("DOMContentLoaded", ready);
    }

} else {
    ready();
}

function ready() {
    var quantityInputs = document.getElementsByClassName("quantity-num");
    for (var i = 0; i < quantityInputs.length; i++) {
        var input = quantityInputs[i];
        input.addEventListener("change", quantityChanged);
    }

    var sizes = document.getElementsByClassName("size");
    for (var i = 0; i < sizes.length; i++) {
        var item = sizes[i];
        item.addEventListener("change", selectSize);
    }

    var toppings = document.getElementsByClassName("topping-checked");
    for (var i = 0; i < toppings.length; i++) {
        var item = toppings[i];
        item.addEventListener("change", selectTopping)
    }


}

function quantityChanged(event) {
    var item = event.target;
    var nameModal = item.name.split('quantity')[1];
    if (isNaN(item.value) || item.value <= 0) {
        item.value = 1;
    }
    getPriceToppings(nameModal);
    updatePrice(nameModal);
}


function selectSize(event) {
    var item = event.target;
    var nameModal = item.name.split('size')[1];
    var idModal = "myModal"+nameModal;
    var modalElement = document.getElementById(idModal);
    var idSizeElement = "price"+nameModal+item.value;
    var sizeElement = document.getElementsByClassName(item.name);

    for (var i = 0; i < sizeElement.length; i++) {
     var size = sizeElement[i];
     if(size.classList.contains("active")) {
         size.classList.add("d-none");
         size.classList.remove("active")
     } else {
         size.classList.add("active");
         size.classList.remove("d-none")
     }
    }
    getPriceToppings(nameModal);
    updatePrice(nameModal);
}

function selectTopping(event) {
    var item = event.target;
    var idModal = item.getAttribute("data-id");
    getPriceToppings(idModal);
    updatePrice(idModal);
}


function updatePrice(idModal) {
    var myModal = "myModal"+idModal;
    var modalItemsContainer = document.getElementById(myModal);
    var itemRows = modalItemsContainer.getElementsByClassName("product-modal");
    var total = 0;
    for (var i = 0; i < itemRows.length; i++){
        var itemRow = itemRows[i];
        var namePrice = "size" +idModal;
        var price = 0;
        var priceElements = itemRow.getElementsByClassName(namePrice);
        for (var i = 0; i <priceElements.length; i++){
            var priceElement = priceElements[i];
            if (priceElement.classList.contains("active")){
                price = priceElement.innerText;
            }
        }


        var quantityElement = itemRow.getElementsByClassName("quantity-num")[0];
        var quantity = quantityElement.value;
        price = parseInt(price.replace(/[^0-9]+/g, ''));
        price += getPriceToppings(idModal);
        quantity = Number(quantity);
        total = price * quantity;
        var namePriceTotal = "totalprice"+idModal;
        var priceTotalElement = document.getElementById(namePriceTotal);
        priceTotalElement.innerText = total.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });
    }
}

function getPriceToppings(idModal){
    var myModal = "myModal"+idModal;
    var modalItemsContainer = document.getElementById(myModal);
    var itemRows = modalItemsContainer.getElementsByClassName("product-modal");
    var price = 0;
    for (var i = 0; i < itemRows.length; i++){
        var itemRow = itemRows[i];
        var toppings = itemRow.getElementsByClassName("topping-checked");
        for (var i = 0; i < toppings.length; i++) {
            var toppingChose = toppings[i];
            if(toppingChose.checked) {
                var nameTopping = toppingChose.value;
                var priceTopping = itemRow.getElementsByClassName(nameTopping)[0].innerText;
                var priceToppingChose = Number(priceTopping);
                price += priceToppingChose;

            }
        }
    }
    return price;
}