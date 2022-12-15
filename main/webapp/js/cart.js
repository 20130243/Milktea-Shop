if (document.readyState == "loading") {
    document.addEventListener("DOMContentLoaded", ready);
} else {
    ready();
}

function ready() {
    var btn_remove = document.getElementsByClassName("remove");
    for (var i = 0; i < btn_remove.length; i++) {
        var btn = btn_remove[i];
        btn.addEventListener("click", removeCartItem);
    }

    var quantityInputs = document.getElementsByClassName("quantity");
    for (var i = 0; i < quantityInputs.length; i++) {
        var input = quantityInputs[i];
        input.addEventListener("change", quantityChanged);
    }

    var addToCartButton = document.getElementsByClassName("modal-btn")
    for(var i = 0; i < addToCartButton.length; i++) {
        var btn = addToCartButton[i];
        btn.addEventListener("click", addToCartClick);
    }
}

function removeCartItem(event) {
    var btn_tager = event.target;
    btn_tager.parentElement.parentElement.parentElement.remove();
    updateCartTotal();
}

function quantityChanged(event) {
    var input = event.target;
    if (isNaN(input.value) || input.value <= 0) {
        input.value = 1;
    }
    updateCartTotal();
}

function updateCartTotal() {
    var cartItemtContainer =
        document.getElementsByClassName("cart-product-list")[0];
    var cartRows = cartItemtContainer.getElementsByClassName("cart-product-item");
    var total = 0;
    for (var i = 0; i < cartRows.length; i++) {
        var cartRow = cartRows[i];
        var priceElement = cartRow.getElementsByClassName(
            "cart-product-detail-price"
        )[0];
        var quantityElement = cartRow.getElementsByClassName("quantity")[0];
        var price = parseInt(priceElement.innerText.replace(/[^0-9]+/g, ''));
        var quantity = quantityElement.value;
        var number = priceElement.innerText;
        total = total + price * quantity;
        document.getElementsByClassName("cart-product-price")[i].innerText =
            price.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }) + " x " + quantity + " = " + (price * quantity).toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });
    }
    document.getElementsByClassName("price")[0].innerText = total.toLocaleString('vi-VN', {
        style: 'currency',
        currency: 'VND'
    });
}

function addToCartClick(event) {
    var btn = event.target;
    var shopItem = btn.parentElement.parentElement.parentElement;
    var title = shopItem.getElementsByClassName("product-modal-header")[0].innerText
    var sizes = shopItem.getElementsByClassName("size");
    var price = shopItem.getElementsByClassName("product-modal-price")[0].innerText
    var toppings = shopItem.getElementsByClassName("topping-checked");
    var quantity = shopItem.getElementsByClassName("quantity-num")[0].value;
    var imgSrc = shopItem.getElementsByClassName("img-src")[0].src;
    var size = null;
    for (var i = 0; i < sizes.length; i++) {
        var sizeCheck = sizes[i];
        if(sizeCheck.checked) {
            size = sizeCheck.value;
        }
    }
    var toppingName = [];
    var topppingPrice = [];
    for (var i = 0; i < toppings.length; i++) {
        var toppingCheck = toppings[i];
        if(toppingCheck.checked) {
            toppingName[i] = toppingCheck.name;
            topppingPrice[i] = toppingCheck.value;
        }
    }
    const valueToRemove = null;
    toppingName = toppingName.filter(item => item !== valueToRemove);
    topppingPrice = topppingPrice.filter(item => item !== valueToRemove);

    console.log(toppingName, topppingPrice)
    addItemToCart(title, price, size,toppingName, topppingPrice, quantity, imgSrc);
    updateCartTotal();
}
//
// function addItemToCart(title, price, size,toppingName, topppingPrice, quantity,imgSrc) {
//     var cartRow = document.createElement('div');
//     cartRow.classList.add("cart-product-item");
//     var price = parseInt(price.replace(/[^0-9]+/g, ''));
//     if(topppingPrice.length > 0) {
//         for(var i = 0; i < topppingPrice.length; i++) {
//             price = price + parseInt(topppingPrice[i]);
//         }
//     }
//     var cartItems = document.getElementsByClassName('cart-product-list ')[0]
//
//     var cartRowContents = `
//                                         <div class="cart-product-name">
//                                         <img src="${imgSrc}" width="32" height="32">
//                                         <h5 class="name-product"> ${title + '(' + size +')'}</h5>
//                                     </div>
//                                     <div style="display: none">
//                                         <div>Giá: <p class="cart-product-detail-price">${price}</p></div>
//                                     </div>
//                                     <div class="cart-product-detail justify-content-between">
//                                         <div class="detail">Topping: </div>
//                                         <div class="cart-product-quantity">
//                                             <input class="cart-quantity-input quantity" type="number" value="${quantity}">
//                                             <i class="fa-solid fa-xmark remove"></i>
//                                         </div>
//                                     </div>
//                                     <div class="cart-product-price">
//                                     </div>`
//     cartRow.innerHTML = cartRowContents;
//     if(topppingPrice.length > 0) {
//         for(var i = 0; i < toppingName.length; i++) {
//             var add = cartRow.getElementsByClassName("detail")[0].innerText += toppingName[i] + ', ';
//         }
//
//     }
//
//     cartItems.append(cartRow);
//     cartRow.getElementsByClassName("remove")[0].addEventListener("click", removeCartItem);
//     cartRow.getElementsByClassName("quantity")[0].addEventListener("change", quantityChanged);
// }
