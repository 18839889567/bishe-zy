<%@page pageEncoding="UTF-8" %>
<html>
<head>
    <script type="text/javascript" src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
    //获取数据
    var goEasy = new GoEasy({
        appkey: "BC-2b66fbf505a54de1a1ca0b060dc1be20"
    });
    goEasy.subscribe({
        channel: "76",
        onMessage: function (message) {
            $("#texthello").html(message.content);
        }
    });

    //发送数据
    function on() {
        var v = $("#inputhello").v85158al();
        goEasy.publish({
            channel: "78",
            message: v
        });
    }
</script>
<h2></h2>
<input id="inputhello" type="text">
<input type="submit" onclick="on()">
<hr>
<textarea id="texthello"></textarea>
</body>
</html>
