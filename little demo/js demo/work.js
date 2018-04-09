    $(".list-btn-cart").on("click", function() {
        var listId = $(this).attr("data-id"); //可作为id的动态class
        var listPrice = $(this).attr("data-price"); //可作为list的动态价格             //可编辑的区域
        $(this).css("display", "none");
        $("." + listId).find(".list-edit").css("display", "block");
        $("." + listId).find(".num").text(1);

        //list-box加入
        var html = '<div class="cart-list ' + listId + '">' +
            '<span class="list-name fixed-width">' + listId + 'name</span>' +
            '<span class="list-edit display-inline-block">' +
            '<button class="minus" data-id="' + listId + '" data-price="' + listPrice + '">-</button>' +
            '<span class="num">1</span>' +
            '<button class="add" data-id="' + listId + '" data-price="' + listPrice + '">+</button>' +
            '</span>' +
            '<span class="list-subtotal fixed-width text-right">' + listPrice + '</span>' +
            '</div>';

        $(".list-box").append(html);
        totalPrice();
    })
    //计算总价
    function totalPrice() {
        var copies = 0;
        var total = 0;
        $(".list-box .cart-list").each(function() {
            copies = copies + parseInt($(this).find(".num").text());
            $("#copies").text(copies);
            total = total + parseFloat($(this).find(".list-subtotal").text());
            $("#total").text(total.toFixed(2));
        })
    }
    //加
    $(document).on('click', '.add', function() {
        var listId = $(this).attr("data-id"); //可作为id的动态class
        var listPrice = $(this).attr("data-price"); //可作为list的动态价格 
        var amount = parseInt($(this).prev(".num").text());
        amount = amount + 1;
        $("." + listId).find(".num").text(amount);

        var subtotal = amount * listPrice;
        $("." + listId).find(".list-subtotal").text(subtotal);
        totalPrice();
    })

    //减
    $(document).on('click', '.minus', function() {
        var listId = $(this).attr("data-id"); //可作为id的动态class
        var listPrice = $(this).attr("data-price"); //可作为list的动态价格 
        var amount = parseInt($(this).next(".num").text());
        var subtotal;
        if (amount > 1) {
            amount = amount - 1;
            $("." + listId).find(".num").text(amount);

            subtotal = amount * listPrice;
            $("." + listId).find(".list-subtotal").text(subtotal);
            totalPrice();
        } else {
            $("." + listId).find(".num").text(0);
            $("." + listId).find(".list-subtotal").text(0);
            totalPrice();

            $(".content-box ." + listId).find(".list-edit").css("display", "none")
            $(".content-box ." + listId).find(".list-btn-cart").css("display", "block");
            $(".list-box ." + listId).remove();
        }
    })