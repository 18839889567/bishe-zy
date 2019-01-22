<%@page pageEncoding="UTF-8" %>
<html>
<head>
    <script type="text/javascript" src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
    var goEasy = new GoEasy({
        appkey: "BC-2b66fbf505a54de1a1ca0b060dc1be20"
    });
    goEasy.subscribe({
        channel: "78",
        onMessage: function (message) {
            $("#text").html(message.content);

        }
    });


    $(function () {
        var goEasy = new GoEasy({
            appkey: "BC-2b66fbf505a54de1a1ca0b060dc1be20"
        });

    })

    function on() {
        var v = $("#input").val();
        goEasy.publish({
            channel: "76",
            message: v
        });
    }
</script>
<input id="input" type="text">
<input type="submit" onclick="on()"><br>
<textarea id="text"></textarea>
</body>
</html>
