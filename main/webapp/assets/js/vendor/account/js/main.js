(function ($) {
  "use strict";

  /*--
        Menu Sticky
    -----------------------------------*/
  var windows = $(window);
  var sticky = $(".header-sticky");

  windows.on("scroll", function () {
    var scroll = windows.scrollTop();
    if (scroll < 300) {
      sticky.removeClass("is-sticky");
    } else {
      sticky.addClass("is-sticky");
    }
  });

  /*--
        Off Canvas
    -------------------------------------------*/
  $(".off-canvas-btn").on("click", function () {
    $("body").addClass("fix");
    $(".off-canvas-wrapper").addClass("open");
  });

  $(".btn-close-off-canvas,.off-canvas-overlay").on("click", function () {
    $("body").removeClass("fix");
    $(".off-canvas-wrapper").removeClass("open");
  });

  /*-- 
        Countdown Activation 
    ------------------------------------*/
  $("[data-countdown]").each(function () {
    var $this = $(this),
      finalDate = $(this).data("countdown");
    $this.countdown(finalDate, function (event) {
      $this.html(
        event.strftime(
          '<div class="single-countdown"><span class="single-countdown__time">%D</span><span class="single-countdown__text">Days</span></div><div class="single-countdown"><span class="single-countdown__time">%H</span><span class="single-countdown__text">Hours</span></div><div class="single-countdown"><span class="single-countdown__time">%M</span><span class="single-countdown__text">Mins</span></div><div class="single-countdown"><span class="single-countdown__time">%S</span><span class="single-countdown__text">Secs</span></div>'
        )
      );
    });
  });

  /*---
     Category Menu Active
    ---------------------------- */
  $(".categories_title").on("click", function () {
    $(this).toggleClass("active");
    $(".categories_menu_toggle").slideToggle("medium");
  });

  $(".categories-more-less").on("click", function () {
    $(".hide-child").slideToggle();
    $(this).toggleClass("rx-change");
  });

  /* ---------------------
     Category menu
    --------------------- */
  function categorySubMenuToggle() {
    $(".categories_menu_toggle li.menu_item_children > a").on(
      "click",
      function () {
        if ($(window).width() < 991) {
          $(this).removeAttr("href");
          var element = $(this).parent("li");
          if (element.hasClass("open")) {
            element.removeClass("open");
            element.find("li").removeClass("open");
            element.find("ul").slideUp();
          } else {
            element.addClass("open");
            element.children("ul").slideDown();
            element.siblings("li").children("ul").slideUp();
            element.siblings("li").removeClass("open");
            element.siblings("li").find("li").removeClass("open");
            element.siblings("li").find("ul").slideUp();
          }
        }
      }
    );
    $(".categories_menu_toggle li.menu_item_children > a").append(
      '<span class="expand"></span>'
    );
  }
  categorySubMenuToggle();

  /*-- 
        Responsive Mobile Menu
    --------------------------------------------------*/
  //Variables
  var $offCanvasNav = $(".mobile-menu"),
    $offCanvasNavSubMenu = $offCanvasNav.find(".dropdown");

  //Add Toggle Button With Off Canvas Sub Menu
  $offCanvasNavSubMenu
    .parent()
    .prepend('<span class="menu-expand"><i></i></span>');

  //Close Off Canvas Sub Menu
  $offCanvasNavSubMenu.slideUp();

  //Category Sub Menu Toggle
  $offCanvasNav.on("click", "li a, li .menu-expand", function (e) {
    var $this = $(this);
    if (
      $this
        .parent()
        .attr("class")
        .match(/\b(menu-item-has-children|has-children|has-sub-menu)\b/) &&
      ($this.attr("href") === "#" || $this.hasClass("menu-expand"))
    ) {
      e.preventDefault();
      if ($this.siblings("ul:visible").length) {
        $this.parent("li").removeClass("active");
        $this.siblings("ul").slideUp();
      } else {
        $this.parent("li").addClass("active");
        $this
          .closest("li")
          .siblings("li")
          .removeClass("active")
          .find("li")
          .removeClass("active");
        $this.closest("li").siblings("li").find("ul:visible").slideUp();
        $this.siblings("ul").slideDown();
      }
    }
  });

  /*--
        Hero Slider
    --------------------------------------------*/

  var heroSlider = $(".hero-slider-one");
  heroSlider.slick({
    arrows: true,
    autoplay: false,
    autoplaySpeed: 5000,
    dots: false,
    pauseOnFocus: false,
    pauseOnHover: false,
    fade: true,
    infinite: true,
    slidesToShow: 1,
    prevArrow:
      '<button type="button" class="slick-prev"> <i class="fa fa-angle-left"> </i></button>',
    nextArrow:
      '<button type="button" class="slick-next"><i class="fa fa-angle-right"> </i></button>',
    responsive: [
      {
        breakpoint: 767,
        settings: {
          dots: false,
        },
      },
    ],
  });

  /*--
        Product Slider
    --------------------------------------------*/
  var product_4 = $(".product-active-lg-4");
  product_4.slick({
    dots: false,
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay: false,
    prevArrow:
      '<button type="button" class="slick-prev"> <i class="fa fa-angle-left"> </i></button>',
    nextArrow:
      '<button type="button" class="slick-next"><i class="fa fa-angle-right"> </i></button>',
    responsive: [
      {
        breakpoint: 1199,
        settings: {
          slidesToShow: 3,
        },
      },
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 767,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 479,
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  });
  /*--
        Product Slider
    --------------------------------------------*/
  var product_row_4 = $(".product-active-row-4");
  product_row_4.slick({
    dots: false,
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    rows: 2,
    autoplay: false,
    prevArrow:
      '<button type="button" class="slick-prev"> <i class="fa fa-angle-left"> </i></button>',
    nextArrow:
      '<button type="button" class="slick-next"><i class="fa fa-angle-right"> </i></button>',
    responsive: [
      {
        breakpoint: 1199,
        settings: {
          slidesToShow: 3,
        },
      },
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 767,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 479,
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  });

  /*-- 
        brand Active Two 
    -----------------------------*/
  var brandActive = $(".our-brand-active");
  brandActive.slick({
    dots: false,
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    autoplay: false,
    prevArrow: false,
    nextArrow: false,
    responsive: [
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 4,
        },
      },
      {
        breakpoint: 767,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
        },
      },
      {
        breakpoint: 479,
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  });
  /*-- 
        Testimonial Two Slider 
    -----------------------------*/
  var testimonialSliderTwo = $(".testimonial-two");
  testimonialSliderTwo.slick({
    arrows: false,
    autoplay: true,
    autoplaySpeed: 7000,
    dots: false,
    pauseOnFocus: false,
    pauseOnHover: false,
    infinite: true,
    slidesToShow: 2,
    slidesToScoll: 1,
    prevArrow: false,
    nextArrow: false,
  });

  /* Product Detals Color */
  $(".watch-color li").on("click", function () {
    $(this).addClass("checked").siblings().removeClass("checked");
  });

  /*---------------------------
        Count Down Timer
    ----------------------------*/
  $("[data-countdown]").each(function () {
    var $this = $(this),
      finalDate = $(this).data("countdown");
    $this.countdown(finalDate, function (event) {
      $this.html(
        event.strftime(
          '<span class="cdown day"><span class="time-count">%-D</span> <p>Days</p></span> <span class="cdown hour"><span class="time-count">%-H</span> <p>Hours</p></span> <span class="cdown minutes"><span class="time-count">%M</span> <p>mins</p></span> <span class="cdown second"><span class="time-count">%S</span> <p>secs</p></span>'
        )
      );
    });
  });

  /*----------
        price-slider active
    -------------------------------*/
  $("#price-slider").slider({
    range: true,
    min: 0,
    max: 120,
    values: [20, 115],
    slide: function (event, ui) {
      $("#min-price").val("$" + ui.values[0]);
      $("#max-price").val("$" + ui.values[1]);
    },
  });
  $("#min-price").val("$" + $("#price-slider").slider("values", 0));
  $("#max-price").val("$" + $("#price-slider").slider("values", 1));

  /*--
        Category menu Activation
    ------------------------------*/
  $(".category-sub-menu li.has-sub > a").on("click", function () {
    $(this).removeAttr("href");
    var element = $(this).parent("li");
    if (element.hasClass("open")) {
      element.removeClass("open");
      element.find("li").removeClass("open");
      element.find("ul").slideUp();
    } else {
      element.addClass("open");
      element.children("ul").slideDown();
      element.siblings("li").children("ul").slideUp();
      element.siblings("li").removeClass("open");
      element.siblings("li").find("li").removeClass("open");
      element.siblings("li").find("ul").slideUp();
    }
  });

  // prodct details slider active
  $(".product-large-slider").slick({
    fade: true,
    arrows: false,
    asNavFor: ".product-nav",
  });

  // product details slider nav active
  $(".product-nav").slick({
    slidesToShow: 4,
    asNavFor: ".product-large-slider",
    centerMode: true,
    centerPadding: 0,
    focusOnSelect: true,
    prevArrow:
      '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
    nextArrow:
      '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
    responsive: [
      {
        breakpoint: 576,
        settings: {
          slidesToShow: 3,
        },
      },
    ],
  });

  // ScrollUp Active
  $(".nice-select").niceSelect();

  // Image zoom effect
  $(".img-zoom").zoom();

  // Fancybox Active
  $('[data-fancybox="images"]').fancybox({
    hash: false,
  });

  /*--
        showlogin toggle function
    --------------------------*/
  $("#showlogin").on("click", function () {
    $("#checkout-login").slideToggle(500);
  });

  /*--
        showcoupon toggle function
    --------------------------*/
  $("#showcoupon").on("click", function () {
    $("#checkout-coupon").slideToggle(500);
  });

  /*--
        Checkout 
    --------------------------*/
  $("#chekout-box").on("change", function () {
    $(".account-create").slideToggle("100");
  });

  /*-- 
        Checkout 
    ---------------------------*/
  $("#chekout-box-2").on("change", function () {
    $(".ship-box-info").slideToggle("100");
  });

  /*--
        ScrollUp Active
    -----------------------------------*/
  $.scrollUp({
    scrollText: '<i class="fa fa-angle-up"></i>',
    easingType: "linear",
    scrollSpeed: 900,
    animation: "fade",
  });
})(jQuery);

//
let btn_edit_111 = document.getElementById("btn_edit_111");
btn_edit_111.onclick = function () {
  document.getElementById("edit_111").style.display = "block";
  document.getElementById("save_111").style.display = "none";
};
let btn_submit_111 = document.getElementById("submit_111");
btn_submit_111.onclick = function () {
  document.getElementById("edit_111").style.display = "none";
  document.getElementById("save_111").style.display = "block";
};

let edit__address = document.getElementById("save-address");
edit__address.onclick = function () {
  document.getElementById("edit_address__form").style.display = "block";
  document.getElementById("address-save").style.display = "none";
};
let save__address = document.getElementById("submit_save__adress");
save__address.onclick = function () {
  document.getElementById("edit_address__form").style.display = "none";
  document.getElementById("address-save").style.display = "block";
};
