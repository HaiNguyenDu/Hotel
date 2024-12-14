<%@ page import="BEAN.Room" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/book.css">
    <link rel="stylesheet" href="css/vip.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo">
            <img src="https://static03-cdn.oneinventory.com/images/2022/07/dbe30a0bf14b4a67b38f09991e25aa23.png" alt="">
        </div>
    </div>
    <div class="information">
        <div id="datepicker" class="time">
            <div class="countnight">Ngay <span>1 đêm</span></div>
            <div class="time_date">
                <div  class="time_date_checkin">
                    <div class="day">19</div>
                    <div class="monthyear">Thang 6 <br> 2024
                    </div>
                </div>
                <div class="time_date_checkout"> <div class="day">19</div>
                    <div class="monthyear">Thang 6 <br> 2024</div>
                </div>
            </div>
        </div>
        <div class="people">
            <div class="peoplepicker">
                <div class="changeroom">
                    <div class="minus">-</div>
                    <div class="count">1</div>
                    <div class="plus">+</div>
                </div>
                <div class="changeadult">
                    <div class="minus">-</div>
                    <div class="count">2</div>
                    <div class="plus">+</div>
                </div>
                <div class="changechild">
                    <div class="exitbutton">x</div>
                    <div class="minus">-</div>
                    <div class="count">0</div>
                    <div class="plus">+</div>
                </div>
            </div>
            <div class="buttonsubmit">Xác Nhận</div>
            <div class="room">
                <div class="room_item_text">Phòng</div>
                <div class="room_item">1</div>
            </div>
            <div class="adult">
                <div class="adult_item_text">NG.Lớn</div>
                <div class="adult_item">2</div>
            </div>
            <div class="child">
                <div class="child_item_text">TRẺ EM</div>
                <div class="child_item">0</div>
            </div>
            <div class="arrow"><i class="fa-solid fa-arrow-down"></i></div>

            <div class="more"></div>
        </div>
            <div class="buttonfind">Tìm Kiếm</div>
    </div>

    <div class="date">
        <div class="date_left">
            <div class="date_header">Tháng 6. 2024</div>
            <div class="date_day">

                <div class="date_day_item">T2</div>
                <div class="date_day_item">T3</div>
                <div class="date_day_item">T4</div>
                <div class="date_day_item">T5</div>
                <div class="date_day_item">T6</div>
                <div class="date_day_item">T7</div>
                <div class="date_day_item">CN</div>
            </div>
            <div class="numbers">

            </div>
        </div>
        <div class="date_right">
            <div class="date_header">Tháng 7. 2024</div>

            <div class="date_day">

                <div class="date_day_item">T2</div>
                <div class="date_day_item">T3</div>
                <div class="date_day_item">T4</div>
                <div class="date_day_item">T5</div>
                <div class="date_day_item">T6</div>
                <div class="date_day_item">T7</div>
                <div class="date_day_item">CN</div>
            </div>
            <div class="numbers">

            </div>
        </div>

    </div>


    <div class="find">
        <div class="container_room">
            <div class="container_slider">
                <div class="slider">
                    <div class="slider_img"><img src="https://static03-cdn.oneinventory.com/images/2022/09/086dd10538d345e3b5318f5717830ab6.jpg" alt=""></div>
                    <div class="slider_img"><img src="https://static03-cdn.oneinventory.com/images/2022/09/0c1de2a98a34438e94d28d9b6159bbae.jpg" alt=""></div>
                    <div class="slider_img"><img src="https://static03-cdn.oneinventory.com/images/2022/10/c84e80df5ea146f0bae0c3aa09b024b8.jpg" alt=""></div>
                    <div class="slider_img"><img src="https://static03-cdn.oneinventory.com/images/2022/10/f7d8a70041054b309d4cf2c43235d6fc.jpg" alt=""></div>

                </div>
            </div>
            <div class="slider_button" id="left"><</div>
            <div class="slider_button" id="right">></div>
            <div class="content">
                <div class="content_header">Peridot Grand Luxury Boutique Hotel Vip Room</div>
                <div class="content_star">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                </div>
                <div class="content_address">
                    <i class="fa-solid fa-location-dot"></i>
                    97 Nguyễn Lương Bằng, Quận Liên Chiểu, Đà Nẵng, Việt Nam
                </div>
            </div>
            <script src="js/vip.js"></script>
        </div>

        <div class="room-container">

        </div>



    <%--        Policy  --%>
        <div class="policy">
            <div class="policy_header">Chính sách khách sạn</div>
            <div class="policy_item">
                <div class="policy_item_header">
                    <i class="fa-solid fa-door-open"></i>
                    Thời gian nhận phòng
                </div>
                <div class="policy_item_content">Từ 2:00 CH</div>
            </div>
            <div class="policy_item">
                <div class="policy_item_header">
                    <i class="fa-solid fa-door-open"></i>
                    Thời gian trả phòng
                </div>
                <div class="policy_item_content">Cho đến 12:00 CH</div>
            </div>
            <div class="policy_item">
                <div class="policy_item_header">
                    <i class="fa-solid fa-person"></i>
                    Chính sách trẻ em
                </div>
                <div class="policy_item_content">Trẻ em dưới 6 tuổi ngủ chung với người lớn sẽ được miễn phí (miễn phí tối đa 1 trẻ dưới 6 tuổi)
                    Trẻ em từ 6 - dưới 12 tuổi ngủ chung với người lớn sẽ tính phí phục vụ và ăn sáng là VND 290,000/trẻ/đêm
                    Giường phụ áp dụng VND 1,200,000/người/đêm</div>
            </div>
            <div class="policy_item">
                <div class="policy_item_header">
                    <i class="fa-solid fa-wallet"></i>
                    Chính sách khác
                </div>
                <div class="policy_item_content">
                    1. Giá NET đã bao gồm 5% phí phục vụ và 8% VAT <br>
                    2. Giá phòng đã bao gồm bữa sáng hàng ngày cho hai người <br>
                    3. Giờ nhận phòng sau 14h00, trả phòng trước 12h00 trưa. Phụ phí 50% giá phòng 1 đêm sẽ ...
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/book.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</body>
</html>