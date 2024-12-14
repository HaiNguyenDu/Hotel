<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/10/2024
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-weight: 500;
            font-family: "Be Vietnam Pro", sans-serif;

            caret-color: transparent;

        }

        .container{
            width: 100%;
            position: relative;

        }



        .header{
            width: 100%;
            height: 80px;
            background-color:rgba(255, 255, 255,0.4);
            border: 2px;
            display: flex;
            position: absolute;
            justify-content: space-around;
            color: rgb(25, 117, 49);

        }
        .header_items_item{
            cursor: pointer;
        }
        .header_items_left,.header_items_right{
            width: 300px;
            height: 100%;
            display: flex;
            font-size: 20px;
            align-items: center;
            gap: 20px;
        }
        .biglogo img{
            width: 12vw;
            position: relative;
            left: 50%;
            transform:translateX(-50%);

        }
        .header_items_right .box{
            color: white;
            padding: 4px 13px;
            background-color: #00554C;
            border: 1px;
            border-style: solid;
        }
        .header_item:hover{

            cursor: pointer;
            color:#c99246;
        }
        .header_items_right .box:hover{
            background-color:#c99246;
            color: white;
            transition-duration: 0.5s;
        }
        .body1{
            width: 100%;
            height:100vh;
            background-image: url("https://nestahotel.com.vn/uploads/content/Hotel%20&%20Spa/Overview_4.jpg");
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .body1 img{
            width: 100%;
        }
        .body2{
            width: 100%;
            position: relative;
        }
        .body2_item1{
            width: 100%;
            height: 30vw;
            background-color: #FFF2DD;
            position: relative;
        }
        .textlogo{
            width: 20vw;
            margin: 0 auto;
        }
        .body2_item1 img{
            width: 20vw;
            margin-top: 30px;

        }
        .body2_item2{
            width: 100%;
            height: 10vw;
        }
        .tb{
            width: 500px;
            height: 300px;
            font-size: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            color: #00554C;
            font-weight: 600;
            box-shadow:5px 5px 10px rgba(0,0,0,0.5) ;
            background-color: white;
        }
        .body1_header{
            font-size: 48px;

        }
        .text{
            margin-top: 30px;
            font-size: 22px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">



        <div class="biglogo">
            <img src="https://peridotgrandhotel.com/wp-content/uploads/2022/08/logo-02-1.png" alt="">
        </div>

    </div>
</div>
<div class="body1">
    <div class="tb">
        <div class="body1_header"> Đặt phòng thành công </div>
        <div class="text">bạn sẽ chuyển về trang chính sau 5s</div>
    </div>
</div>


</div>
<script>
    function dem() {
        let x = 5;
        const interval = setInterval(() => {
            let el = document.querySelector(".text");
            if (el) {
                el.innerHTML = `bạn sẽ chuyển về trang nhân viên sau `+(x--)+"s";
                if (x < 0) {
                    clearInterval(interval);

                    window.location.href = "http://localhost:8080/webkhachsan/nv";
                }
            }
        }, 1000);

    }
    dem()



</script>
</body>
</html>
