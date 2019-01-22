<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>主要内容区main</title>
    <link rel="icon" href="images/pande.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/admin/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/admin/css/main.css"/>
    <style>
        body {
            overflow-x: hidden;
            background: #f2f0f5;
            padding: 15px 0px 10px 5px;
        }

        #main {
            font-size: 12px;
        }

        #main span.time {
            font-size: 14px;
            color: #528dc5;
            width: 100%;
            padding-bottom: 10px;
            float: left
        }

        #main div.top {
            width: 100%;
            background: url(view/images/main/main_r2_c2.jpg) no-repeat 0 10px;
            padding: 0 0 0 15px;
            line-height: 35px;
            float: left
        }

        #main div.sec {
            width: 100%;
            background: url(view/images/main/main_r2_c2.jpg) no-repeat 0 15px;
            padding: 0 0 0 15px;
            line-height: 35px;
            float: left
        }

        .left {
            float: left
        }

        #main div a {
            float: left
        }

        #main span.num {
            font-size: 30px;
            color: #538ec6;
            font-family: "Georgia", "Tahoma", "Arial";
        }

        .left {
            float: left
        }

        div.main-tit {
            font-size: 14px;
            font-weight: bold;
            color: #4e4e4e;
            background: url(view/images/main/main_r4_c2.jpg) no-repeat 0 33px;
            width: 100%;
            padding: 30px 0 0 20px;
            float: left
        }

        div.main-con {
            width: 100%;
            float: left;
            padding: 10px 0 0 20px;
            line-height: 36px;
        }

        div.main-corpy {
            font-size: 14px;
            font-weight: bold;
            color: #4e4e4e;
            background: url(view/images/main/main_r6_c2.jpg) no-repeat 0 33px;
            width: 100%;
            padding: 30px 0 0 20px;
            float: left
        }

        div.main-order {
            line-height: 30px;
            padding: 10px 0 0 0;
        }
    </style>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="main">
    <tr>
        <td colspan="2" align="left" valign="top">
            <span class="time"><strong>上午好！admin</strong><u>[超级管理员]</u></span>
            <div class="top"><span class="left">当前网站注册人数：<font color="#538ec6"><strong>288</strong></font>人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;超级管理员：<font
                    color="#538ec6"><strong>4</strong></font>人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社团管理员：<font
                    color="#538ec6"><strong>6</strong></font>人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </span>
            </div>

        </td>
    </tr>
    <tr>
        <td align="left" valign="top" width="50%">
            <div class="main-tit">社团信息</div>
            <div class="main-con">
                当前入住社团：36 个<br/>
                社团类别：5 种<br/>
                共有成员：1564 人<br/>
                程序编码：UTF-8<br/>
                <br/>
            </div>
        </td>

    </tr>

</table>
</body>
</html>