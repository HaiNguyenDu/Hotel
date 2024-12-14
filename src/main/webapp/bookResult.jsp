
<%@ page import="BEAN.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.RoomDao" %>
<%@ page import="java.util.Map" %>
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
    <style>
        .find {
            display: flex;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo">
            <img src="https://static03-cdn.oneinventory.com/images/2022/07/dbe30a0bf14b4a67b38f09991e25aa23.png" alt="">
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
            <c:forEach var="room" items="${rooms}">
                <script>
                    console.log(${room});
                </script>
                <c:choose>
                    <c:when test="${room.room_type_id == '3000000001' || room.room_type_id == '3000000002' || room.room_type_id == '3000000003'}">
                        <script>
                            console.log(1);
                        </script>
                        <div class="listroomvip" style="height: 400px">
                            <div class="listroom_left">
                                <input type="hidden" value="${room.roomId}">
                                <div class="listroom_left_header">${room.roomName}</div>
                                <div class="listroom_left_img"><img src="https://static03-cdn.oneinventory.com/images/2022/09/4f7f63feda3d4c829bae6ecf3898b98a.jpg" alt=""></div>
                                <div class="listroom_left_ifm">
                                    <div class="listroom_left_ifm_item">
                                        <i class="fa-solid fa-up-right-and-down-left-from-center"></i>
                                            ${room.acreage} m2
                                    </div>
                                    <div class="listroom_left_ifm_item">
                                        <i class="fa-solid fa-bed"></i>
                                        Giường đơn, Giường cỡ lớn
                                    </div>
                                    <div class="listroom_left_ifm_item">
                                        <i class="fa-solid fa-street-view"></i>
                                        Huớng biển, Huớng thành phố
                                    </div>
                                </div>

                            </div>
                            <div class="listroom_right">
                                <div class="listroom_right_view" id="city">
                                    <div class="list_right_view_ifm">
                                        <div class="list_right_view_ifm_header">${room.roomName}</div>
                                        <div class="list_right_view_ifm_text" id="khh9">Không hoàn hủy</div>
                                        <div class="list_right_view_ifm_text">
                                            <i class="fa-solid fa-money-bill"></i>
                                            Thanh toán khi khách hàng trả phòng
                                        </div>
                                        <div class="list_right_view_ifm_text">
                                            <i class="fa-solid fa-utensils"></i>
                                            Buffet breakfast
                                        </div>
                                        <div class="list_right_view_ifm_text">
                                            <i class="fa-solid fa-circle-xmark"></i>
                                            Không hút thuốc
                                        </div>
                                        <div class="list_right_view_ifm_text">

                                        </div>
                                    </div>
                                    <div class="listroom_right_view_pick" style="margin-top: 80px">
                                        <div class="listroom_right_view_pick_money">${room.base_price} VND</div>


                                        <form action="ifmbook" method="get">
                                            <input type="hidden" name="roomId" value="${room.roomId}">
                                            <input type="hidden" name="checkin" value="<c:out value='${checkin}'/>">
                                            <input type="hidden" name="checkout" value="<c:out value='${checkout}'/>">
                                            <button type="submit" class="listroom_right_view_pick_button">Đặt ngay</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="line"></div>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${room.room_type_id == '3000000004' || room.room_type_id == '3000000005' || room.room_type_id == '3000000006'}">
                        <script>
                            console.log(2);
                        </script>
                        <div class="listroomdeluxe">
                            <div class="listroom_left">
                                <div class="listroom_left_header">${room.roomName}</div>
                                <div class="listroom_left_img"><img src="https://static03-cdn.oneinventory.com/images/2022/09/859277ecb4994a81aa9cc4251ea40367.jpg" alt=""></div>
                                <div class="listroom_left_ifm">
                                    <div class="listroom_left_ifm_item">
                                        <i class="fa-solid fa-up-right-and-down-left-from-center"></i>
                                            ${room.acreage} m2
                                    </div>
                                    <div class="listroom_left_ifm_item">
                                        <i class="fa-solid fa-bed"></i>
                                        Giường đơn, Giường cỡ lớn
                                    </div>
                                    <div class="listroom_left_ifm_item">
                                        <i class="fa-solid fa-street-view"></i>
                                        Huớng biển, Huớng thành phố
                                    </div>
                                </div>
                            </div>

                            <div class="listroom_right">
                                <div class="listroom_right_view" id="city12">
                                    <div class="list_right_view_ifm">
                                        <div class="list_right_view_ifm_header">${room.roomName}</div>
                                        <div class="list_right_view_ifm_text" id="khh">Không hoàn hủy</div>
                                        <div class="list_right_view_ifm_text">
                                            <i class="fa-solid fa-money-bill"></i>
                                            Thanh toán khi khách hàng trả phòng
                                        </div>
                                        <div class="list_right_view_ifm_text">
                                            <i class="fa-solid fa-utensils"></i>
                                            Buffet breakfast
                                        </div>
                                        <div class="list_right_view_ifm_text">
                                            <i class="fa-solid fa-circle-xmark"></i>
                                            Không hút thuốc
                                        </div>
                                        <div class="list_right_view_ifm_text">

                                        </div>
                                    </div>
                                    <div class="listroom_right_view_pick" style="margin-top: 80px">
                                        <div class="listroom_right_view_pick_money">${room.base_price} VND</div>


                                        <form action="ifmbook" method="get">
                                            <input type="hidden" name="roomId" value="${room.roomId}">
                                            <input type="hidden" name="checkin" value="<c:out value='${checkin}'/>">
                                            <input type="hidden" name="checkout" value="<c:out value='${checkout}'/>">
                                            <button type="submit" class="listroom_right_view_pick_button">Đặt ngay</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="line"></div>

                            </div>
                        </div>
                    </c:when>
                    <c:when test="${room.room_type_id == '3000000007' || room.room_type_id == '3000000008' || room.room_type_id == '3000000009'}">
                        <script>
                            console.log(3);
                        </script>
                        <div class="listroomstandard">
                            <div class="listroom_left">
                                <input type="hidden" value="${room.roomId}">
                                <div class="listroom_left_header">${room.roomName}</div>
                                <div class="listroom_left_img"><img src="https://static03-cdn.oneinventory.com/images/2022/09/b58fa8298cf84149a0919d8122416ce5.jpg" alt=""></div>
                                <div class="listroom_left_ifm">
                                    <div class="listroom_left_ifm_item">
                                        <i class="fa-solid fa-up-right-and-down-left-from-center"></i>
                                            ${room.acreage} m2
                                    </div>
                                    <div class="listroom_left_ifm_item">
                                        <i class="fa-solid fa-bed"></i>
                                        Giường đơn, Giường cỡ lớn
                                    </div>
                                    <div class="listroom_left_ifm_item">
                                        <i class="fa-solid fa-street-view"></i>
                                        Huớng thành phố
                                    </div>
                                </div>
                            </div>

                            <div class="listroom_right">
                                <div class="listroom_right_view" id="cit1y">
                                    <div class="list_right_view_ifm">
                                        <div class="list_right_view_ifm_header">${room.roomName}</div>
                                        <div class="list_right_view_ifm_text" id="k2hh">Không hoàn hủy</div>
                                        <div class="list_right_view_ifm_text">
                                            <i class="fa-solid fa-money-bill"></i>
                                            Thanh toán khi khách hàng trả phòng
                                        </div>
                                        <div class="list_right_view_ifm_text">
                                            <i class="fa-solid fa-utensils"></i>
                                            Buffet breakfast
                                        </div>
                                        <div class="list_right_view_ifm_text">
                                            <i class="fa-solid fa-circle-xmark"></i>
                                            Không hút thuốc
                                        </div>
                                        <div class="list_right_view_ifm_text">

                                        </div>
                                    </div>
                                    <div class="listroom_right_view_pick" style="margin-top: 80px">
                                        <div class="listroom_right_view_pick_money">${room.base_price} VND</div>


                                        <form action="ifmbook" method="get">
                                            <input type="hidden" name="roomId" value="${room.roomId}">
                                            <input type="hidden" name="checkin" value="<c:out value='${checkin}'/>">
                                            <input type="hidden" name="checkout" value="<c:out value='${checkout}'/>">
                                            <button type="submit" class="listroom_right_view_pick_button">Đặt ngay</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="line"></div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
            </c:forEach>
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
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</body>
</html>