<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Size" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProducService" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.PriceSize" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Topping" %>
<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/3/2022
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html lang="zxx">

<head>

    <link rel="stylesheet" href="css/modal.css" type="text/css">
</head>

<body>
<!-- Page Preloder -->
<%
   String id = (String) request.getParameter("id");
   int id_product = Integer.parseInt(id);
   Product p = new ProducService().getById(id_product);
    CurrencyFormat  currency = new CurrencyFormat();
    String priceP = "0";
    if(p.getPriceSize().size() > 0) {
        priceP  = currency.format((int) p.getPriceSize().get(0).getPrice());
    }
    String totalPrice = priceP;
    int count = p.getId();
%>
<form action="addToCart" method="get">
<div id="myModal<%=p.getId()%>" class="modal fade in" tabindex="-1" role="dialog">

    <div class="modal-dialog product-modal" role="document">
        <div class="modal-content flex-row">
            <div class="w-50">
                <div class="product-modal-img">
                    <img class="img-src" src="<%=p.getImg()%>">
                </div>
                <div class="product-modal-price">
                    <h6 id="price<%=p.getId()%>"> <%=priceP%></h6>
                </div>

            </div>
            <div class="w-50 product-modal-detail">
                <div class="product-modal-header">
                    <h3><%=p.getName()%>
                    </h3>
                    <input class="product-modal-id" type="text" name="product_id" value="<%=p.getId()%>" checked="checked">
                </div>
                <div class="product-modal-middle">
                    <div class="product-modal-option ">
                        <h6 class="title">Kích cỡ:</h6>
                        <div class="product-modal-size">
                        <%
                            if(p.getPriceSize().size() > 0) {
                            List<PriceSize> sizes = p.getPriceSize();

                                if(sizes.size() == 1) {
                        %>
                            <input class="size" type="radio" name="size<%=p.getId()%>" id="m_size<%=p.getId()%>" value="<%=sizes.get(0).getSize()%>" checked="checked">
                            <label class="size-radio active" for="m_size<%=p.getId()%>"><%=sizes.get(0).getSize()%></label>
                        <%
                            } else {


                        %>
                            <input class="size" type="radio" name="size<%=p.getId()%>" id="m_size<%=p.getId()%>" value="<%=sizes.get(0).getSize()%>" checked="checked">
                            <label class="size-radio" for="m_size<%=p.getId()%>"><%=sizes.get(0).getSize()%></label>

                            <input class="size" type="radio" name="size<%=p.getId()%>" id="l_size<%=p.getId()%>" value="<%=sizes.get(1).getSize()%>" >
                            <label class="size-radio" for="l_size<%=p.getId()%>"><%=sizes.get(1).getSize()%></label>

                            <%
                                } }
                            %>
                        </div>

                    </div>
                    <div class="product-modal-option">
                        <h6 class="title">Số lượng:</h6>
                        <div class="quantity-control ">
<%--                            <button class=" " id="modal-sub-btn<%=p.getId()%>"><i class="fa-solid fa-minus item"></i> </button>--%>
                            <input type="number" name="quantity<%=p.getId()%>" class="quantity-num cart-quantity-input" value="1" id="modal-quantity<%=p.getId()%>">
<%--                            <button class=" " id="modal-sum-btn<%=p.getId()%>"> <i class="fa-solid fa-plus item"></i> </button>--%>
                        </div>
                    </div>
                    <div class="product-modal-option align-items-start">

                        <h6 class="title">Topping:</h6>
                        <div class="product-modal-topping ">
                            <%
                                if(p.getTopping().size() > 0) {
                                    List<Topping> toppingList = p.getTopping();
                                    for(Topping topping : toppingList) {


                            %>

                            <input class="topping-checked" type="checkbox" name="<%=topping.getId()%>" id="<%=p.getId()%><%=topping.getId()%><%=count%>" value="<%=topping.getName()%>" data-id="<%=p.getId()%>">
                            <label class="topping-detail" for="<%=p.getId()%><%=topping.getId()%><%=count%>">
                                <%=topping.getName()%> + <%=currency.format((int) topping.getPrice())%> </label>
                            <%
                                    } } else {

                            %>

                            <label class="topping-detail active" for="">
                                Sản phẩm không hỗ trợ Topping</label>
                            <%
                                }
                            %>
                        </div>
                    </div>

                    <div class="product-modal-option align-items-start">
                        <h6 class="title">Ghi chú:</h6>
                        <div>
                            <textarea name="note" id="" cols="25" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="product-modal-option">
                        <h6 class="title">Giá: </h6>
                        <h6 id="totalprice<%=p.getId()%>"><%=totalPrice%></h6>
                    </div>
                </div>

                <div class="product-modal-footer">

                    <button class="btn modal-btn" class="btn modal-btn" type="submit">Thêm vào giỏ hàng</button>

<%--                    <a href="/addToCart?product=<%=p.getId()%>&size=size<%=p.getId()%>" class="btn modal-btn"> Thêm vào giỏ hàng</a>--%>
                </div>
            </div>
        </div>
 </div><!-- /.modal-content -->

</div><!-- /.modal-dialog -->
<!-- /.modal -->
</form>
<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script>
    <%if(p.getPriceSize().size() > 0) {%>
    price<%=p.getId()%> = '<%=new ProducService().getPriceSizeM(p.getId())%>';
    var totalPrice<%=p.getId()%> = document.getElementById('totalprice' + '<%=p.getId()%>');
    subTotal<%=p.getId()%> =Number(price<%=p.getId()%>);
    $(document).ready(function () {
        var sum_btn = '#modal-sum-btn' + '<%=p.getId()%>';
        var sub_btn = '#modal-sub-btn' + '<%=p.getId()%>';
        var rs = '#modal-quantity' + '<%=p.getId()%>';
        var sum = parseInt($(rs).val());
        $(sum_btn).click(function (e) {
            $(rs).val(parseInt($(rs).val()) + 1);
            var pricePlus =Number(price<%=p.getId()%>);
            var pricePlusTow = Number(subTotal<%=p.getId()%>);
            var checkPrice = totalPrice<%=p.getId()%>.innerText.split("đ",1);
            subTotal<%=p.getId()%> = pricePlus + pricePlusTow;
            totalPrice<%=p.getId()%>.innerText =subTotal<%=p.getId()%>.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });

        });
        $(sub_btn).click(function (e) {
            if (parseInt($(rs).val()) > 1) {
                $(rs).val(parseInt($(rs).val()) - 1);
                var priceMinus =Number(price<%=p.getId()%>);

                var priceMinusTow = Number(subTotal<%=p.getId()%>);
                subTotal<%=p.getId()%> = priceMinusTow - priceMinus;

                var checkBoxs = document.getElementsByName('<%=p.getId()%>');
                var checkChecked = 0;
                for (var i = 0; i < checkBoxs.length; i++) {
                    if(checkBoxs[i].checked == false) {
                        checkChecked++;
                    }
                }
                var getQuantity = $(rs).val();

                if((subTotal<%=p.getId()%> > priceMinus || subTotal<%=p.getId()%> < priceMinus) && checkBoxs.length == checkChecked && getQuantity == 1) {
                    totalPrice<%=p.getId()%>.innerText =priceMinus.toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    });
                } else {
                    totalPrice<%=p.getId()%>.innerText =subTotal<%=p.getId()%>.toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    });
                }
            }
        });
    <%
    if(p.getTopping().size() > 0) {
        int i = 1;
        List<Topping> toppingList = p.getTopping();
        for(Topping topping : toppingList) {
    %>
        const alertStatus<%=p.getId()%><%=topping.getId()%> = (e) => {
            var checked = '#<%=p.getId()%><%=topping.getId()%><%=count%>' ;
            var checkBox = document.getElementById('<%=p.getId()%><%=topping.getId()%><%=count%>');
            var sum = parseInt($(rs).val());
            if($(checked).is(':checked') ){
                var value = Number(checkBox.value);
                value = sum * value;
                subTotal<%=p.getId()%> = subTotal<%=p.getId()%> + value;
                totalPrice<%=p.getId()%>.innerText =subTotal<%=p.getId()%>.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                });
            }
            else{
                var value = Number(checkBox.value);
                value = sum * value;
                subTotal<%=p.getId()%> = subTotal<%=p.getId()%> - value;
                totalPrice<%=p.getId()%>.innerText =subTotal<%=p.getId()%>.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                });
            }
        };
        $(document).on("click", '#<%=p.getId()%><%=topping.getId()%><%=count%>', alertStatus<%=p.getId()%><%=topping.getId()%>);

        <%
        } }%>
    });


    $(document).ready(function () {
        var rs = document.getElementById('price' + '<%=p.getId()%>');
        <%--var totalPrice = document.getElementById('totalprice' + '<%=p.getId()%>');--%>
        rs.innerText = '<%=priceP%>';
        <%--totalPrice.innerText = '<%=priceP%>';--%>

            var sizeM = document.getElementById('m_size' + '<%=p.getId()%>');
            var sizeL = document.getElementById('l_size' + '<%=p.getId()%>');
            $(sizeM).click(function (e) {
                price<%=p.getId()%> = '<%=new ProducService().getPriceSizeM(p.getId())%>';
                subTotal<%=p.getId()%> =Number(price<%=p.getId()%>) ;
                document.getElementById('modal-quantity<%=p.getId()%>').value = 1;
                rs.innerText = '<%=priceP = currency.format((int)new ProducService().getPriceSizeM(p.getId()))%>';
                var checkBoxs = document.getElementsByName('<%=p.getId()%>');
                for (i = 0; i < checkBoxs.length; i++) {
                    checkBoxs[i].checked = false;
                }
                totalPrice<%=p.getId()%>.innerText = subTotal<%=p.getId()%>.toLocaleString('vi', {style : 'currency', currency : 'VND'});

            })
            $(sizeL).click(function (e) {
                price<%=p.getId()%> = '<%=new ProducService().getPriceSizeL(p.getId())%>';
                subTotal<%=p.getId()%> =Number(price<%=p.getId()%>) ;
                document.getElementById('modal-quantity<%=p.getId()%>').value = 1;
                rs.innerText = '<%=priceP = currency.format((int)new ProducService().getPriceSizeL(p.getId()))%>';
                var checkBoxs = document.getElementsByName('<%=p.getId()%>');
                for (i = 0; i < checkBoxs.length; i++) {
                    checkBoxs[i].checked = false;
                }
                totalPrice<%=p.getId()%>.innerText = subTotal<%=p.getId()%>.toLocaleString('vi', {style : 'currency', currency : 'VND'});

            })
    })
<%}%>
</script>

</body>

</html>
