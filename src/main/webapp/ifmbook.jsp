<%@ page import="BEAN.Room" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="css/ifmbook.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:ital,wght@0,300..900;1,300..900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
  
    <title>Document</title>
</head>
<body>
    <div class="container">
            <div class="header">
                <div class="logo">
                    <img src="https://static03-cdn.oneinventory.com/images/2022/07/dbe30a0bf14b4a67b38f09991e25aa23.png" alt="">
                </div>
            </div>
            <div class="main">
                <div class="main_header">
                    <div class="main_header_item">
                        <div class="main_header_item_number"><i class="fa-solid fa-check"></i></div>
                        <div class="main_header_item_text">Tìm kiếm phòng</div>
                    </div>
                    <div class="main_header_line"></div>
                    <div class="main_header_item">
                        <div class="main_header_item_number">2</div>
                        <div class="main_header_item_text">Đặt phòng</div>
                    </div>
                    <div class="main_header_line" id="done1"></div>
                    <div class="main_header_item" id="done2">
                        <div class="main_header_item_number" >3</div>
                        <div class="main_header_item_text">Hoàn thành</div>
                    </div>
                </div>
                <div class="ifm">
                    <div class="ifm_day">
                        <div class="ifm_daycheck">
                            <div class="ifm_daycheck_left">
                                <div class="ifm_daycheck_left_header">
                                    <i class="fa-solid fa-hotel"></i>
                                    <div class="ifm_daycheck_left_header_text" >
                                    Luxury Boutique <br> Hotel</div> </div>
                                <div class="ifm_star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </div>
                                <div class="ifm_location">
                                    <i class="fa-solid fa-location-dot"></i>
                                    <div class="ifm_location_text">33 Đường Thành, Cửa Đông, Hoàn Kiếm, Hà Nội, Quận Hoàn Kiếm, Hà Nội, Việt Nam</div>
                                </div>
                            </div>
                            <div class="ifm_daycheck_right">
                                <div class="ifm_daycheck_right_header">1 Phòng, 1 Đêm, 2 Người lớn, 0 Trẻ em, 0 Em bé</div>
                                <div class="ifm_daycheck_right_check">
                                    <div class="check">
                                    <i class="fa-solid fa-calendar"></i>
                                    Nhận phòng
                                    </div>
                                    <div class="daycheckin"><c:out value='${checkin}'/></div>
                                </div>
                                <div class="ifm_daycheck_right_check">
                                    <div class="check">
                                        <i class="fa-solid fa-calendar"></i>
                                        Trả Phòng
                                        </div>
                                    <div class="daycheckin"><c:out value='${checkout}'/></div>
                                </div>
                            </div>
                        </div>
                        <div class="ifm_roompick">
                            <div class="ifm_roompick_left">
                                <input type="hidden" id="roomId" name="roomId" value="${room.roomId}">
                                <div class="ifm_roompick_header">
                                    Phòng đã chọn
                                </div>
                                <div class="ifm_roompick_name">Phòng: ${room.roomName}</div>
                                <div class="ifm_room_describe">View Beach, Advance Purchase with Breakfast</div>
                                <div class="peoplepicker">
                                    <div class="changeadult">
                                        <div class="text">Người Lớn</div>
                                        <div class="minus">-</div>
                                        <div class="count">2</div>
                                        <div class="plus">+</div>
                                    </div>
                                    <div class="changechild">
                                        <div class="text">Trẻ Em</div>
                                        <div class="minus">-</div>
                                        <div class="count">0</div>
                                        <div class="plus">+</div>
                                    </div>
                                </div>
                            </div>
                            <div class="ifm_roompick_right">
                                <div class="ifm_roompick_right_item">
                                    Breakfast
                                    <input type="checkbox">
                                </div>
                                <div class="ifm_roompick_right_item">
                                    Matxa
                                    <input type="checkbox">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="ifm_client" style="height: 550px; gap: 20px">

                        <div class="ifm_client_input">
                            <i class="fa-solid fa-user"></i>
                            <input type="text" placeholder="Tên khách hàng" id ="name">
                        </div>
                        <div class="ifm_client_input">
                            <i class="fa-solid fa-phone"></i>
                            <input type="text" placeholder="Số điện thoại" id = "SDT">
                        </div>
                        <div class="ifm_client_input">
                            <i class="fa-solid fa-envelope"></i>
                            <input type="text" placeholder="Email" id="Email">
                        </div>
                        <div class="ifm_client_input">
                            <i class="fa-solid fa-passport"></i>
                            <input type="text" placeholder="CCCD" id="CCCD">
                        </div>
                        <div class="ifm_client_input">
                            <i class="fa-solid fa-passport"></i>
                            <input type="text" placeholder="Địa chỉ" id="DC">
                        </div>
                        <div class="ifm_client_input">
                            <i class="fa-solid fa-passport"></i>
                            <input type="text" placeholder="Giới Tính" id="Gender">
                        </div>
                        <div class="ifm_client_input">
                            <i class="fa-solid fa-calendar-days"></i>
                            <input type="Date"  placeholder="Ngày sinh" id="birthday">
                        </div>

                    </div>
                </div>
                </div>
                <div class="end" style="margin-left: 230px;">
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
            3. Giờ nhận phòng sau 14h00, trả phòng trước 12h00 trưa.

                            </div>
                        </div>
                    </div>
                    <div class="bill">
                        <div class="bill_header">
                            Thông tin thanh toán
                        </div>
                        <div class="bill_room">
                            <div class="bill_room_text" >
                                <div class="bill_room_textheader">Phòng 1 : ${room.roomName} <br> ROOM</div>
                                <div class="bill_room_note">VIP ROOM WITH  VIEW <br> BEACH</div>
                            </div>
                            <div class="bill_room_money">${room.base_price}</div>
                        </div>
                        <div class="line"></div>
                        <div class="bill_money">
                            <div class="bill_money_item">
                                <div class="bill_money_item_text">Tiền phòng</div>
                                <div class="bill_money_item_money" id="base">
                                    ${room.base_price}</div>
                            </div>
                            <div class="bill_money_item">
                                <div class="bill_money_item_text">Phụ phí</div>
                                <div class="bill_money_item_money">
                                    0 ₫</div>
                            </div>
                            <div class="bill_money_item">
                                <div class="bill_money_item_text">Dịch vụ</div>
                                <div class="bill_money_item_money" id="service">
                                  0 ₫</div>
                            </div>
                            <div class="bill_money_item">
                                <div class="bill_money_item_text">Khuyến mãi</div>
                                <div class="bill_money_item_money">
                                   0 ₫</div>
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="bill_result">
                            <div class="bill_result_text">Tổng thanh toán</div>
                            <div class="bill_result_money" id="total">
                                10.300.000 ₫</div>
                            <input type="hidden" id="totalRes">
                        </div>
                        <div class="buttonsubmit" id="bookButton">Đặt phòng</div>
                    </div>
                </div>
               
            </div>
    </div>
    <script src="js/ifmbook.js"></script>
    <script>
    let countpeople = [1, 2, 0];
    function change(element, elcount) {
        let elmain = document.querySelector(element);
        let plus = elmain.querySelector(".plus");
        let minus = elmain.querySelector(".minus");
        let count = elmain.querySelector(".count");
        plus.addEventListener("click", () => {
            let maxpeople = countpeople[0] * 4 - countpeople[1] - countpeople[2];
            if (maxpeople > 0 || elcount == 0) {
                countpeople[elcount]++;
                count.innerHTML = countpeople[elcount];
            } else {
                alert("Số Người Đã Tối Đa cho Số Phòng Bạn Đặt");
            }
        });
        minus.addEventListener("click", () => {
            let check = ((countpeople[0] - 1) * 4 < (countpeople[1] + countpeople[2])) ? true : false;
            if (check && elcount == 0) {
                alert("Số Người Đã Tối Đa cho Số Phòng Bạn Đặt");
            } else if (countpeople[elcount] > 1) {
                countpeople[elcount]--;
                count.innerHTML = countpeople[elcount];
            } else if (elcount == 2 && countpeople[elcount] >= 1) {
                countpeople[elcount]--;
                count.innerHTML = countpeople[elcount];
            }
        });
    }
    change(".changeadult", 1);
    change(".changechild", 2);
        document.addEventListener("DOMContentLoaded", function() {
            let basePrice = parseFloat(document.querySelector('.bill_room_money').innerText);
            document.getElementById('base').innerText = basePrice.toLocaleString('vi-VN') + ' ₫';

            function isValidPhoneNumber(phoneNumber) {
                const phonePattern = /^0\d{9}$/;
                return phonePattern.test(phoneNumber);
            }

            function isValidCCCD(cccd) {
                const cccdPattern = /^0\d{11}$/;
                return cccdPattern.test(cccd);
            }

            function isValidEmail(email) {
                const emailPattern = /^[^\s@]+@gmail\.com$/;
                return emailPattern.test(email);
            }

            function isFieldEmpty(fieldValue) {
                return !fieldValue.trim();
            }

            function isValidBirthday(birthday) {
                const year = parseInt(birthday.split('-')[0], 10);
                return year > 1930 && year < 2006;
            }

            function validateForm(name, phone, email, cccd, birthday) {
                if (isFieldEmpty(name) || isFieldEmpty(phone) || isFieldEmpty(email) || isFieldEmpty(cccd) || isFieldEmpty(birthday)) {
                    alert("Vui lòng điền tất cả các trường.");
                    return false;
                }

                if (!isValidPhoneNumber(phone)) {
                    alert("Số điện thoại không hợp lệ. Số điện thoại phải có 10 chữ số và bắt đầu bằng số 0.");
                    return false;
                }

                if (!isValidCCCD(cccd)) {
                    alert("CCCD không hợp lệ. CCCD phải có 12 chữ số và bắt đầu bằng số 0.");
                    return false;
                }

                if (!isValidEmail(email)) {
                    alert("Email không hợp lệ. Email phải thuộc miền @gmail.com.");
                    return false;
                }

                if (!isValidBirthday(birthday)) {
                    alert("Năm sinh phải lớn hơn 1930 và bé hơn 2006.");
                    return false;
                }

                return true;
            }

            function updateTotalAmount() {
                let servicePrice = 0;
                if (document.querySelector('.ifm_roompick_right_item:nth-child(1) input').checked) {
                    servicePrice += 250000;
                }
                if (document.querySelector('.ifm_roompick_right_item:nth-child(2) input').checked) {
                    servicePrice += 200000;
                }
                let totalAmount = basePrice + servicePrice;

                document.getElementById('service').innerText = servicePrice.toLocaleString('vi-VN') + ' ₫';
                document.getElementById('total').innerText = totalAmount.toLocaleString('vi-VN') + ' ₫';
                document.getElementById('totalRes').value = totalAmount;
            }

            document.querySelector('.ifm_roompick_right_item:nth-child(1) input').addEventListener('change', updateTotalAmount);
            document.querySelector('.ifm_roompick_right_item:nth-child(2) input').addEventListener('change', updateTotalAmount);

            updateTotalAmount();

            document.getElementById('bookButton').addEventListener('click', function() {
                let roomId = document.getElementById('roomId').value;
                let total = document.getElementById('totalRes').value;
                let name = document.querySelector('.ifm_client_input:nth-child(1) input').value;
                let phone = document.querySelector('.ifm_client_input:nth-child(2) input').value;
                let email = document.querySelector('.ifm_client_input:nth-child(3) input').value;
                let cccd = document.querySelector('.ifm_client_input:nth-child(4) input').value;
                let dc = document.querySelector('.ifm_client_input:nth-child(5) input').value;
                let gender = document.querySelector('.ifm_client_input:nth-child(6) input').value;
                let birthday = document.querySelector('.ifm_client_input:nth-child(7) input').value;

                let checkin = '<c:out value="${checkin}"/>';
                let checkout = '<c:out value="${checkout}"/>';

                if (validateForm(name, phone, email, cccd, birthday)) {
                    let url = '/webkhachsan/insertBooking?roomId=' + roomId +
                        '&Gender=' + gender +
                        '&Dc=' + dc +
                        '&total=' + total +
                        '&name=' + name +
                        '&phone=' + phone +
                        '&email=' + email +
                        '&cccd=' + cccd +
                        '&birthday=' + birthday +
                        '&daycheckin=' + checkin +
                        '&daycheckout=' + checkout;
                    window.location.href = url;
                }
            });
        });
    </script>
</body>
</html>