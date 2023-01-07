<%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/18/2022
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zxx">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Về chúng tôi</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet">

  <!-- Css Styles -->
  <%@include file="css.jsp"%>
  <link rel="stylesheet" href="css/about.css" type="text/css">

</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
  <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
  <div class="offcanvas__option">
    <div class="offcanvas__links">
      <a href="login-register.jsp">Đăng nhập</a>
    </div>

  </div>
  <div class="offcanvas__nav__option">
    <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
    <a href="cart.html"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
    <div class="price">0 vnđ</div>
  </div>
  <div id="mobile-menu-wrap"></div>
  <div class="offcanvas__text">
    <p> Miễn phí vận chuyển, hoàn trả trong 30 ngày hoặc đảm bảo hoàn lại tiền.</p>
  </div>
</div>

<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>
<!-- Header Section End -->

<section class="hero">
  <div class="hero__slider owl-carousel">
    <div class="hero__items set-bg" data-setbg="img/about/vct.jpg">
      <div class="container">
        <div class="row">
          <div class="col-xl-5 col-lg-7 col-md-8">
            <div class="hero__text">
              <div class="hero__social">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Breadcrumb Section Begin -->
<div class="breadcumb">
  <h1>Về chúng tôi</h1>
  <h6>Giới thiệu</h6>
  <img src="assets/images/icon_tealeaves.png" width="500px" height="50px" style="object-fit: cover;scale: 0.5;">
</div>
<!-- Breadcrumb Section End -->

<!-- About Section Begin -->
<section class="about spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="about__pic text-center">
          <img src="img/logo.png" width="200px" alt="">
        </div>
      </div>
    </div>
    <div class="row">
      <div class="gt">
        <div class="about__item">
          <h4>VỀ CHÚNG TÔI</h4>
          <p><b>Năm 1968,</b> tại cao nguyên chè danh tiếng Bảo Lộc (Lâm Đồng), Phúc Long được ra đời với
            kỳ vọng mang đến những sản phẩm trà và cà phê chất lượng.</p>

          <p> <b>Vào những năm 80,</b> Phúc Long khai trương ba cửa hàng đầu tiên tại Thành phố Hồ Chí
            Minh trên đường Lê Văn Sỹ, Trần Hưng Đạo và Mạc Thị Bưởi nhằm giới thiệu sản phẩm trà và cà
            phê thuần Việt đến với khách hàng trong nước cũng như quốc tế.</p>
          <p> Đặc biệt, cửa hàng Phúc Long Mạc Thị Bưởi toạ lạc tại trung tâm Quận 1 là cửa hàng đầu tiên
            phục vụ các thức uống Trà pha chế đặc trưng của Phúc Long và Cà-phê pha máy cao cấp thường
            chỉ được phục vụ tại các nhà hàng sang trọng vào giai đoạn đó.</p>

          <p><b> Năm 2000,</b> công ty TNHH Sản Xuất Thương Mại Phúc Long chính thức được thành lập.

          <p> <b> Năm 2007,</b> Phúc Long sở hữu đồi chè tại Thái Nguyên. Bởi chính bản thân tôi nhận
            thấy Trà Thái Nguyên cạnh tranh được về hương vị, hình thức và chất nước đặc trưng nhưng
            cũng giống như các loại trà ở các địa phương khác, việc kiểm soát các thành phần dư
            lượng theo tiêu chuẩn vệ sinh an toàn thực phẩm của thế giới thì trà Thái Nguyên vẫn
            chịu chung số phận “chưa phù hợp tiêu chuẩn”.
            Xác định rõ mục tiêu cần duy trì và bảo vệ chất lượng tự nhiên vốn có của trà Thái
            Nguyên, chính vì vậy tôi nhanh chóng quyết định đầu tư xây dựng nhà máy chế biến trà
            ngay tại Thái Nguyên. Phúc Long mong muốn qua việc đặt nhà máy ngay tại vùng nguyên
            liệu, chúng tôi có thể duy trì được cái “chất” của trà Thái một cách trọn vẹn đồng thời
            hạn chế tối đa các điều kiện nuôi trồng, thu hoạch và chế biến
            trà nhằm đảm bảo tốt nhất các vấn đề quản lý chất lượng tổng thể. Đồng thời trong năm
            2007, Phúc Long đầu tư nhà máy chế biến trà và cà phê tại Bình Dương được trang bị nhiều
            thiết bị và máy móc hiện đại, có chứng nhận HACCP- quy trình đảm bảo đủ tiêu chuẩn an
            toàn vệ sinh thực phẩm, với mục tiêu đảm bảo cung ứng nguồn sản phẩm chất lượng, phục vụ
            thị trường trong nước và đáp ứng nhu cầu xuất khẩu. Cũng từ đây,
            Trà Phúc Long đã đáp ứng đầy đủ tiêu chuẩn để có mặt tại các thị trường khó tính như:
            Mỹ, Nhật Bản, Indonesia, Philippines… </p>

          <p> <b> Năm 2012,</b> cửa hàng Phúc Long Coffee & Tea tại TTTM Crescent Mall Quận 7 ra mắt
            đánh dấu việc Phúc Long chính thức mở rộng vào ngành đồ ăn & thức uống (Food & Beverage)
            với cửa hàng Phúc Long hoạt động theo mô hình tự phục vụ trong không gian hiện đại. Cùng
            với đội ngũ cộng sự đắc lực của mình, chúng tôi làm nên sự kiện đánh dấu bước chuyển
            mình trong lịch sự phát triển của Phúc Long. </p>

          <p> <b> Năm 2015,</b> Phúc Long xây dựng được 10 cửa hàng tại Thành Phố Hồ Chí Minh. Từng
            bước định vị thương hiệu gắn liền với những sản phẩm và thức uống trà và cà phê đậm vị
            trong tâm trí khách hàng. </p>

          <p> <b>Năm 2018,</b> xây dựng nhà máy thứ 2 tại Bình Dương, sở hữu hai đồi chè Thái Nguyên
            và Bảo Lộc. Đồng thời hơn 40 cửa hàng Phúc Long được xây dựng tại: Thành phố Hồ Chí
            Minh, Bình Dương, Nha Trang, Đà Nẵng, Hà Nội. Năm 2018 cũng là năm tôi quyết định mở
            rộng thương hiệu ra phía Bắc, sau thời gian tìm hiểu và khảo sát thị trường với cửa hàng
            đầu tiên của Phúc Long đặt tại Hà Nội. </p>

          <p> <b>Năm 2019,</b> phát triển 70 cửa hàng và tiếp tục định hướng phát triển mở rộng hệ
            thống cửa hàng trải dài từ Nam ra Bắc. Bên cạnh đó, tăng độ phủ của sản phẩm trà và cà
            phê đến tất cả các hệ thống: siêu thị, cửa hàng tiện lợi, kênh thương mại điện tử…</p>
          <img src="img/about/haa.jpg" alt="">
          <p> Trải qua hơn 50 năm chắt chiu tinh hoa từ những búp trà xanh và hạt cà phê thượng hạng
            cùng mong muốn mang lại cho khách hàng những trải nghiệm giá trị nhất khi thưởng thức,
            Phúc Long liên tục là thương hiệu tiên phong với nhiều ý tưởng sáng tạo đi đầu trong
            ngành trà và cà phê.</p>

          <p> Chúng tôi tin rằng từng sản phẩm trà và cà phê sẽ càng thêm hảo hạng khi được tạo ra từ
            sự phấn đấu không ngừng cùng niềm đam mê. Và chính kết nối dựa trên niềm tin, sự trung
            thực và tin yêu góp phần mang đến những nét đẹp trong văn hóa thưởng trà & cà phê ngày
            càng bay cao và vươn xa.
            Tiếp nối nỗ lực, từ một cửa hàng đầu tiên, đến nay, Phúc Long xây dựng hơn 80 cửa hàng
            trên khu vực TP.HCM, Bình Dương, Biên Hòa, Cần Thơ, Đà Nẵng, Nha Trang, Hà Nội phục vụ
            những thức uống tươi ngon từ trà và cà phê. Không dừng lại tại đó, chúng tôi tiếp tục
            định hướng phát triển mở rộng hệ thống cửa hàng trải dài từ Nam ra Bắc.
            Tăng độ phủ của sản phẩm đến tất cả các hệ thống: siêu thị, cửa hàng tiện lợi…</p>

          <p> Hoạt động với phương châm “Chất lượng khởi nguồn từ đam mê”, cùng nhau, chúng tôi đã và
            đang viết tiếp câu chuyện của một thương hiệu Việt giàu truyền thống, kết nối tinh túy
            của nhiều thập niên kinh nghiệm và không ngừng chắt lọc, làm mới mình trong bước chuyển
            thời gian để trở thành thương hiệu luôn gắn bó với nhiều thế hệ khách hàng.</p>
          <div class="container1">
            <div class="row">
              <div class="col-lg-12">
                <div class="about__picc">
                  <img src="img/about/img.png" alt="">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="gt">
                <h4>TẦM NHÌN</h4>
                <p><b>1.</b> Với khát vọng không ngừng mở rộng thị trường - phát triển bền vững,
                  Phúc Long phấn đấu trở thành công ty chuyên sản xuất và xuất khẩu trà, cà
                  phê có giá trị cao tại Việt Nam.</p>
                <p><b>2.</b> Phúc Long mong muốn tạo nên một thương hiệu Việt với đẳng cấp và
                  chất lượng được thể hiện trong từng sản phẩm, qua đó từng bước khẳng định vị
                  thế trên thị trường quốc tế.</p>
                <h4>SỨ MỆNH</h4>
                <p><b>1. Trở thành người tiên phong của thời đại</b> với những ý tưởng sáng tạo
                  đi đầu trong ngành trà và cà phê.</p>
                <p><b>2. Cùng đưa thương hiệu tỏa sáng,</b> tạo động lực cho nhau, cùng biến ý
                  tưởng thành hiện thực bằng tinh thần gắn kết, tương tác, biết lắng nghe và
                  tôn trọng.</p>
                <p><b>3. Để tạo niềm vui và tình cảm cho khách hàng,</b> mỗi chúng ta phải
                  thường xuyên liên tục tỏa sáng. Không được để cho năng lực của bản thân bị
                  ngủ quên, không ngừng thách thức khó khăn, phải luôn luôn tự đổi mới bản
                  thân. </p>
                <p><b>4. Tạo ra giá trị cao</b> bằng sự thấu hiểu, đồng cảm và những đề xuất có
                  giá trị thật sự, thỏa mãn sự hài lòng cho khách hàng.</p>
                <h4>GIÁ TRỊ CỐT LÕI</h4>
                <p><b>1. Đối với khách hàng:</b> Cam kết cung cấp sản phẩm chất lượng và dịch vụ
                  tốt nhất. </p>
                <p><b>2. Đối với nhân viên:</b> Xây dựng môi trường làm việc chuyên nghiệp, năng
                  động, sáng tạo và nhân văn, tạo điều kiện thu nhập cao và cơ hội phát triển
                  công bằng.</p>
                <p><b>3. Đối với xã hội:</b> Hài hòa lợi ích doanh nghiệp với lợi ích xã hội,
                  đóng góp tích cực vào các hoạt động hướng về cộng đồng, thể hiện tinh thần
                  trách nhiệm đối với xã hội.</p>
                <h4>LĨNH VỰC HOẠT ĐỘNG</h4>
                <p><b>1. Sản xuất, xuất khẩu, kinh doanh</b> các sản phẩm trà và cà phê thành
                  phẩm (đóng gói)</p>
                <p><b>2. Kinh doanh dịch vụ</b> ăn uống tại hệ thống cửa hàng: </p>
                <div class="list">
                  <ul>
                    <li>
                      <p> Các loại thức ăn, thức uống </p>
                    </li>
                    <li>
                      <p> Các loại bánh ngọt, bánh mặn </p>
                    </li>
                    <li>
                      <p> Dịch vụ giao hàng tận nơi </p>
                    </li>
                </div>
                </ul>
              </div>
            </div>
          </div>
        </div>
</section>
<!-- Footer Section Begin -->
<%@include file="footer.jsp" %>
<!-- Footer Section End -->
<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>
