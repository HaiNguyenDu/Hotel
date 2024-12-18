<%@ page import="BEAN.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="BEAN.Booking" %>
<%@ page import="DAO.BookingDao" %>
<%@ page import="DAO.RoomDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/nv.css'/>">
    <title>Document</title>
    <style>
        .final{
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            padding-right: 20px;
        }
        .list-container{
            width: 1000px;
            height: 90%;
            overflow-y: auto;

        }
        /* Form container */
		.extend-form {
		    position: absolute;
		    background: #fff;
		    border: 1px solid #ccc;
		    padding: 20px;
		    width: 300px;
		    z-index: 1000;
		    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
		    border-radius: 5px;
		}
		
		/* Header của form */
		.extend-form-header {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    cursor: move; /* Con trỏ chuột dạng kéo */
		    background-color: #f1f1f1;
		    padding: 10px;
		    border-bottom: 1px solid #ccc;
		    border-radius: 5px 5px 0 0;
		}
		
		/* Nút đóng */
		.close-btn {
		    background: transparent;
		    border: none;
		    font-size: 20px;
		    cursor: pointer;
		}

        
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo">
            <img src="https://static03-cdn.oneinventory.com/images/2022/07/dbe30a0bf14b4a67b38f09991e25aa23.png" alt="">
        </div>
        <div class="textheader">Nhân Viên</div>
        <div class="line"></div>
        <div class="listroom">Danh Sách Phòng</div>
        <div class="book">Đặt Phòng</div>
        <div class="QLTP">Quản Lý Trả Phòng</div>

    </div>
    <div class="main">
        <div class="confirm">
            <div class="confirm_text">
                Xác nhận đã thanh toán 1 củ?
            </div>
            <div class="confirm_button">
                <div class="confirm_button_ok">
                    Xác nhận
                </div>
                <div class="confirm_button_cancel">
                    Hủy
                </div>
            </div>
        </div>
        <div class="background"></div>
        <div class="ifmroom">
            <div class="ifmroom_header">Phòng 101
                <img src="https://static03-cdn.oneinventory.com/images/2022/07/dbe30a0bf14b4a67b38f09991e25aa23.png"
                     alt="">
            </div>
            <div class="main_listroom_line"></div>
            <div class="ifmroom_body">
                <div class="ifmroom_items">
                    <div class="ifmroom_items_el">Loại Phòng: VIP</div>
                    <div class="ifmroom_items_el">Số Người Lớn: 3</div>
                    <div class="ifmroom_items_el">Số Trẻ Em: 3</div>
                    <div class="ifmroom_items_el">Matxa <input type="checkbox"></div>
                    <div class="ifmroom_items_el">Buffet Sáng <input type="checkbox"></div>
                    <div class="ifmroom_items_el">Số Ngày Thuê : 3 Ngày 2 Đêm</div>

                </div>
                <div class="ifmroom_items" style="padding-left: 0;">
                    <div id="bed1" class="ifmroom_items_el">
                        <div class="main_book_room_el_text">Loại Giường</div>
                        <div class="main_book_room_el_input">
                            <div class="main_book_room_el_input_text">Giường đơn</div>
                            <input type="radio" name="typebed">
                            <div class="main_book_room_el_input_text">Giường đôi</div>
                            <input type="radio" name="typebed">
                        </div>
                    </div>
                    <div class="ifmroom_items_el">Tổng hóa đơn: 2.000.000 VND</div>
                </div>
            </div>

            <div class="ifmroom_button">
                <div class="ifmroom_button_item" id="save">Lưu</div>
                <div class="ifmroom_button_item" id="cancel">Thoát</div>
            </div>
        </div>
        <div class="main_listroom">
            <div class="main_listroom_header">
                <c:forEach var="floor" items="${roomsByFloor.keySet()}" varStatus="status">
                    <div class="main_listroom_header_item ${status.index == 0 ? 'choice' : ''}">Tầng ${floor}</div>
                </c:forEach>
            </div>
            <div class="main_listroom_line"></div>
            <div class="main_listroom_items">
                <c:forEach var="floor" items="${roomsByFloor.keySet()}" varStatus="status">
                    <div class="main_listroom_items_${status.index + 1}" style=" display: flex;">
                        <c:forEach var="roomBooking" items="${roomsByFloor.get(floor)}">
                        <c:if test="${roomBooking.status != 'Trống'}">
                                <div class="main_listroom_item" data-room-id="${roomBooking.roomId}">
                                    <div class="main_listroom_item_header">
                                        <div class="main_listroom_item_header_text">${roomBooking.roomName}</div>
                                        <div class="main_listroom_item_header_icon">
                                            <i class="fa-regular fa-pen-to-square"></i>
                                            <i class="fa-solid fa-trash"></i>
                                        </div>
                                    </div>
                                    <div class="main_listroom_item_Name">${roomBooking.customerName}</div>
                                    <div class="CCCD final"    >
                                    <div class="CCCD">${roomBooking.CCCD}</div>
                                        <div class="CCCD"> Tổng tiền: ${roomBooking.base_price} VND</div>
                                    </div>
                                    <div class="main_listroom_item_line"></div>
                                    <div class="main_listroom_item_status">${roomBooking.status}</div>
                                    <div class="main_listroom_item_check">
                                        <div class="main_listroom_item_checkin">
                                            <i class="fa-regular fa-clock"></i> Ngày nhận phòng: ${roomBooking.checkinDate}
                                        </div>
                                        <div class="main_listroom_item_checkout">
                                            <i class="fa-regular fa-clock"></i> Ngày trả phòng: ${roomBooking.checkoutDate}
                                            <div id="idrooom" style="display: none">${roomBooking.roomId}</div>
                                        </div>
                                    </div>

                                    <div class="main_listroom_item_timecheckin">Thời gian nhận phòng: 12.00 am</div>
                                    <div class="main_listroom_item_button">
                                        <form action="checkIn" method="get">
                                            <input type="hidden" name="roomId" id="rid" >
                                            <script>
                                                let x = document.querySelector("#idrooom")
                                                let y =document.querySelector("#rid")
                                                y.value = x.innerHTML
                                            </script>
                                        <button type="submit" name="roomId" class="main_listroom_item_button_checkin" style="opacity: ${roomBooking.status == 'Đã đặt' ? '1' : '0'};">Nhận Phòng</button>
                                        </form>
                                        <form action="checkout" method="get">
                                            <input type="hidden" name="roomId" id="ridd" >
                                            <script>
                                                let z = document.querySelector("#idrooom")
                                                let t =document.querySelector("#ridd")
                                                t.value = z.innerHTML
                                            </script>
                                        <button type="submit" class="main_listroom_item_button_checkout" style="opacity: ${roomBooking.status == 'Đang sử dụng' ? '1' : '0'};">Trả Phòng</button>
                                        </form>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="main_book">
            <div class="main_book_room">
                <div class="main_book_room_header">Thông tin khách hàng</div>
                <div class="main_book_room_item">
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">Họ Và Tên</div>
                        <div class="main_book_room_el_input">
                            <input type="text" id="name">
                        </div>
                    </div>
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">Ngày Sinh</div>
                        <div class="main_book_room_el_input">
                            <input type="date" id="birthday">
                        </div>
                    </div>
                    <div id="gender" class="main_book_room_el">
                        <div class="main_book_room_el_text">Giới Tính</div>
                        <div class="main_book_room_el_input">
                            <div class="main_book_room_el_input_text">Nam</div>
                            <input type="radio" id="gender1">
                            <div class="main_book_room_el_input_text">Nữ</div>
                            <input type="radio" id="gender2">
                        </div>
                    </div>
                </div>
                <div id="SDT" class="main_book_room_item">
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">SDT</div>
                        <div class="main_book_room_el_input">
                            <input type="text" id="phone">
                        </div>
                    </div>
                    <div  class="main_book_room_el">
                        <div class="main_book_room_el_text">CCCD</div>
                        <div class="main_book_room_el_input">
                            <input type="text" id="cccd">
                        </div>
                    </div>
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">Địa Chỉ</div>
                        <div class="main_book_room_el_input">
                            <input type="text" id="address">
                        </div>
                    </div>
                </div>
                <div class="main_book_room_item">
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">Email</div>
                        <div class="main_book_room_el_input">
                            <input type="text" id="email">
                        </div>
                    </div>
                </div>

            </div>
            <div class="main_book_line"></div>
            <div class="main_book_client" style="height: 280px;">
                <div class="main_book_client_header">Thông tin phòng</div>
                <div class="main_book_room_item">
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">Phòng</div>
                        <div class="main_book_room_el_input">
                            <%
                                RoomDao roomDao = new RoomDao();
                                List<Room> rooms = roomDao.getAllRoomsActive();
                            %>

                            <select id="roomId">
                                <% for (Room room : rooms) { %>
                                <option value="<%= room.getRoomId() %>"><%= room.getRoomName() %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">Ngày nhận phòng</div>
                        <div class="main_book_room_el_input">
                            <input type="date" id="checkInDate">
                        </div>
                    </div>
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">Ngày trả phòng</div>
                        <div class="main_book_room_el_input">
                            <input type="date" id="checkOutDate">
                        </div>
                    </div>
                    <div id="bed" class="main_book_room_el">
                        <div class="main_book_room_el_text">Loại Giường</div>
                        <div class="main_book_room_el_input">
                            <div class="main_book_room_el_input_text">Giường đơn</div>
                            <input type="radio" name="typebed">
                            <div class="main_book_room_el_input_text">Giường đôi</div>
                            <input type="radio" name="typebed">
                        </div>
                    </div>
                </div>
                <div class="main_book_room_item" id="ttp2">
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
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">Sử dụng matxa</div>
                        <div class="main_book_room_el_input">
                            <input type="radio" id="matxa">
                        </div>
                    </div>
                    <div class="main_book_room_el">
                        <div class="main_book_room_el_text">Ghi chú</div>
                        <div class="main_book_room_el_input">
                            <input type="text">
                        </div>
                    </div>
                </div>

            </div>
            <div class="main_book_submit" id="bookButton">
                Đặt Phòng
            </div>

            <script>
                let servicePrice = 0;
                document.addEventListener("DOMContentLoaded", function() {
                    function updateTotalAmount() {
                        if (document.getElementById('matxa').checked) {
                            servicePrice += 200000;
                        }
                    }

                    document.getElementById('matxa').addEventListener('change', function() {
                        updateTotalAmount();
                    });

                    updateTotalAmount();


                    document.getElementById('bookButton').addEventListener('click', function() {
                        let roomId = document.getElementById('roomId').value;
                        let total = servicePrice;
                        let name = document.getElementById('name').value;
                        let phone = document.getElementById('phone').value;
                        let email = document.getElementById('email').value;
                        let cccd = document.getElementById('cccd').value;
                        let birthday = document.getElementById('birthday').value;
                        let address = document.getElementById('address').value;
                        let checkInDate = document.getElementById('checkInDate').value;
                        let checkOutDate = document.getElementById('checkOutDate').value;

                        let url = '/webkhachsan/insertBookingNv?roomId=' + roomId + '&total=' + total + '&name=' + name + '&phone=' + phone + '&email=' + email + '&cccd=' + cccd + '&birthday=' + birthday + '&address=' + address + '&checkInDate=' + checkInDate + '&checkOutDate=' + checkOutDate ;

                        window.location.href = url;
                    });


                });

            </script>
        </div>
        <div class="main_QLTP">
            <div class="main_QLTP_header">
                <div class="main_QLTP_header_item">Khách hàng</div>
                <div class="main_QLTP_header_item">CCCD</div>
                <div class="main_QLTP_header_item">Phòng</div>
                <div class="main_QLTP_header_item">Thời gian nhận phòng</div>
                <div class="main_QLTP_header_item">Thời gian trả phòng</div>
            </div>
            <div class="line"></div>
            <%
                BookingDao bookingDao = new BookingDao();
                List<Booking> bookings = bookingDao.getAll();
            %>

            <div class="main_QLTP_listuser">
    <div class="list-container">
        <% for (Booking booking : bookings) { %>
        <div class="main_QLTP_listuser_item">
            <div class="main_QLTP_listuser_name"><%= booking.getCustomerName() %></div>
            <div class="main_QLTP_listuser_cccd"><%= booking.getCccd() %></div>
            <div class="main_QLTP_listuser_room"><%= booking.getRoom_name() %></div>
            <div class="main_QLTP_listuser_checkin"><%= booking.getCheckinDate() %></div>
            <div class="main_QLTP_listuser_checkout"><%= booking.getCheckoutDate() %></div>
            <div class="main_QLTP_listuser_button" onclick="showExtendForm('<%= booking.getId() %>')">Gia hạn</div>

            <!-- Form hiển thị thông tin -->
            <div id="extendForm-<%= booking.getId() %>" class="extend-form" style="display: none;">
                <div class="extend-form-header">
                    <h3>Gia hạn</h3>
                    <button class="close-btn" onclick="hideExtendForm('<%= booking.getId() %>')">&times;</button>
                </div>
                <form id="extendBookingForm-<%= booking.getId() %>">
                    <label for="textField">ID:</label><br>
                    <input type="text" id="ID-<%= booking.getId() %>" name="textField" readonly><br><br>
                    
                    <label for="textField">CCCD:</label><br>
                    <input type="text" id="CCCD-<%= booking.getId() %>" name="textField" readonly><br><br>
                    
                    <label for="textField">Name:</label><br>
                    <input type="text" id="Name-<%= booking.getId() %>" name="textField" readonly><br><br>
                    
                    <label for="textField">NameRoom:</label><br>
                    <input type="text" id="Room-<%= booking.getId() %>" name="textField" readonly><br><br>

                    <label for="dateField">Ngày gia hạn:</label><br>
                    <input type="date" id="dateField-<%= booking.getId() %>" name="dateField" required><br><br>

                    <button type="button" onclick="submitExtendForm('<%= booking.getId() %>')">Lưu</button>
                    <button type="button" onclick="hideExtendForm('<%= booking.getId() %>')">Đóng</button>
                </form>
            </div>
        </div>
        <% } %>
    </div>
</div>
            
        </div>
    </div>
</div>

</div>
<script>
    //listroom
    let line = 0;
    
 // Hiển thị form gia hạn
    function showExtendForm(bookingId) {
        const form = document.getElementById('extendForm-' + bookingId);
        form.style.top = window.scrollY + 'px'; // Hiển thị ngay dưới nút
        form.style.left =window.scrollX + 'px';
        form.style.display = 'block';

        // Kích hoạt kéo thả form
        makeDraggable(form);
        const xhr = new XMLHttpRequest();
        xhr.open("GET", "exended?id=" + bookingId, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                try {
                    const responseText = xhr.responseText;
                    const jsonStart = responseText.indexOf("{");
                    const jsonResponse = responseText.substring(jsonStart);
                    const response = JSON.parse(jsonResponse);
                    document.getElementById('ID-' + bookingId).value = response.IDBooking || '';
                    document.getElementById('CCCD-' + bookingId).value = response.CCCD || '';
                    document.getElementById('Name-' + bookingId).value = response.Name || '';
                    document.getElementById('Room-' + bookingId).value = response.Room || '';
                    document.getElementById('dateField-' + bookingId).value =  response.date || '';
                } catch (e) {
                    console.error("Error parsing response: ", e);
                    errorMessage.textContent = "Đã xảy ra lỗi. Vui lòng thử lại.";
                    submitButton.disabled = true;
                }
            }
        };
        xhr.send("id=" + encodeURIComponent(bookingId));
    }

    // Ẩn form gia hạn
    function hideExtendForm(bookingId) {
        const form = document.getElementById('extendForm-' + bookingId);
        form.style.display = 'none';
    }

    // Xử lý khi form được gửi
    function submitExtendForm(bookingId) {
        const textField = document.getElementById('textField-' + bookingId).value;
        const dateField = document.getElementById('dateField-' + bookingId).value;

        fetch('save-extended', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ info: textField, date: dateField })
        })
            .then(response => response.json())
            .then(data => {
                alert('Gia hạn thành công!');
                hideExtendForm(bookingId);
            })
            .catch(error => console.error('Error:', error));
    }

    // Hàm kéo thả form
    function makeDraggable(element) {
        let pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
        const header = element.querySelector('.extend-form-header');
        
        header.onmousedown = dragMouseDown;

        function dragMouseDown(e) {
            e.preventDefault();
            pos3 = e.clientX;
            pos4 = e.clientY;

            document.onmouseup = closeDragElement;
            document.onmousemove = elementDrag;
        }

        function elementDrag(e) {
            e.preventDefault();
            pos1 = pos3 - e.clientX;
            pos2 = pos4 - e.clientY;
            pos3 = e.clientX;
            pos4 = e.clientY;

            // Di chuyển form
            element.style.top = (element.offsetTop - pos2) + "px";
            element.style.left = (element.offsetLeft - pos1) + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }



    function choicefloor() {
        let floors = document.querySelectorAll(".main_listroom_header_item");
        let itemsContainers = document.querySelectorAll(".main_listroom_items > div");

        itemsContainers.forEach((container, index) => {
            if (index !== 0) {
                container.style.display = 'none';
            }
        });

        floors.forEach((floor, index) => {
            floor.addEventListener("click", () => {
                itemsContainers[line].style.display = 'none';

                itemsContainers[index].style.display = 'flex';

                floors[line].classList.remove('choice');
                floor.classList.add('choice');

                line = index;
            });
        });
    }

    //chon tang
    choicefloor()
    //buttoncheckout
    function checkout(floors, x, i) {
        let buttoncheckout = floors.querySelectorAll(".main_listroom_item_button_checkout")
        let status = floors.querySelectorAll(".main_listroom_item_status")
        let confirm = document.querySelector(".confirm")
        let background = document.querySelector(".background")
        let room = floors.querySelectorAll(".main_listroom_item")
        let checkoutfill = `
        <div class="main_listroom_item_header">
            <div class="main_listroom_item_header_text">Phòng ${i+1}01</div>
            <div class="main_listroom_item_header_icon" >
                <i class="fa-regular fa-pen-to-square"></i>
                <i class="fa-solid fa-trash"></i>
            </div>
        </div>
        <div class="main_listroom_item_Name">Tên Khách Hàng</div>
        <div class="CCCD">CCCD:</div>
        <div class="main_listroom_item_line"></div>
        <div class="main_listroom_item_status">Phòng Sẵn Sàng</div>

        <div class="main_listroom_item_check">
            <div class="main_listroom_item_checkin">
                <i class="fa-regular fa-clock"></i>
                Ngày nhận phòng:
            </div>
            <div class="main_listroom_item_checkout">
                <i class="fa-regular fa-clock"></i>
                Ngày trả phòng:
            </div>
        </div>
        <div class="main_listroom_item_timecheckin">Thời gian nhận phòng :</div>
        <div class="main_listroom_item_button">
            <div class="main_listroom_item_button_checkin">Nhận Phòng</div>
            <div class="main_listroom_item_button_checkout">Trả Phòng</div>
        </div>
    `
        buttoncheckout[x].addEventListener("click", () => {
            confirm.style.display = `flex`
            background.style.display = `flex`
            confirm.querySelector('.confirm_text').innerHTML = "Xác Nhận Đã Thanh Toán"

            document.querySelector(".confirm_button_ok").addEventListener("click", () => {
                let roomId = room[x].getAttribute("data-room-id");

                fetch('/checkOutBooking', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'roomId=' + roomId
                })
                    .then(response => {
                        if (response.ok) {
                            status[x].innerHTML = "Phòng Sẵn Sàng"
                            room[x].innerHTML = checkoutfill
                            floors.querySelectorAll(".main_listroom_item_button_checkout")[x].style.opacity = `0`
                            checkin()
                            xemthongtinphong()
                            confirm.style.display = `none`
                            background.style.display = `none`
                        } else {
                            console.log("error");
                        }
                    });
            });

            document.querySelector(".confirm_button_cancel").addEventListener('click', () => {
                confirm.style.display = `none`
                background.style.display = `none`
            });
        })
    }


    //buutoncheckin
    <%--function checkin() {--%>
    <%--    for (let i = 0; i < 4; i++) {--%>
    <%--        let floors = document.querySelector(`.main_listroom_items_${i + 1}`);--%>
    <%--        let buttoncheckin = floors.querySelectorAll(".main_listroom_item_button_checkin");--%>
    <%--        let confirm = document.querySelector(".confirm");--%>
    <%--        let background = document.querySelector(".background");--%>

    <%--        buttoncheckin.forEach((bci, x) => {--%>
    <%--            bci.addEventListener("click", () => {--%>
    <%--                confirm.style.display = `flex`;--%>
    <%--                background.style.display = `flex`;--%>
    <%--                confirm.querySelector('.confirm_text').innerHTML = "Xác Nhận Nhận Phòng";--%>

    <%--                let roomItem = floors.querySelectorAll(".main_listroom_item")[x];--%>
    <%--                let roomId = roomItem.getAttribute("data-room-id");--%>

    <%--                document.querySelector(".confirm_button_ok").addEventListener("click", () => {--%>
    <%--                    fetch('/checkInBooking', {--%>
    <%--                        method: 'POST',--%>
    <%--                        headers: {--%>
    <%--                            'Content-Type': 'application/x-www-form-urlencoded',--%>
    <%--                        },--%>
    <%--                        body: 'roomId=' + roomId--%>
    <%--                    })--%>
    <%--                        .then(response => {--%>
    <%--                            if (response.ok) {--%>
    <%--                                location.reload();--%>
    <%--                            } else {--%>
    <%--                                console.log("error");--%>
    <%--                            }--%>
    <%--                        });--%>
    <%--                });--%>

    <%--                document.querySelector(".confirm_button_cancel").addEventListener('click', () => {--%>
    <%--                    confirm.style.display = `none`;--%>
    <%--                    background.style.display = `none`;--%>
    <%--                });--%>
    <%--            });--%>
    <%--        });--%>
    <%--    }--%>
    <%--}--%>



    <%--checkin()--%>
    //lay time
    function getime()
    {
        let timenow = new Date()
        console.log(timenow.getHours()+"h, ")
        console.log(timenow.getMinutes()+"p")
        return timenow.getHours()+"h"+timenow.getMinutes()+"p"
    }
    //gansukienbuttonlistroom
    function eventlistroom()
    {
        document.querySelector(".listroom").addEventListener("click",()=>{
            document.querySelector(".main_listroom").style.display = `flex`
            document.querySelector(".main_QLTP").style.display =`none`
            document.querySelector(".main_book").style.display = `none`
        })
    }
    eventlistroom()
    ////gansukienbuttonbookroom
    function eventbookroom()
    {
        document.querySelector(".book").addEventListener("click",()=>{
            document.querySelector(".main_listroom").style.display = `none`
            document.querySelector(".main_QLTP").style.display =`none`
            document.querySelector(".main_book").style.display = `flex`
        })
    }
    //
    eventbookroom()
    function eventquanlytraroom()
    {
        document.querySelector(".QLTP").addEventListener("click",()=>{
            document.querySelector(".main_listroom").style.display = `none`
            document.querySelector(".main_QLTP").style.display =`block`
            document.querySelector(".main_book").style.display = `none`
        })
    }
    eventquanlytraroom()
    //
    function arrow(){
        let arrow = document.querySelector(".arrow")
        let peoplepicker = document.querySelector(".peoplepicker")
        let submit = document.querySelector('.buttonsubmit')
        arrow.addEventListener('click',()=>{
            peoplepicker.style.display =`flex`
            submit.style.display=`flex`
        })
    }
    function exitbutton(){
        let exit = document.querySelector(".exitbutton")
        let peoplepicker = document.querySelector(".peoplepicker")
        let submit = document.querySelector('.buttonsubmit')
        exit.addEventListener("click",()=>{
            peoplepicker.style.display =`none`
            submit.style.display=`none`
        })
    }
    exitbutton()
    arrow()
    //sukienchangeadult
    let  countpeople=[1,2,0]
    function change(element,elcount)
    {
        let elmain=document.querySelector(element)
        let plus = elmain.querySelector(".plus")
        let minus = elmain.querySelector(".minus")
        let count = elmain.querySelector(".count")
        plus.addEventListener("click",()=>{
            //checksonguoitoida
            let maxpeople = countpeople[0]*4 - countpeople[1]-countpeople[2]
            if(maxpeople>0||elcount==0)
            {
                countpeople[elcount]++
                count.innerHTML = countpeople[elcount]
            }

            else{
                alert("Số Người Đã Tối Đa cho Số Phòng Bạn Đặt")
            }
        })
        minus.addEventListener("click",()=>{
            let check = ((countpeople[0]-1)*4<(countpeople[1]+countpeople[2])) ? true:false
            if(check && elcount==0)
            {
                alert("Số Người Đã Tối Đa cho Số Phòng Bạn Đặt")
            }
            else if(countpeople[elcount]>1)
            {
                countpeople[elcount]--
                count.innerHTML=countpeople[elcount]
            }
            else if(elcount==2 && countpeople[elcount]>=1)
            {
                countpeople[elcount]--
                count.innerHTML=countpeople[elcount]
            }
        })
    }
    change(".changeadult",1)
    change(".changeroom",0)
    change(".changechild",2)
    //addsukietbuttonxacnhan
    function buttonsubmit(){
        let buttonsubmit = document.querySelector(".buttonsubmit")
        let room = document.querySelector(".room").querySelector(".room_item")
        let adult = document.querySelector(".adult").querySelector(".adult_item")
        let child = document.querySelector(".child").querySelector(".child_item")
        let peoplepicker = document.querySelector(".peoplepicker")
        buttonsubmit.addEventListener("click",()=>{
            room.innerHTML = countpeople[0]
            adult.innerHTML = countpeople[1]
            child.innerHTML = countpeople[2]
            peoplepicker.style.display =`none`
            buttonsubmit.style.display=`none`
        })
    }
    buttonsubmit()
    //addsukienxemthongtin
    function xemthongtinphong()
    {
        let pentosquare = document.querySelectorAll(".fa-pen-to-square")
        let listroom = document.querySelectorAll(".main_listroom_item")
        let ifmroomheader = document.querySelector(".ifmroom_header")

        pentosquare.forEach((x,i)=>{
            x.addEventListener("click",()=>{
                let textheader = listroom[i].querySelector(".main_listroom_item_header_text").textContent
                console.log(textheader)
                ifmroomheader.innerHTML = `${textheader}`
                document.querySelector(".ifmroom").style.display =`block`
                document.querySelector(".background").style.display =`flex`
            })
        })

    }

    xemthongtinphong()
    function buttonsave()
    {
        document.querySelector("#save").addEventListener("click",()=>{
            //them su kien buttonsave
        })
    }
    function buttoncancel(){
        document.querySelector("#cancel").addEventListener("click",()=>{
            document.querySelector(".ifmroom").style.display = `none`
            document.querySelector(".background").style.display =`none`
        })
    }
    buttoncancel()

</script>
</body>
</html>